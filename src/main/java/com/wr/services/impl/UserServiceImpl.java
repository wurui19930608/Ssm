package com.wr.services.impl;

import com.wr.mappers.UserMapper;
import com.wr.pojos.UserEntity;
import com.wr.services.UserService;
import com.wr.utils.Utils;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016/10/28 0028.
 */
@Repository
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    public UserEntity selectUser(String mobile, String password) {
        UserEntity userEntity = new UserEntity();
        userEntity.setMobile(mobile);
        userEntity.setPassword(password);
        List<UserEntity> userList = userMapper.selectUser(userEntity);
        userEntity = null;
        if(userList.size()>0){
            userEntity = userList.get(0);
            return userEntity;
        }
        return userEntity;
    }

    @Override
    public UserEntity selectUserByNameAndMobile(String username, String mobile) {
        UserEntity userEntity = new UserEntity();
        userEntity.setUserName(username);
        userEntity.setMobile(mobile);
        List<UserEntity> userList = userMapper.selectUserByNameAndMobile(userEntity);
        if(userList.size()>0){
            return userList.get(0);
        }
        return null;
    }

    @Override
    public void addUser(UserEntity userEntity) {
        userEntity.setId(UUID.randomUUID().toString().replace("-",""));
        userEntity.setPassword(Utils.MD5(userEntity.getPassword()));
        userMapper.addUser(userEntity);
    }
}
