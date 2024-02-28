package com.oddfar.campus.business.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.oddfar.campus.business.api.WechatPlusApi;
import com.oddfar.campus.business.config.WxMpConfig;
import com.oddfar.campus.business.entity.ILog;
import com.oddfar.campus.business.entity.IUser;
import com.oddfar.campus.business.entity.WeChatMpTemplateMsg;
import com.oddfar.campus.business.entity.WechatMpTemplateMsgField;
import com.oddfar.campus.business.mapper.ILogMapper;
import com.oddfar.campus.business.mapper.IUserMapper;
import com.oddfar.campus.business.service.IMTService;
import com.oddfar.campus.business.service.IShopService;
import com.oddfar.campus.business.service.IWechatService;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.annotation.Log;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.framework.manager.AsyncManager;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/test")
@ApiResource(name = "测试", appCode = "test", resBizType = ResBizTypeEnum.BUSINESS)
@Log(openLog = false)
public class TestController {

    @Autowired
    private IUserMapper iUserMapper;
    @Autowired
    private IMTService imtService;
    @Autowired
    private IShopService iShopService;
    @Autowired
    private ILogMapper logMapper;
    @Autowired
    private WxMpService wxMpService;
    @Autowired
    private WxMpConfig wxMpConfig;
    @Autowired
    private IWechatService wechatService;

    /**
     * 需要接口权限
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/1", name = "测试1的接口")
    public R test1() {

        return R.ok();
    }

    /**
     * 需要 'campus:test' 权限字符串
     */
    @PreAuthorize("@ss.hasPermi('campus:test')")
    @GetMapping(value = "/2", name = "测试2的接口")
    public R test2() {

        return R.ok();
    }

    /**
     * 匿名接口，不需要认证，所有人都可访问
     */
    @Anonymous
    @GetMapping(value = "/3", name = "测试3的接口")
    public R test3() {
//        iShopService.selectShopList();
        IUser user = iUserMapper.selectById("13663511605");
        ILog iLog = logMapper.selectById("1759022417832337410");
        WechatPlusApi.sendNotice(user,iLog);


//        String title, content;
//        if (iLog.getStatus() == 0) {
//            //预约成功
//            title = user.getRemark() + "-i茅台执行成功";
//            content = user.getMobile() + System.lineSeparator() + iLog.getLogContent();
//        } else {
//            //预约失败
//            title = user.getRemark() + "-i茅台执行失败";
//            content = user.getMobile() + System.lineSeparator() + iLog.getLogContent();
//        }
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date currentDate = new Date();
//
////        WechatPlusApi.sendNotice(user, iLog);
////        WechatPlusApi wechatPlusApi = new WechatPlusApi();
////        wechatPlusApi.sendNotice(user, iLog);
//
//        WeChatMpTemplateMsg template = new WeChatMpTemplateMsg();
//        template.setTemplateId(wxMpConfig.getTemplateId());
//
//
//
//
//
//        Map<String, WechatMpTemplateMsgField> map=new HashMap<>();
//        map.put("thing8",new WechatMpTemplateMsgField("thing8", title));
//        map.put("time6",new WechatMpTemplateMsgField("time6", sdf.format(currentDate)));
//        map.put("thing10",new WechatMpTemplateMsgField("thing10", user.getMobile().toString()));
//
//        template.setFieldMap(map);
//
//        template.setUrl("https://imaotai.shequ119.com");
//        String s = wechatService.sendTemplateMessage(user.getPushPlusToken(), template);
//        System.out.println(s);

        return R.ok();
    }
}
