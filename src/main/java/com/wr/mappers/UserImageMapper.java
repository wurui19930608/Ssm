package com.wr.mappers;

import com.wr.pojos.UserImageEntity;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * Created by Administrator on 2016/11/3 0003.
 */
public interface UserImageMapper {

    List<UserImageEntity> selectUserImageList(RowBounds rowBounds);

    int imageCount();

    void insertUserImage(UserImageEntity userImageEntity);

    UserImageEntity selectUserImage(int id);
}
