package com.oddfar.campus.business.api;

import cn.hutool.http.HttpUtil;
import com.oddfar.campus.business.config.WxMpConfig;
import com.oddfar.campus.business.entity.ILog;
import com.oddfar.campus.business.entity.IUser;
import com.oddfar.campus.business.entity.WeChatMpTemplateMsg;
import com.oddfar.campus.business.entity.WechatMpTemplateMsgField;
import com.oddfar.campus.business.service.IWechatService;
import com.oddfar.campus.business.service.WeixinService;
import com.oddfar.campus.business.service.impl.IWechatServiceImpl;
import com.oddfar.campus.common.utils.SpringUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.framework.manager.AsyncManager;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimerTask;

/**
 * @author eric
 */
public class WechatPlusApi {

    public static void sendNotice(IUser iUser, ILog operLog) {
        String token = iUser.getPushPlusToken();
        if (StringUtils.isEmpty(token)) {
            return;
        }
        String title, content, url, mobile;
        String templateId = SpringUtils.getBean(WxMpConfig.class).getTemplateId();
        if (operLog.getStatus() == 0) {
            //预约成功
            title = iUser.getRemark() + "-i茅台执行成功";
//            content = iUser.getMobile() + System.lineSeparator() + operLog.getLogContent();
            url = "https://imaotai.shequ119.com";
            AsyncManager.me().execute(sendNotice(iUser, title, url, templateId));
        } else {
            //预约失败
            title = iUser.getRemark() + "-i茅台执行失败";
//            content = iUser.getMobile() + System.lineSeparator() + operLog.getLogContent();
            url = "https://imaotai.shequ119.com";
            AsyncManager.me().execute(sendNotice(iUser, title, url, templateId));
        }


    }


    public static TimerTask sendNotice(IUser iUser, String title, String url, String templateId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();

        WeChatMpTemplateMsg template = new WeChatMpTemplateMsg();
        template.setTemplateId(templateId);

        Map<String, WechatMpTemplateMsgField> map=new HashMap<>();
        if (templateId.equals(SpringUtils.getBean(WxMpConfig.class).getTemplateId())) {
            map.put("thing8", new WechatMpTemplateMsgField("thing8", title));
            map.put("time6", new WechatMpTemplateMsgField("time6", sdf.format(currentDate)));
            map.put("thing10", new WechatMpTemplateMsgField("thing10", iUser.getMobile().toString()));
        }else{
            map.put("character_string14", new WechatMpTemplateMsgField("character_string14", iUser.getMobile().toString()));
            map.put("thing6", new WechatMpTemplateMsgField("thing6", title));
            map.put("thing4", new WechatMpTemplateMsgField("thing4", "高"));
            map.put("time5", new WechatMpTemplateMsgField("time5", sdf.format(iUser.getExpireTime())));
        }
        template.setFieldMap(map);

        if(url!=null) {
            template.setUrl(url);
        }

        return new TimerTask() {
            @Override
            public void run() {
                SpringUtils.getBean(IWechatService.class).sendTemplateMessage(iUser.getPushPlusToken(), template);
            }
        };
    }

}
