package com.oddfar.campus.business.handler;

import com.oddfar.campus.business.entity.IWechat;
import com.oddfar.campus.business.mapper.IWechatMapper;
import com.oddfar.campus.business.service.IWechatService;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author Binary Wang
 */
@Component
public class UnsubscribeHandler extends AbstractHandler {
  @Autowired
  private IWechatService wechatService;
  @Autowired
  private IWechatMapper iWechatMapper;

  @Override
  public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage,
                                  Map<String, Object> context, WxMpService wxMpService,
                                  WxSessionManager sessionManager) {
    String openId = wxMessage.getFromUser();
    this.logger.info("取消关注用户 OPENID: " + openId);
    // TODO 可以更新本地数据库为取消关注状态
    try {
      // TODO 可以添加关注用户到本地
      IWechat wechatInfo = iWechatMapper.selectOne("open_id", openId);
      System.out.println(wechatInfo);
      if (wechatInfo != null) {
        IWechat wechat = new IWechat();
        wechat.setId(wechatInfo.getId());
        wechat.setIsSubscribe(0);
        wechatService.updateIWechat(wechat);
      }
    } catch (Exception e){
      this.logger.error(e.getMessage(), e);
    }
    return null;
  }

}
