package com.springboot.news_.dao;

import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.entity.NewsUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface CategoryDao {
    /*获取主题列表*/
    public List<NewsCategory> getNews_categorys();
    /*根据主题id获得主题实体对象*/
    public NewsCategory getNews_categoryById(Integer id);
}
