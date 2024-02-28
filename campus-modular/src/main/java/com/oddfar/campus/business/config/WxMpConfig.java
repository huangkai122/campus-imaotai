package com.oddfar.campus.business.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author Binary Wang
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "wx")
public class WxMpConfig {
  private String token;
  private String appid;
  private String appSecret;
  private String aesKey;
  /**
   * 微信模版id
   */
  private String templateId;
}
