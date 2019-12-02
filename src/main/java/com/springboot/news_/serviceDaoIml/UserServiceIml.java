package com.springboot.news_.serviceDaoIml;

import com.springboot.news_.dao.UserDao;
import com.springboot.news_.entity.NewsUser;
import com.springboot.news_.serviceDao.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class UserServiceIml implements UserService {
   @ Autowired
    UserDao userDao;
    @Override
    public List<NewsUser> FindAll() {
        return userDao.FindAll ();
    }
}
