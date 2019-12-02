package com.springboot.news_;

import com.springboot.news_.dao.UserDao;
import com.springboot.news_.entity.NewsUser;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class NewsApplicationTests {
    @Autowired
    UserDao userDao;
    @Test
    void contextLoads() {
        NewsUser user= userDao.FindUser ("admin","admin");
        System.out.println(user.getId ()+" "+user.getUserName ());
    }

}
