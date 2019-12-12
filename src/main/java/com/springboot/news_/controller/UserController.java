package com.springboot.news_.controller;

import com.alibaba.fastjson.JSONObject;
import com.springboot.news_.dao.NewsdetailDao;
import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.entity.NewsDetail;
import com.springboot.news_.entity.NewsUser;
import com.springboot.news_.serviceDao.CategoryService;
import com.springboot.news_.serviceDao.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping("/")
    public String FirstJsp(Model model, HttpServletRequest request) {
        Integer start = 0;//本来想着做分页的 不用插件又觉得麻烦所以...
        Integer size = 5;
        String category = request.getParameter ("categoryId");
        String search = request.getParameter ("search");
        Integer categoryId;
        if (category == null) {
            categoryId=1;
        } else {
           categoryId = Integer.parseInt (category); //默认新闻分类是全部
             }
        /*搜索内容*/
     

            List<NewsDetail> list = newsdetailDao.getLatestNews_details (categoryId, start, size,search);
            NewsCategory newsCategory = categoryService.getNews_categoryById (categoryId);
            model.addAttribute ("articleLists", list);
            model.addAttribute ("cid", newsCategory.getName ( ));
            List<NewsCategory> categoryLists = categoryService.getNews_categorys ( );
            model.addAttribute ("categoryLists", categoryLists);
            return "index";

        }
        /*
         * 登陆验证
         * */
        @ResponseBody   //json
        @RequestMapping(value = "/logins", method = RequestMethod.POST)
        public String findUser (Model model, HttpServletRequest request){
            String username = request.getParameter ("username");
            String password = request.getParameter ("password");
            NewsUser user = new NewsUser ( );
            user.setUserName (username);
            user.setPassword (password);
            Map<String, Object> map = new HashMap<> ( );

            NewsUser newsUser = userService.FindUser (user);
            if (null == newsUser || newsUser.getId ( ) <= 0) {
                map.put ("code", "0");
                map.put ("msg", "账号或者密码错误");
                request.getSession ( ).setAttribute ("user", null);
            } else {
                map.put ("code", "1");
                map.put ("msg", "");
                request.getSession ( ).setAttribute ("user", newsUser);//查到的用户储存
            }
            /*map转字符串对象*/
            String result = new JSONObject (map).toString ( );
            return result;

        }
        /*
         * 退出登陆 将session移出
         * */
        @RequestMapping("/logout")
        public String logout (HttpSession session){
            session.removeAttribute ("user");
            session.invalidate ( );
            return "redirect:/";


        }

    }
