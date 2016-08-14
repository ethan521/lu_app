package com.mapper;

import com.model.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    UserInfo selectByUserName(@Param("userName")String userName);

    int passwordErrorUpdate(@Param("userName")String userName,@Param("loginErrorNum")Integer loginErrorNum, @Param("firstErrorTime")Date firstErrorTime, @Param("lockTime")Date lockTime );

    int loginSuccessUpdate(@Param("userName")String userName, @Param("passWord")String passWord, @Param("clientIP")String clientIP);
    int loginOutUpdate(@Param("userName")String userName, @Param("passWord")String passWord);
    int updateBalance(@Param("userName")String userName, @Param("balance")Float balance);

}