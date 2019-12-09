package com.springboot.news_.controller;

import com.alibaba.fastjson.JSONObject;
import com.springboot.news_.dao.NewsdetailDao;
import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.entity.NewsDetail;
import com.springboot.news_.entity.NewsUser;
import com.springboot.news_.serviceDao.CategoryService;
import com.springboot.news_.serviceDao.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired(required = true)
    NewsdetailDao newsdetailDao;
    @Autowired
    CategoryService categoryService;
    @Autowired
    UserService userService;
    @RequestMapping("/index")
    public String FindUserController(Model model) {
        Integer id = 1;
        Integer start=0;
        Integer size=5;
        List<NewsDetail> list=newsdetailDao.getLatestNews_details (id,start,size);
        NewsCategory newsCategory=categoryService.getNews_categoryById (id);
        model.addAttribute ("articleLists",list);
        model.addAttribute ("cid",newsCategory.getName ());
        return "index";

    }

    @ResponseBody   //json
    @RequestMapping(value = "/logins", method = RequestMethod.POST)
    public String findUser(Model model, HttpServletRequest request) {
        String username = request.getParameter ("username");
        String password = request.getParameter ("password");
        NewsUser user = new NewsUser ( );
        user.setUserName (username);
        user.setPassword (password);
        Map<String, Object> map = new HashMap<> ( );

        NewsUser newsUser = userService.FindUser (user);
        if (null == newsUser||newsUser.getId ()<=0) {
            map.put ("code", "0");
            map.put ("msg", "账号或者密码错误");
            request.getSession ().setAttribute ("user", null);
        } else {
            map.put ("code", "1");
            map.put ("msg", "");
            request.getSession ( ).setAttribute ("user", newsUser);//查到的用户储存
        }
        /*map转字符串对象*/
        String result = new JSONObject (map).toString ( );
        return result;

    }


}
