package com.controller;

import com.contanst.CommonConstant;
import com.contanst.RestResourceConstant;
import com.dto.LoginOutResponseDto;
import com.dto.LoginResponseDto;
import com.mapper.UserInfoMapper;
import com.model.UserInfo;
import com.zhaogang.tools.rest.annotation.RestParam;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;
import com.zhaogang.tools.rest.exception.BizErrorBusinessException;
import com.zhaogang.tools.utils.MessageSourceUtils;
import com.zhaogang.tools.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

/**
 * Created by hucheng626 on 2016/8/8.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private MessageSourceUtils messageSourceUtils;

    @Autowired
    private UserInfoMapper userInfoMapper;
    //24小时内，登录错误次数不得超过5次
    private final Integer LOGIN_ERROR_LIMIT = 5;
    //登陆
    @RequestMapping("/login")
    @ResponseBody
    public ResponseBaseDto login(@RestParam(value = "userName", required = true) String userName,
                                 @RestParam(value = "password", required = true) String passWord,
                                 HttpServletRequest request) {
        LoginResponseDto dto = new LoginResponseDto();
        if (StringUtils.isBlank(userName) || StringUtils.isBlank(passWord)) {
            dto.setSuccess(CommonConstant.ZERO);
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
            return dto;
        }
        UserInfo user;
        user = (UserInfo)request.getSession().getAttribute("user");
        if (null != user){
            if (userName.equals(user.getUserName()) && passWord.equals(user.getPassword())) {
                dto.setSuccess(CommonConstant.ONE);
                dto.setStatus(CommonConstant.ONE);
                dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_HAVE_LOGIN));
                return dto;
            }
            else{
                dto.setSuccess(CommonConstant.ZERO);
                dto.setStatus(CommonConstant.ZERO);
                dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_LOGIN_OTHER));
                return dto;
            }
        }
        try{
            user = userInfoMapper.selectByUserName(userName);
            if (user != null && passWord.equals(user.getPassword())) {
                //登录成功处理
                return loginSuccessHandler(request, user, dto);
            }
        }
        catch(Exception e){
            dto.setSuccess(CommonConstant.ZERO);
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_LOGIN_EXCEPTION));
            return dto;
        }
        //登录错误处理
        return loginErrorHandler(user,passWord,dto);

    }
    private ResponseBaseDto loginSuccessHandler(HttpServletRequest request, UserInfo user,LoginResponseDto dto){
        //String cIP = request.getRemoteAddr();
        //System.out.println();
        String userName = user.getUserName();
        String passWord = user.getPassword();
        String clientIP = getIP(request);
        ServletContext application = request.getSession().getServletContext();
        HttpSession existSession = (HttpSession)application.getAttribute(userName);
        HttpSession curSession = request.getSession();
        if (null ==existSession || !curSession.getId().equals(existSession.getId())){
            //标识用户已登录
            curSession.setAttribute("user",user);
            //这个属性用于在session销毁时，更新数据库登录状态字段
            curSession.setAttribute("userInfoMapper",userInfoMapper);
            //设置session失效时间
            curSession.setMaxInactiveInterval(900);
            if (null !=existSession){
                application.removeAttribute(userName);
                existSession.invalidate();
            }
            application.setAttribute(userName,curSession);

        }
        //String sessionID = request.getSession().getId();
        //application.setAttribute(userName,request.getSession());
        userInfoMapper.loginSuccessUpdate(userName, passWord, clientIP);
        dto.setSuccess(CommonConstant.ONE);
        dto.setStatus(CommonConstant.ONE);
        return dto;
    }
    private ResponseBaseDto loginErrorHandler(UserInfo user,String passWord,LoginResponseDto dto){
        //账号存在，密码错误
        if (null != user && !passWord.equals(user.getPassword())) {
            String userName = user.getUserName();
            try{
                Integer loginErrorNum = user.getLoginErrorNum();
                Date firstErrorTime = user.getFirstErrorTime();
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                //String currentTime = sdf.format(dt);

                //之前没出错，现在出错
                //默认出错次数与出错时间一起存在
                if (null == loginErrorNum || 0 == loginErrorNum) {
                    loginErrorNum =1;
                    dto.setErrorTime(loginErrorNum);
                    userInfoMapper.passwordErrorUpdate(userName, loginErrorNum, dt, null);

                }else{
                    long dist_time = (dt.getTime()-firstErrorTime.getTime())/(60*60*1000);

                    if (dist_time>=24){
                        loginErrorNum =1;
                        dto.setErrorTime(loginErrorNum);
                        userInfoMapper.passwordErrorUpdate(userName,loginErrorNum,dt,null);
                    }else{
                        loginErrorNum += 1;
                        //能进入这个逻辑，loginErrorNum一定大于1
                        if (LOGIN_ERROR_LIMIT == loginErrorNum){
                            //锁定账户
                            userInfoMapper.passwordErrorUpdate(userName,loginErrorNum,null,dt);
                            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_ERROR_LOCK));
                        }else if(LOGIN_ERROR_LIMIT > loginErrorNum){
                            dto.setErrorTime(loginErrorNum);
                            userInfoMapper.passwordErrorUpdate(userName,loginErrorNum,null,null);
                            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_LOGIN_FAIL));
                        }else{
                            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_ERROR_LOCK));
                        }
                    }
                }
                dto.setSuccess(CommonConstant.ZERO);
                dto.setStatus(CommonConstant.ZERO);
                return dto;
            }catch (Exception e){
                dto.setSuccess(CommonConstant.ONE);
                dto.setStatus(CommonConstant.ONE);
                dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_PASSWORD_ERROR_UPDATE_EXCEPTION));
                return dto;
            }
        }
        dto.setSuccess(CommonConstant.ZERO);
        dto.setStatus(CommonConstant.ZERO);
        dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_LOGIN_FAIL));
        return dto;
    }
    private String getIP(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
            if(ip.equals("127.0.0.1")){
                //根据网卡取本机配置的IP
                InetAddress inet;
                try {
                    inet = InetAddress.getLocalHost();
                    ip= inet.getHostAddress();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }

            }
        }
        // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ip != null && ip.length() > 15){
            if(ip.indexOf(",")>0){
                ip = ip.substring(0,ip.indexOf(","));
            }
        }
        return ip;
    }

    @RequestMapping("/logout")
    @ResponseBody
    public ResponseBaseDto loginOut(HttpServletRequest request) {
        LoginOutResponseDto dto = new LoginOutResponseDto();
        HttpSession curSession = request.getSession();
        UserInfo user = (UserInfo)curSession.getAttribute("user");
        //用户还没有登录
        if (null == user){
            dto.setStatus(CommonConstant.ZERO);
            dto.setSuccess(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_NOT_LOGIN));
            return dto;
        }
        try{
            curSession.setAttribute("userInfoMapper",userInfoMapper);
            //userInfoMapper.loginOutUpdate(user.getUserName(), user.getPassword());
            curSession.invalidate();
            dto.setStatus(CommonConstant.ONE);
            dto.setSuccess(CommonConstant.ONE);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_LOGOUT_SUCCESS));
            return dto;
        }catch(Exception e){
            dto.setSuccess(CommonConstant.ZERO);
            dto.setStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_LOGOUT_ERROR));
            return dto;
        }
    }
}
