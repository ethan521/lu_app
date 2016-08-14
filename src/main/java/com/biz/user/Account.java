package com.biz.user;


import com.contanst.CommonConstant;
import com.contanst.RestResourceConstant;
import com.dto.UserRegisterResponseDto;
import com.dto.UserSearchResponseDto;
import com.mapper.BookListMapper;
import com.mapper.UserInfoMapper;
import com.model.BookList;
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
@Service("account")
public class Account {
    @Autowired
    private MessageSourceUtils messageSourceUtils;
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private BookListMapper bookListMapper;
    //24小时内，登录错误次数不得超过5次
    private final Integer LOGIN_ERROR_LIMIT = 5;

    //注册
    @Transactional
    public ResponseBaseDto register(@RestParam(value = "userName") String userName,
                                    @RestParam(value = "mobileNumber") String mobileNumber,
                                    @RestParam(value = "password") String passWord,

                                    @RestParam(value = "email") String email,
                                    @RestParam(value = "role") String role,
                                    @RestParam(value = "sex") String sex,
                                    @RestParam(value = "birthday") String birthday) {

        UserRegisterResponseDto dto = new UserRegisterResponseDto();
/*
        if (StringUtils.isBlank(userName)) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }
        if ( StringUtils.isBlank(passWord) ) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }
        if (StringUtils.isBlank(mobileNumber)) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }
*/
        UserInfo user = userInfoMapper.selectByUserName(userName);

        if (user != null) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_REGISTER));
        }


      // Date bd = DateUtils.stringToDate(birthday);
        user = new UserInfo();
        user.setUserName(userName);
        user.setMobileNumber(mobileNumber);
        user.setPassword(passWord);
        user.setCreateTime(new Date());
        user.setLoginStatus(CommonConstant.ZERO);

        user.setEmail(email);
        user.setRole(role);
       // user.setBirthday(bd);
        user.setSex(sex);
        user.setBalance(new Float(0));

        userInfoMapper.insert(user);
        dto.setStatus(CommonConstant.ONE);

        return dto;
    }

    //查询
    @Transactional
    public ResponseBaseDto search(@RestParam(value = "userName")String userName){

        UserSearchResponseDto dto = new UserSearchResponseDto();

        if(StringUtils.isBlank(userName)){
            dto.setUserStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_RESEARCH_USERNAME_BLANK));
            return dto;
        }

        UserInfo userInfo = userInfoMapper.selectByUserName(userName);

        if(userInfo == null){
            dto.setUserStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_RESEARCH_FAIL));
            return dto;
        }
        dto.setUserStatus(CommonConstant.ONE);
        dto.setUserInfo(userInfo);

        List<BookList> list = bookListMapper.selectByUserName(userName);
        if(list == null){
            dto.setBookStatus(CommonConstant.ZERO);
            dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_BOOK_SEARCH_BLANK));
            return dto;
        }

        dto.setList(list);
        dto.setBookStatus(CommonConstant.ONE);
        dto.setMessage(messageSourceUtils.getMessage(RestResourceConstant.LU_USER_RESEARCH_SUCCESS));
        return dto;
    }



    //注销
    @Transactional
    public ResponseBaseDto logout(@RestParam(value = "userName", required = true) String userName) {
        if (StringUtils.isBlank(userName)) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_BLANL));
        }

        UserInfo user = userInfoMapper.selectByUserName(userName);

        if (user == null) {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_NOT_EXIST));
        }

        if (user.getLoginStatus().equals(CommonConstant.ONE)) {
            user.setLoginStatus(CommonConstant.ZERO);
            /*
            * 初始化登录状态
            *
            * */
            userInfoMapper.updateByPrimaryKeySelective(user);
        } else {
            throw new BizErrorBusinessException(messageSourceUtils.getMessage(RestResourceConstant.LU_SUPERLU_USER_IS_LOGOUT));
        }

        return new ResponseBaseDto();
    }
}
