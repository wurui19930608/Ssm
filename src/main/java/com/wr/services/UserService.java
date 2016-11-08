package com.wr.services;

import com.wr.pojos.UserEntity;

/**
 * Created by Administrator on 2016/10/28 0028.
 */
public interface UserService {

    public UserEntity selectUser(String mobile,String password);

    public UserEntity selectUserByNameAndMobile(String username,String mobile);

    public void addUser(UserEntity userEntity);
}
