package com.springboot.news_.controller;

import com.alibaba.fastjson.JSONObject;
import com.springboot.news_.dao.NewsdetailDao;
import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.entity.NewsDetail;
import com.springboot.news_.entity.NewsUser;
import com.springboot.news_.serviceDao.CategoryService;
import com.springboot.news_.serviceDao.NewsdetailService;
import com.springboot.news_.serviceDao.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired(required = true)
    NewsdetailService newsdetailService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    UserService userService;
    @Autowired
    NewsdetailDao newsdetailDao;
    @RequestMapping("/")
    public String FirstJsp(Model model, HttpServletRequest request) {
        String category = request.getParameter ("categoryId");
        String search = request.getParameter ("search");
        String currPages=request.getParameter ("currPage");
        Integer categoryId=1;//默认主题 全部
        Integer currPage=1;//默认分页 第一页
        Integer pageSize=3;//分页size


        if (category != null) {
           categoryId = Integer.parseInt (category); //默认新闻分类是全部
             }

        Integer count= newsdetailDao.getNewsCount (categoryId,search);//新闻总数


        Integer pageCount=count%pageSize;//总条数是否可以除尽size 如果整除则为页数 除不尽+1
        Integer pageCounts=pageCount==0?count/pageSize:count/pageSize+1;//总页数的计算
        if (currPages!=null){     //防止越界异常,这个主要是为了做跳转输入指定页数时防止错误,这里就不做了
            Integer p= Integer.parseInt (currPages);//传过来的当前页数
            currPage=p<=1?1:p>pageCounts?pageCounts:p;//假如传过来的不大于1则设为当前第1页否则看是否大于总页数..

        }
        model.addAttribute ("pageCounts",pageCounts);
        model.addAttribute ("currPage",currPage);
        /*搜索内容*/
            List<NewsDetail> list = newsdetailService.getLatestNews_details (categoryId,search,currPage,pageSize);
            NewsCategory newsCategory = categoryService.getNews_categoryById (categoryId);
            model.addAttribute ("articleLists", list);
            model.addAttribute ("cid", newsCategory);
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
