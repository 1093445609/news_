package com.springboot.news_.serviceDao;

import com.springboot.news_.entity.NewsUser;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {

    public List<NewsUser> FindAll();
}
