package com.oddfar.campus.business.entity;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.oddfar.campus.common.domain.BaseEntity;
import com.oddfar.campus.common.utils.StringUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 微信用户信息 i_wechat
 *
 * @author Eric
 * @date 2024-02-23
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("i_wechat")
public class IWechat extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId
    private Long id;

    /**
     * 微信openid
     */
    private String openId;

    /**
     * 用户手机号
     */
    private Long userMobile;

    /**
     * 关注状态
     */
    private Integer isSubscribe;

}
