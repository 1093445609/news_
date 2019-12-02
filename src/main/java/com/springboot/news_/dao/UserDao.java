package com.springboot.news_.dao;

import com.springboot.news_.entity.NewsUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface UserDao {

    @Select ("select userName,password from news_user ")
     public List< NewsUser> FindAll();


}
