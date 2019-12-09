package com.springboot.news_.serviceDaoIml;

import com.springboot.news_.dao.CategoryDao;
import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.serviceDao.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceIml implements CategoryService {
    @Autowired
    CategoryDao categoryDao;//注册接口实例
    @Override
    public List<NewsCategory> getNews_categorys() {
        return categoryDao.getNews_categorys ();
    }



    @Override
    public NewsCategory getNews_categoryById(Integer id) {
        return categoryDao.getNews_categoryById (id);
    }
}
