package com.dto;

import com.contanst.CommonConstant;
import com.model.ProductInfo;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

import java.util.List;

/**
 * Created by zhangbiao537 on 2016/8/10.
 */
public class ProSearchResponseDto extends ResponseBaseDto {
    private String status = CommonConstant.ZERO;
    private List<ProductInfo> proList;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public List<ProductInfo> getProList() {
        return proList;
    }

    public void setProList(List<ProductInfo> proList) {
        this.proList = proList;
    }
}
