package com.biz.order;

import com.contanst.CommonConstant;
import com.contanst.RestResourceConstant;
import com.dto.BookSearchResponseDto;
import com.mapper.BookListMapper;
import com.mapper.ProductInfoMapper;
import com.mapper.UserInfoMapper;
import com.model.BookList;
import com.model.ProductInfo;
import com.model.UserInfo;
import com.zhaogang.tools.rest.annotation.RestParam;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;
import com.zhaogang.tools.rest.exception.BizErrorBusinessException;
import com.zhaogang.tools.utils.MessageSourceUtils;
import com.zhaogang.tools.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by hucheng626 on 2016/8/3.
 */
@Service("orderBiz")
public class OrderBiz {
    @Autowired
    private MessageSourceUtils messageSourceUtils;
    @Autowired
    private BookListMapper bookListMapper;
    @Autowired
    private ProductInfoMapper productInfoMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;

    //充值
    @Transactional
    public ResponseBaseDto recharge(@RestParam(value = "userName", required = true) String userName,
                                    @RestParam(value = "rechargeMoney", required = true)String rechargeMoney){

        if(StringUtils.isBlank(userName)){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }
        UserInfo user  = userInfoMapper.selectByUserName(userName);
        Float floatRechargeMoney = Float.parseFloat(rechargeMoney);
        if (null == floatRechargeMoney){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_RECHARGE_EMPTY));
        } else if (floatRechargeMoney <= 0){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_RECHARGE_GZERO));
        }
        try{
            userInfoMapper.updateBalance(userName,user.getBalance()+floatRechargeMoney);
        }catch (Exception e){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_RECHARGE_EXCEPTION));
        }
        ResponseBaseDto dto = new ResponseBaseDto();
        dto.setMessage(RestResourceConstant.LU_USER_RECHARGE_SUCCESS);
        dto.setSuccess(CommonConstant.ONE);
        return dto;

    }


    //申请
    @Transactional
    public ResponseBaseDto apply(@RestParam(value = "userName", required = true) String userName,
                                 @RestParam(value = "productName",required = true) String productName,
                                 @RestParam(value = "bookMoney",required = true)String bookMoney){


        if(StringUtils.isBlank(userName) || StringUtils.isBlank(productName)){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }
        UserInfo user  = userInfoMapper.selectByUserName(userName);
        ProductInfo product = productInfoMapper.selectByProductName(productName);
        float reamount = product.getRemainAmount();
        float sm = product.getStartMoney();
        float inm = product.getIncrementCount();
        Float floatBookMoney = Float.parseFloat(bookMoney);
        if (floatBookMoney <= 0){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_APPLY_GZERO));
        }else if(floatBookMoney>product.getRemainAmount()){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_APPLY_LREMAIN));
        }else if(floatBookMoney-product.getStartMoney()<0){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_APPLY_GSTART));
        }else if (((floatBookMoney-product.getStartMoney())%product.getIncrementCount())!=0){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_APPLY_EVALIDAMOUNT));
        }else if(product.getRemainAmount()-floatBookMoney<product.getStartMoney()){
            //TODO
        }

        BookList book = new BookList();

        book.setUserName(userName);
        book.setProductName(productName);

        //book.setBookAmount(null);
        book.setBookMoney(floatBookMoney);


        book.setBookTime(new Date());
        book.setCheckStatus(CommonConstant.ZERO);
        book.setDeleteMark(CommonConstant.ZERO);

        try{
            userInfoMapper.updateBalance(userName,user.getBalance()-floatBookMoney);
            if ("1".equals(product.getApplyRecord())){
                productInfoMapper.updateRemainAmount(productName,product.getRemainAmount()-floatBookMoney,null);
            }
            else{
                productInfoMapper.updateRemainAmount(productName,product.getRemainAmount()-floatBookMoney,"1");
            }
            bookListMapper.insertSelective(book);
        }catch (Exception e){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_APPLY_EXCEPTION));
        }
        ResponseBaseDto dto = new ResponseBaseDto();
        dto.setMessage(RestResourceConstant.LU_USER_APPLY_SUCCESS);
        dto.setSuccess(CommonConstant.ONE);
        return dto;
    }

    //查询
    @Transactional
    public ResponseBaseDto search(){
        BookSearchResponseDto dto = new BookSearchResponseDto();
        List<BookList> list = bookListMapper.select();
        dto.setBooklist(list);
        dto.setMessage(RestResourceConstant.LU_BOOKLIST_REASEARCH_SUCCESS);
        dto.setStatus(CommonConstant.ONE);
        return dto;
    }


    //查询审核
    /*
    @Transactional
    public ResponseBaseDto search(@RestParam(value = "deleteMark")String deleteMark){
        BookSearchResponseDto dto = new BookSearchResponseDto();
        List<BookList> list = bookListMapper.select();
        dto.setBooklist(list);
        dto.setMessage(RestResourceConstant.LU_BOOKLIST_REASEARCH_SUCCESS);
        dto.setStatus(CommonConstant.ONE);
        return dto;
    }
    @Transactional
    public ResponseBaseDto confirm(@RestParam(value = "id")Integer bookId){
        if (StringUtils.isBlank(bookId.toString())) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }

        BookList book = bookListMapper.selectByPrimaryKey(bookId);

        if(book != null){
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_BOOK_NOT_EXIST));
        }



        return null;
    }*/




}
