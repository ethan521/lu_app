package com.dto;

import com.contanst.CommonConstant;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

/**
 * Created by caochengyuan672 on 2016/8/9.
 */
public class LoginOutResponseDto extends ResponseBaseDto {
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private String status = CommonConstant.ZERO;
}
