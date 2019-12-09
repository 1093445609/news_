package com.springboot.news_.serviceDao;

import com.springboot.news_.entity.NewsCategory;

import java.util.List;

public interface CategoryService {
    /*获取主题列表*/
    public List<NewsCategory> getNews_categorys();
    /*根据主题id获得主题实体对象*/
    public NewsCategory getNews_categoryById(Integer id);


}
