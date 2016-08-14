package com.controller;

import com.contanst.CommonConstant;
import com.contanst.RestResourceConstant;
import com.dto.ProSearchResponseDto;
import com.dto.SingleInputDto;
import com.dto.UserSearchResponseDto;
import com.mapper.BookListMapper;
import com.mapper.ProductInfoMapper;
import com.mapper.UserInfoMapper;
import com.model.BookList;
import com.model.ProductInfo;
import com.model.UserInfo;
import com.zhaogang.tools.rest.annotation.RestParam;
import com.zhaogang.tools.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by hucheng626 on 2016/8/5.
 */
@Controller
@RequestMapping("/")
public class RegisterController {
    @Autowired
    private ProductInfoMapper productInfoMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private BookListMapper bookListMapper;
    @RequestMapping("/register")
    public String register() {
        return "register.jsp";
    }
    @RequestMapping("/product")
    public String product(HttpServletRequest request) {

        List<ProductInfo> productList = productInfoMapper.selectProductByStatus("1");
        if(productList ==null){
            request.setAttribute("productInfoList",new ArrayList<ProductInfo>());
        }
        else{
            request.setAttribute("productInfoList",productList);
        }

        return "product.jsp";
    }
    @RequestMapping("/personInfo")
    public String personInfo(HttpServletRequest request,String userName) {
       // String userName = request.getParameter("userName");

        UserInfo userInfo = userInfoMapper.selectByUserName(userName);
        request.setAttribute("userInfo",userInfo);

        List<BookList> bookList = bookListMapper.selectByUserName(userName);
        request.setAttribute("bookList",bookList);

        return "personInfo.jsp";
    }
    @RequestMapping("/single")
    public String single(HttpServletRequest request){
        try {
            request.setCharacterEncoding("gbk");
        }catch(Exception e){

        }


        String productID = request.getParameter("productID");
        Integer iProductID = Integer.parseInt(productID);
        //System.out.println(productName);
        //String s = "零活宝14T";

        ProductInfo product = productInfoMapper.selectByPrimaryKey(iProductID);

        Date date = product.getSaleTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String strTime = sdf.format(date);


        SingleInputDto dto = new SingleInputDto();
        dto.setStatus(product.getStatus());
        dto.setProductName(product.getProductName());
        dto.setProductInfo(product.getProductInfo());
        dto.setProjectInfo(product.getProjectInfo());
        dto.setProjectName(product.getProjectName());
        dto.setSecurityLevel(product.getSecurityLevel());
        dto.setExpectedReturn(product.getExpectedReturn());
        dto.setProductLife(product.getProductLife());
        dto.setIncomeStyle(product.getIncomeStyle());
        dto.setSaleTime(strTime);
        dto.setProductChannel(product.getProductChannel());

        date = product.getSaleTime();
        strTime = sdf.format(date);
        dto.setRemoveTime(strTime);

        dto.setTotalAmount(product.getTotalAmount());
        dto.setStartMoney(product.getStartMoney());
        dto.setRemainAmount(product.getRemainAmount());
        dto.setIncrementCount(product.getIncrementCount());
        dto.setDisplayOrder(product.getDisplayOrder());
        dto.setStatus(product.getStatus());
        dto.setApplyRecord(product.getApplyRecord());

        dto.setPerc(100-product.getRemainAmount()/product.getTotalAmount()*100);

        request.setAttribute("list",dto);

        return "single.jsp";
    }

}
