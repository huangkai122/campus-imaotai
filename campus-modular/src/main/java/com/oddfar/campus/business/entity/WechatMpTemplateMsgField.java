package com.oddfar.campus.business.entity;

import lombok.Data;

/**
 * 微信模板消息
 *
 * @author Eric
 * @date 2024-02-23
 */
@Data
public class WechatMpTemplateMsgField {
    private String key;
    private String value;
    private String color;

    public WechatMpTemplateMsgField() {
    }

    public WechatMpTemplateMsgField(String key) {
        this(key, "");
    }

    public WechatMpTemplateMsgField(String key, String value, String color) {
        this.key = key;
        this.value = value;
        this.color = color;
    }

    public WechatMpTemplateMsgField(String key, String value) {
        this(key, value, "");
    }
}
