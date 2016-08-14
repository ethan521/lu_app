package com.biz.product;

import com.contanst.CommonConstant;
import com.contanst.RestResourceConstant;
import com.dto.ProSearchResponseDto;
import com.dto.ProductOnlineDto;
import com.mapper.ProductInfoMapper;
import com.model.ProductInfo;
import com.zhaogang.tools.rest.annotation.RestParam;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;
import com.zhaogang.tools.rest.exception.BizErrorBusinessException;
import com.zhaogang.tools.utils.DateUtils;
import com.zhaogang.tools.utils.MessageSourceUtils;
import com.zhaogang.tools.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.handler.LogicalMessageContext;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangbiao537 on 2016/8/9.
 */
@Service("product")
public class Product {

    @Autowired
    private MessageSourceUtils messageSourceUtils;

    @Autowired
    private ProductInfoMapper productInfoMapper;

    //产品上架
    @Transactional
    public ResponseBaseDto write(@RestParam(value = "productName")String productName,
                                 @RestParam(value = "projectName")String projectName,
                                 @RestParam(value = "securityLevel")String securityLevel,

                                 @RestParam(value = "expectedReturn")String expectedReturn,
                                 @RestParam(value = "saleTime")String saleTime,
                                 @RestParam(value = "removeTime")String removeTime,
                                 @RestParam(value = "totalAmount")String totalAmount,
                                 @RestParam(value = "startMoney")String startMoney,
                                 @RestParam(value = "incrementCount")String incrementCount,

                                 @RestParam(value = "productInfo")String productInfo,
                                 @RestParam(value = "projectInfo")String projectInfo,
                                 @RestParam(value = "productLife")String productLife,
                                 @RestParam(value = "incomeStyle")String incomeStyle,
                                 @RestParam(value = "valueDate")String valueDate,
                                 @RestParam(value = "productChannel")String productChannel){

        ProductOnlineDto dto = new ProductOnlineDto();

        //必填字段
        if(StringUtils.isBlank(productName)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_NAME_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(projectName)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_PROJECT_NAME_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(securityLevel)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_SECURITY_LEVEL_IS_EMPTY));
            return dto;
        }

        if(StringUtils.isBlank(expectedReturn)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_EXPECTED_RETURN_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(saleTime)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_SALE_TIME_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(removeTime)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_REMOVE_TIME_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(totalAmount)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_TOTAL_AMOUNT_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(startMoney)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_START_MONEY_IS_EMPTY));
            return dto;
        }
        if(StringUtils.isBlank(incrementCount)){
            dto.setMes(messageSourceUtils.getMessage(RestResourceConstant.LU_INCREMENT_COUNT_IS_EMPTY));
            return dto;
        }
        //类型转换
        Float expectedR = Float.valueOf(expectedReturn);
        Date saleT= DateUtils.stringToDate(saleTime);
        Date removeT= DateUtils.stringToDate(removeTime);
        Float totalA = Float.valueOf(totalAmount);
        Float startM = Float.valueOf(startMoney);
        Float incrementC = Float.valueOf(incrementCount);

//        Float expectdR = null;
//        Float totalA = null;
//        Float startM = null;
//        Float incrementC = null;
//        Date saleT= new Date();
//        Date removeT= new Date();
//        if(StringUtils.isNotBlank(expectedReturn)){
//            expectdR = Float.valueOf(expectedReturn);
//        }
//        if(StringUtils.isNotBlank(totalAmount)){
//            totalA = Float.valueOf(totalAmount);
//        }
//        if(StringUtils.isNotBlank(startMoney)){
//            startM = Float.valueOf(startMoney);
//        }
//        if(StringUtils.isNotBlank(incrementCount)){
//            incrementC = Float.valueOf(incrementCount);
//        }
//        if(StringUtils.isNotBlank(saleTime)){
//            saleT= DateUtils.stringToDate(saleTime);
//        }
//        if(StringUtils.isNotBlank(removeTime)){
//            removeT= DateUtils.stringToDate(removeTime);
//        }
        //
        Date valueD= new Date();
        if(StringUtils.isNotBlank(valueDate)){
            valueD= DateUtils.stringToDate(valueDate);
        }

        ProductInfo product = new ProductInfo();
        //必填
        product.setProductName(productName);
        product.setProjectName(projectName);
        product.setSecurityLevel(securityLevel);
            //有类型转换
        product.setExpectedReturn(expectedR);
        product.setTotalAmount(totalA);
        product.setRemainAmount(totalA); //剩余募集余额
        product.setStartMoney(startM);
        product.setIncrementCount(incrementC);
        product.setSaleTime(saleT);
        product.setRemoveTime(removeT);
        //可以默认
        product.setProductLife(productLife);
        product.setProductInfo(productInfo);
        product.setProjectInfo(projectInfo);
        product.setIncomeStyle(incomeStyle);
        product.setProductChannel(productChannel);
            //有类型转换
        product.setValueDate(valueD);
        //后端处理
        product.setStatus(CommonConstant.ZERO);
        product.setApplyRecord(CommonConstant.ZERO);
       // product.setDisplayOrder(CommonConstant.ERROR);

        try{
            productInfoMapper.insertSelective(product);
        }catch (Exception e){
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_WRITE_FAIL));
            return dto;
        }

        dto.setStatus(CommonConstant.ONE);
        dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_WRITE_SUCCESS));

        return dto;
    }


    //查询
    @Transactional
    public ResponseBaseDto search(){
        ProSearchResponseDto dto = new ProSearchResponseDto();

        List<ProductInfo> list = productInfoMapper.select();
        if(list ==null){
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_SEARCH_FAIL));
        }
        dto.setProList(list);
        dto.setStatus(CommonConstant.ONE);
        dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_SEARCH_SUCCESS));

        return dto;
    }

    @Transactional
    public ResponseBaseDto searchByStatus(@RestParam("productStatus")String productStatus){

        if(!("0".equals(productStatus) || "1".equals(productStatus) || "2".equals(productStatus))){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_STATUS_ERROR));
        }
        List<ProductInfo> productList = productInfoMapper.selectProductByStatus(productStatus);

        ProSearchResponseDto dto = new ProSearchResponseDto();
        if(productList ==null){
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_SEARCH_FAIL));
        }
        dto.setProList(productList);
        dto.setStatus(CommonConstant.ONE);
        dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_SEARCH_SUCCESS));

        return dto;
    }
/*
    //删除
    @Transactional
    public ResponseBaseDto delete(@RestParam(value = "id")Integer productId){

        ProductUnloadDto dto = new ProductUnloadDto();

        if(productId == null){
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_ID_NOT_EXIST));
            return dto;
        }

        ProductInfoWithBLOBs product = productInfoMapper.selectByPrimaryKey(productId);
        if(product == null){
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_PRODUCT_NOT_EXIST));
            return dto;
        }

        product.getRemoveTime();

        return null;
    }
*/

}
