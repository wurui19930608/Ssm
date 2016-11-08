package com.wr.mappers;

import com.wr.pojos.UserEntity;

import java.util.List;

/**
 * Created by Administrator on 2016/10/28 0028.
 */
public interface UserMapper {

    List<UserEntity> selectUser(UserEntity userEntity);

    List<UserEntity> selectUserByNameAndMobile(UserEntity userEntity);

    void addUser(UserEntity userEntity);
}
