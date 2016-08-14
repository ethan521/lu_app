package com.dto;

import com.contanst.CommonConstant;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

/**
 * Created by zhangbiao537 on 2016/8/10.
 */
public class ProductOnlineDto extends ResponseBaseDto {
    private String mes;

    private String status = CommonConstant.ZERO;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }
}
