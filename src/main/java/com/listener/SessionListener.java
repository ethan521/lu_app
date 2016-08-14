package com.listener;

import com.mapper.UserInfoMapper;
import com.model.UserInfo;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by caochengyuan672 on 2016/8/9.
 */
public class SessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession destroSession = httpSessionEvent.getSession();
        ServletContext application = destroSession.getServletContext();
        UserInfo user = (UserInfo)destroSession.getAttribute("user");
        application.removeAttribute(user.getUserName());
        UserInfoMapper userInfoMapper = (UserInfoMapper)destroSession.getAttribute("userInfoMapper");
        if (null != userInfoMapper){
            userInfoMapper.loginOutUpdate(user.getUserName(), user.getPassword());
        }

    }
}
