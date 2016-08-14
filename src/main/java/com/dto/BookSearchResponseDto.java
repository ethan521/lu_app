package com.dto;

import com.contanst.CommonConstant;
import com.model.BookList;
import com.zhaogang.tools.rest.dto.ResponseBaseDto;

import java.util.List;

/**
 * Created by zhangbiao537 on 2016/8/9.
 */
public class BookSearchResponseDto extends ResponseBaseDto {
    private String status = CommonConstant.ZERO;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private List<BookList> booklist;

    public List<BookList> getBooklist() {
        return booklist;
    }

    public void setBooklist(List<BookList> booklist) {
        this.booklist = booklist;
    }
}
