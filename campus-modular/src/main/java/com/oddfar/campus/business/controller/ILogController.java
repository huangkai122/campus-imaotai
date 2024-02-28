package com.oddfar.campus.business.controller;

import com.oddfar.campus.business.entity.ILog;
import com.oddfar.campus.business.mapper.ILogMapper;
import com.oddfar.campus.business.service.IMTLogService;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * I茅台日志Controller
 *
 * @author oddfar
 * @date 2023-08-01
 */
@RestController
@RequestMapping("/imt/log")
@ApiResource(name = "I茅台日志Controller")
public class ILogController {
    @Autowired
    private IMTLogService logService;
    @Autowired
    private ILogMapper logMapper;

    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/list", name = "操作日志-分页")
    public R list(ILog log) {
        PageResult<ILog> page = logService.page(log);
        return R.ok().put(page);
    }

    @GetMapping(value = "/ilist", name = "操作日志-分页")
    @Anonymous
    public R ilist(ILog log) {
        Long mobile = log.getMobile();
        if (mobile==null){
            return R.error("参数不能为空：mobile");
        }
        PageResult<ILog> page = logMapper.selectPage(log);;
        return R.ok().put(page);
    }


    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/{operIds}", name = "操作日志-删除")
    public R remove(@PathVariable Long[] operIds) {
        return R.ok(logService.deleteLogByIds(operIds));
    }

    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/clean", name = "操作日志-清空")
    public R clean() {
        logService.cleanLog();
        return R.ok();
    }

}
