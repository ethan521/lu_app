package com.biz.order;

import com.mapper.ProductInfoMapper;
import com.model.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by hucheng626 on 2016/8/11.
 */
@Service("shdlJob")
public class ShdlJob {
    @Autowired
    ProductInfoMapper productInfoMapper;
    public void job() {
        List<ProductInfo> on_product_list = productInfoMapper.selectProductByStatus("0");
        List<ProductInfo> down_product_list = productInfoMapper.selectProductByStatus("1");
        Date curTime = new Date();

        for (ProductInfo product : on_product_list) {
            //product.getProductLife();
            //product.getSaleTime();
            Date proSaleTime = product.getSaleTime();
            if (curTime.after(proSaleTime) || curTime.equals(proSaleTime)) {
                //产品上架
                productInfoMapper.updateProductStatus(product.getProductName(), "1");
            }
        }

        for (ProductInfo product : down_product_list) {
            //product.getProductLife();
            //product.getSaleTime();
            Date proRemoveTime = product.getRemoveTime();
            if (curTime.after(proRemoveTime) || curTime.equals(proRemoveTime) || product.getRemainAmount() == 0 ||
                    product.getRemainAmount() < product.getStartMoney()) {
                //产品下架
                productInfoMapper.updateProductStatus(product.getProductName(), "2");

            }
        }
    }
}
