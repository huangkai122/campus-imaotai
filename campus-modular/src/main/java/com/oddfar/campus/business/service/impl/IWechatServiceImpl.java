package com.oddfar.campus.business.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson2.JSONObject;
import com.oddfar.campus.business.entity.IUser;
import com.oddfar.campus.business.entity.IWechat;
import com.oddfar.campus.business.entity.WeChatMpTemplateMsg;
import com.oddfar.campus.business.mapper.IUserMapper;
import com.oddfar.campus.business.mapper.IWechatMapper;
import com.oddfar.campus.business.service.IUserService;
import com.oddfar.campus.business.service.IWechatService;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.utils.SecurityUtils;
import com.oddfar.campus.common.utils.StringUtils;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class IWechatServiceImpl implements IWechatService {
    @Autowired
    private IWechatMapper iWechatMapper;
    @Autowired
    private WxMpService wxMpService;

    @Override
    public int insertIWechat(IWechat iWechat) {

        IWechat wechat = iWechatMapper.selectOne("open_id", iWechat.getOpenId());
        if (wechat != null) {
            iWechat.setId(wechat.getId());
            iWechat.setIsSubscribe(1);
            return iWechatMapper.updateById(iWechat);
        }

        iWechat.setOpenId(iWechat.getOpenId());
        iWechat.setIsSubscribe(1);
        return iWechatMapper.insert(iWechat);
    }

    @Override
    public int updateIWechat(IWechat iWechat) {
        return iWechatMapper.updateById(iWechat);
    }

    @Override
    public String sendTemplateMessage(String toUserOpenId, WeChatMpTemplateMsg template) {
        WxMpTemplateMessage wxMpTemplateMessage = WxMpTemplateMessage.builder()
                .templateId(template.getTemplateId())
                .toUser(toUserOpenId)
                .url(template.getUrl())
                .build();

        // 填充模板消息中的变量
        template.getFieldMap().forEach((key, value) -> wxMpTemplateMessage
                .addData(new WxMpTemplateData(key, value.getValue())));

        try {
            return wxMpService.getTemplateMsgService().sendTemplateMsg(wxMpTemplateMessage);
        } catch (WxErrorException e) {
            return e.getMessage();
        }
    }
}
