package com.wr.services;

import com.wr.pojos.UserImageEntity;
import com.wr.utils.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2016/11/3 0003.
 */
public interface UserImageService {

    public List<UserImageEntity> selectImageList(PageInfo pageInfo);

    public void addImage(UserImageEntity userImageEntity);

    public UserImageEntity selectUserImageById(int id);
}
