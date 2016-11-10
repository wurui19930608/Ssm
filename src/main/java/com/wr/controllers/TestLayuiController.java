package com.wr.controllers;

import com.wr.pojos.UserImageEntity;
import com.wr.services.UserImageService;
import com.wr.utils.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/11/7 0007.
 */
@Controller
@RequestMapping("/test")
public class TestLayuiController {

    @Resource
    private UserImageService userImageService;

    @RequestMapping("/layui")
    public String layui(){
        return "layui";
    }

    /**
     * 进入表单页
     * @return
     */
    @RequestMapping("/toform")
    public String toform(){
        return "/layui/form";
    }

    @RequestMapping("/toImage")
    public String toImage(Model model, PageInfo pageInfo){

        List<UserImageEntity> userEntities = userImageService.selectImageList(pageInfo);
        model.addAttribute("userEntities",userEntities);
        return "layui/image";
    }

}
