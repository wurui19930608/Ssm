package com.wr.controllers;

import com.wr.pojos.UserEntity;
import com.wr.pojos.UserImageEntity;
import com.wr.services.UserImageService;
import com.wr.services.UserService;
import com.wr.utils.PageInfo;
import com.wr.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/28 0028.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private UserService userService;

    @Resource
    private UserImageService userImageService;

    /**
     * 进入登录页
     * @param request
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin(HttpServletRequest request){
        return "login";
    }

    /**
     * 登录
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(UserEntity user, Model model){
        UserEntity userEntity = userService.selectUser(user.getMobile(),Utils.MD5(user.getPassword()));
        if(userEntity!=null){
            model.addAttribute("msg","成功");
            model.addAttribute("userName",userEntity.getUserName());
            return "index";
        }else{
            return "redirect:toLogin.do";
        }
    }

    /**
     * 注册
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public Map<String,Object> register(UserEntity user, Model model){
        Map<String,Object> map = new HashMap<>();
        UserEntity userEntity = userService.selectUserByNameAndMobile(user.getUserName(),user.getMobile());
        if(userEntity==null){
            userService.addUser(user);
            map.put("msg","注册成功！");
        }else{
            map.put("msg","用户已存在");
        }
        return map;
    }

    /**
     * 下载文件
     * @param response
     * @param fileName
     * @throws Exception
     */
    @RequestMapping("/downloadFile")
    @ResponseBody
    public void downloadFile(HttpServletResponse response,String fileName) throws Exception{
        String path = "C:\\Users\\Administrator\\Desktop\\手机相册\\"+fileName;
        File file = new File(path);// path是根据日志路径和文件名拼接出来的
        String filename = file.getName();// 获取日志文件名称
        InputStream fis = new BufferedInputStream(new FileInputStream(path));
        byte[] buffer = new byte[fis.available()];
        fis.read(buffer);
        fis.close();
        response.reset();
        // 先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
        response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.replaceAll(" ", "").getBytes("utf-8"),"iso8859-1"));
        response.addHeader("Content-Length", "" + file.length());
        OutputStream os = new BufferedOutputStream(response.getOutputStream());
        response.setContentType("application/octet-stream");
        os.write(buffer);// 输出文件
        os.flush();
        os.close();
    }

    /**
     * 上传文件
     * @param request
     * @throws IOException
     */
    @RequestMapping("/uploadFile")
    @ResponseBody
    public void uploadFile(HttpServletRequest request) throws IOException{
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("myFile");
        byte[] buffer = multipartFile.getBytes();
        FileOutputStream fo;
        fo = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\手机相册"+File.separator+multipartFile.getOriginalFilename());
        fo.write(buffer);
        fo.flush();
        fo.close();
    }

    /**
     * 显示图片
     * @param request
     * @param filename
     * @param response
     * @throws Exception
     */
    @RequestMapping("/showImage")
    @ResponseBody
    public void showImage(HttpServletRequest request,String filename, HttpServletResponse response) throws Exception {
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("image/jpeg");
        String absolutePath = "C:\\Users\\Administrator\\Desktop\\手机相册\\" + filename;
        FileInputStream fis = new FileInputStream(absolutePath);
        OutputStream os = response.getOutputStream();
        try {
            int count;
            byte[] buffer = new byte[1024 * 1024];
            while ((count = fis.read(buffer)) != -1)
                os.write(buffer, 0, count);
            os.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (os != null)
                os.close();
            if (fis != null)
                fis.close();
        }
    }

    @RequestMapping("/showImagePage")
    public String showImagePage(Model model, PageInfo pageInfo){
        List<UserImageEntity> userEntities = userImageService.selectImageList(pageInfo);
        model.addAttribute("userEntities",userEntities);
        return "image";
    }
}
