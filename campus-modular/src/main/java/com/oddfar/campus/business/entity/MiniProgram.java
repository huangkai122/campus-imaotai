package com.oddfar.campus.business.entity;

import lombok.Data;


/**
 * 微信模板消息
 *
 * @author Eric
 * @date 2024-02-23
 */
@Data
public class MiniProgram {
    private String appid;
    private String pagePath;
    private boolean usePath = false;
}


