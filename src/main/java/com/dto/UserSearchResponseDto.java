package com.dto;

import com.contanst.CommonConstant;
import com.model.BookList;
import com.model.UserInfo;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

import java.util.List;

/**
 * Created by zhangbiao537 on 2016/8/10.
 */
public class UserSearchResponseDto extends ResponseBaseDto {
    private String bookStatus = CommonConstant.ZERO;
    private String userStatus = CommonConstant.ZERO;
    private UserInfo userInfo;
    private List<BookList> list;

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }



    public List<BookList> getList() {
        return list;
    }

    public void setList(List<BookList> list) {
        this.list = list;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

}
