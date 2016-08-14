package com.mapper;

import com.model.BookList;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository

public interface BookListMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BookList record);

    int insertSelective(BookList record);

    BookList selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BookList record);

    int updateByPrimaryKey(BookList record);

    List<BookList> select();

    List<BookList> selectByUserName(String userName);

}