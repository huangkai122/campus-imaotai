package com.oddfar.campus.business.service;

import com.alibaba.fastjson2.JSONObject;
import com.oddfar.campus.business.entity.IUser;
import com.oddfar.campus.business.entity.IWechat;
import com.oddfar.campus.business.entity.WeChatMpTemplateMsg;
import com.oddfar.campus.common.domain.PageResult;

import java.util.List;

public interface IWechatService {

    /**
     * 添加微信用户
     *
     * @param iWechat
     * @return
     */
    int insertIWechat(IWechat iWechat);

    /**
     * 修改微信用户
     *
     * @param iWechat 微信用户
     * @return 结果
     */
    int updateIWechat(IWechat iWechat);
    String sendTemplateMessage(String toUserOpenId, WeChatMpTemplateMsg template);

    IWechat getWechatInfo(String openId);

}
