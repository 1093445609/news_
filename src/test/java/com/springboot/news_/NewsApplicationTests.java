package com.springboot.news_;

import com.springboot.news_.dao.UserDao;
import com.springboot.news_.entity.NewsUser;
import com.springboot.news_.serviceDao.CategoryService;
import com.springboot.news_.serviceDao.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
@SpringBootTest
class NewsApplicationTests {
    @Autowired
    UserService userService;

    @Test
    void contextLoads() {
       List<NewsUser>list= userService.FindAll ();
       NewsUser user=new NewsUser ();
       user.setUserName ("admin");
       user.setPassword ("admin");
       NewsUser newsUser=userService.FindUser (user);
       System.out.println(newsUser.getEmail ());
       for(NewsUser a:list){
           System.out.println(a.getUserName ());

       }
    }

}
