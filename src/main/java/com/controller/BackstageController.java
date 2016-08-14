package com.controller;

import com.contanst.CommonConstant;
import com.dto.BookSearchResponseDto;
import com.dto.LoginResponseDto;
import com.mapper.BookListMapper;
import com.mapper.ProductInfoMapper;
import com.model.BookList;
import com.model.ProductInfo;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by hucheng626 on 2016/8/5.
 */
@Controller
@RequestMapping("/backstage")
public class BackstageController {
    @Autowired
    private ProductInfoMapper productInfoMapper;
    @Autowired
    private BookListMapper bookListMapper;
    @RequestMapping("/login")
    public String login() {
        return "backStageLogin.jsp";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ResponseBaseDto login(String userName, String password,HttpServletRequest request) {
        LoginResponseDto dto =new LoginResponseDto();
        if (userName.equals("hucheng") && password.equals("hucheng")) {
            dto.setStatus(CommonConstant.ONE);
            request.getSession().setAttribute("backstage","hucheng");
        }else {
            dto.setStatus(CommonConstant.ZERO);
        }
        return dto;
    }

    @RequestMapping("/index")
    public String index(HttpServletResponse response) {
        Cookie cookie=new Cookie("password","password");
        response.addCookie(cookie);
        return "backstageIndex.jsp";
    }

    @RequestMapping("/proManager")
    public String proManager() {
        return "ProManager.jsp";
    }

    @RequestMapping("/proListManager")
    public String proListManager(HttpServletRequest request) {
        List<ProductInfo> list = productInfoMapper.select();
        request.setAttribute("list",list);
        return "ProListManager.jsp";
    }
    @RequestMapping("/recodeManager")
    public String recodeManager(HttpServletRequest request) {
        List<BookList> list = bookListMapper.select();
        request.setAttribute("list",list);
        return "RecodeManager.jsp";
    }

}
