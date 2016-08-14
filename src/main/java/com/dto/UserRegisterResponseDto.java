package com.dto;

import com.contanst.CommonConstant;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

/**
 * Created by zhangbiao537 on 2016/8/9.
 */
public class UserRegisterResponseDto extends ResponseBaseDto {
    private String status = CommonConstant.ZERO;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
