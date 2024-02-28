package com.oddfar.campus.business.builder;

import cn.hutool.json.JSONUtil;
import com.oddfar.campus.business.service.WeixinService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutNewsMessage;

import java.util.List;

/**
 * @author Binary Wang
 */
public class NewsBuilder extends AbstractBuilder {

	@Override
	public WxMpXmlOutMessage build(String content, WxMpXmlMessage wxMessage,
								   WeixinService service) {
		List<WxMpXmlOutNewsMessage.Item> list = JSONUtil.toList(content, WxMpXmlOutNewsMessage.Item.class);
		WxMpXmlOutNewsMessage.Item item = new WxMpXmlOutNewsMessage.Item();
		WxMpXmlOutNewsMessage m = WxMpXmlOutMessage.NEWS().articles(list)
			.fromUser(wxMessage.getToUser()).toUser(wxMessage.getFromUser())
			.build();
		return m;
	}

}
