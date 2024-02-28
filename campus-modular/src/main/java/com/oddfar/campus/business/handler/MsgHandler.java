package com.oddfar.campus.business.handler;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONUtil;
import com.oddfar.campus.business.builder.TextBuilder;
import com.oddfar.campus.business.service.WeixinService;
import com.oddfar.campus.common.core.RedisCache;
import lombok.AllArgsConstructor;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Binary Wang
 */
@Component
@AllArgsConstructor
public class MsgHandler extends AbstractHandler {

	@Autowired
	RedisCache redisCache;

	@Override
	public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage,
									Map<String, Object> context, WxMpService wxMpService,
									WxSessionManager sessionManager) {

		WeixinService weixinService = (WeixinService) wxMpService;

		if (!wxMessage.getMsgType().equals(WxConsts.XmlMsgType.EVENT)) {
			//TODO 可以选择将消息保存到本地
		}

		//当用户输入关键词如“你好”，“客服”等，并且有客服在线时，把消息转发给在线客服
		if (StringUtils.startsWithAny(wxMessage.getContent(), "你好", "客服")
			&& weixinService.hasKefuOnline()) {
			return WxMpXmlOutMessage
				.TRANSFER_CUSTOMER_SERVICE().fromUser(wxMessage.getToUser())
				.toUser(wxMessage.getFromUser()).build();
		}

		//TODO 组装回复消息
//	  String content = mpService.getContent(wxMessage.getContent(),wxMessage.getFromUser());
//	  String content = mpService.getContent(wxMessage);
		String bookName = wxMessage.getContent();
		String msg = "暂无信息~";
		String redisKey = "zhelper:" + wxMessage.getFromUser();
		if(StrUtil.isNumeric(bookName)){
			int num = Integer.parseInt(bookName);
			if(num>=1 && num<=8){
				try {
					msg = redisCache.getCacheObject(redisKey + ":" + num).toString();
				}catch (Exception e){
					msg = "链接已失效，请发送【书名】重新获取";
				}
			}
		}else {
			Map<String, Object> params = new HashMap<>();
			params.put("keyword", bookName);
			params.put("page", 1);
			params.put("sensitive", false);

			StringBuilder content = new StringBuilder(" ");
			try {
				String bookInfo = HttpRequest
					.post("https://worker.zlib.app/api/search")
					.body(JSONUtil.toJsonStr(params))
					.execute()
					.body();
				Object data = JSONUtil.parse(bookInfo).getByPath("data");
				List<Map> dataMap = JSONUtil.toList(JSONUtil.toJsonStr(data), Map.class);
				if (!dataMap.isEmpty()) {
					for (int i = 1; i < 9; i++) {
						content.append(i + "、 《" + dataMap.get(i).get("title") + "》");
						content.append(" 【作者：" + dataMap.get(i).get("author") + "】\r\n\n");
//				content.append("出版社：" + dataMap.get(i).get("publisher") + "\r\n");
//				content.append("格式：" + dataMap.get(i).get("extension") + "\r\n");
//				content.append("来源：" + dataMap.get(i).get("source") + "\r\n");
//				content.append(dataMap.get(i).get("year") + "年出版\r\n");
//						redisCache.setCacheObject(redisKey + ":" + i, "https://worker.zlib.app/download/" + dataMap.get(i).get("id"), 300);
					}
					content.append("\n\n回复【序号】获取下载链接");
					msg = content.toString();
				}

				int length = StrUtil.length(msg);
				if (length > 900) {
					msg = "内容字数超限,无法返回~";
				}
			}catch (Exception e){
				logger.info(e.getMessage());
				msg = "查询失败，请稍后再试~";
			}
		}

		return new TextBuilder().build(msg, wxMessage, weixinService);
//		return new NewsBuilder().build(jsonStr, wxMessage, weixinService);
	}
}
