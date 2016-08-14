package com.dto;

import com.contanst.CommonConstant;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

/**
 * Created by hucheng626 on 2016/8/5.
 */
public class LoginResponseDto extends ResponseBaseDto {
    private String status = CommonConstant.ZERO;
    private Integer errorTime = null;
    private Integer remainUnlockTime = null;
    public Integer getRemainUnlockTime() {
        return remainUnlockTime;
    }

    public void setRemainUnlockTime(Integer remainUnlockTime) {
        this.remainUnlockTime = remainUnlockTime;
    }

    public Integer getErrorTime() {
        return errorTime;
    }

    public void setErrorTime(Integer errorTime) {
        this.errorTime = errorTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
