package com.springboot.news_.dao;

import com.springboot.news_.entity.NewsUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
//@Repository
@Component
public interface UserDao {

  //  @Select ("select userName,password from news_user ")
     public List< NewsUser> FindAll();

   // @Select ("select * from news_user where userName=#{name} and password=#{pwd}")
    public  NewsUser FindUser(NewsUser newsUser);


}
