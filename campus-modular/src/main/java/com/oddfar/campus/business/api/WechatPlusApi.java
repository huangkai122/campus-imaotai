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
        String title, content, mobile;
        if (operLog.getStatus() == 0) {
            //预约成功
            title = iUser.getRemark() + "-i茅台执行成功";
            content = iUser.getMobile() + System.lineSeparator() + operLog.getLogContent();
            mobile = iUser.getMobile().toString();
            AsyncManager.me().execute(sendNotice(token, title, content, mobile));
        } else {
            //预约失败
            title = iUser.getRemark() + "-i茅台执行失败";
            content = iUser.getMobile() + System.lineSeparator() + operLog.getLogContent();
            mobile = iUser.getMobile().toString();
            AsyncManager.me().execute(sendNotice(token, title, content, mobile));
        }


    }


    public static TimerTask sendNotice(String token, String title, String content, String mobile) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();

        WeChatMpTemplateMsg template = new WeChatMpTemplateMsg();
        template.setTemplateId(SpringUtils.getBean(WxMpConfig.class).getTemplateId());

        Map<String, WechatMpTemplateMsgField> map=new HashMap<>();
        map.put("thing8",new WechatMpTemplateMsgField("thing8", title));
        map.put("time6",new WechatMpTemplateMsgField("time6", sdf.format(currentDate)));
        map.put("thing10",new WechatMpTemplateMsgField("thing10", mobile));

        template.setFieldMap(map);

        template.setUrl("https://imaotai.shequ119.com");
        return new TimerTask() {
            @Override
            public void run() {
                SpringUtils.getBean(IWechatService.class).sendTemplateMessage(token, template);
            }
        };
    }

}
