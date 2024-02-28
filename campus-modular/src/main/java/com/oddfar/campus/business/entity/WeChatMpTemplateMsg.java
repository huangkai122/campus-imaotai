package com.oddfar.campus.business.entity;

import lombok.Data;

import java.util.Map;

/**
 * 微信模板消息
 *
 * @author Eric
 * @date 2024-02-23
 */
@Data
public class WeChatMpTemplateMsg {
    private String templateId;
    private Map<String, WechatMpTemplateMsgField> fieldMap;
    private String url;
    private MiniProgram miniProgram;
}
