package com.wr.services.impl;

import com.wr.mappers.UserImageMapper;
import com.wr.pojos.UserImageEntity;
import com.wr.services.UserImageService;
import com.wr.utils.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/11/3 0003.
 */
@Repository
public class UserImageServiceImpl implements UserImageService {

    @Resource
    private UserImageMapper userImageMapper;

    @Override
    public List<UserImageEntity> selectImageList(PageInfo pageInfo) {
        pageInfo.setCount(userImageMapper.imageCount());
        List<UserImageEntity> list = userImageMapper.selectUserImageList(new RowBounds(pageInfo.getOffset(),pageInfo.getPageSize()));
        return list;
    }

    @Override
    public void addImage(UserImageEntity userImageEntity) {
        userImageMapper.insertUserImage(userImageEntity);
    }

    @Override
    public UserImageEntity selectUserImageById(int id) {
        return userImageMapper.selectUserImage(id);
    }
}
