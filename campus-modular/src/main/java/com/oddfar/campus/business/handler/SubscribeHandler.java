package com.oddfar.campus.business.handler;

import com.oddfar.campus.business.builder.TextBuilder;
import com.oddfar.campus.business.entity.IUser;
import com.oddfar.campus.business.entity.IWechat;
import com.oddfar.campus.business.mapper.IUserMapper;
import com.oddfar.campus.business.mapper.IWechatMapper;
import com.oddfar.campus.business.service.IWechatService;
import com.oddfar.campus.business.service.WeixinService;
import com.oddfar.campus.common.utils.SecurityUtils;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author Binary Wang
 */
@Component
public class SubscribeHandler extends AbstractHandler {

  @Autowired
  private IWechatService wechatService;

  @Override
  public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService,
                                  WxSessionManager sessionManager) throws WxErrorException {

    this.logger.info("新关注用户 OPENID: " + wxMessage.getFromUser());

    WeixinService weixinService = (WeixinService) wxMpService;

    // 获取微信用户基本信息
    WxMpUser userWxInfo = weixinService.getUserService().userInfo(wxMessage.getFromUser(), null);

    if (userWxInfo != null) {
      try {
        // TODO 可以添加关注用户到本地
        System.out.println(userWxInfo);
        IWechat wechat = new IWechat();
        wechat.setOpenId(userWxInfo.getOpenId());
        wechatService.insertIWechat(wechat);
      } catch (Exception e){
        this.logger.error(e.getMessage(), e);
      }
    }

    WxMpXmlOutMessage responseResult = null;
    try {
      responseResult = handleSpecial(wxMessage);
    } catch (Exception e) {
      this.logger.error(e.getMessage(), e);
    }

    if (responseResult != null) {
      return responseResult;
    }

    try {
      String message = "感谢关注\r\n发送【书名】获取电子书\r\n如：三体";
//		String message = "感谢关注";
      return new TextBuilder().build(message, wxMessage, weixinService);
    } catch (Exception e) {
      this.logger.error(e.getMessage(), e);
    }

    return null;
  }

  /**
   * 处理特殊请求，比如如果是扫码进来的，可以做相应处理
   */
  protected WxMpXmlOutMessage handleSpecial(WxMpXmlMessage wxMessage) throws Exception {
    //TODO
    return null;
  }

}
