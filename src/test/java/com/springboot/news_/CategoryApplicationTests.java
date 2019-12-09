package com.springboot.news_;

import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.serviceDao.CategoryService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.logging.Logger;

@SpringBootTest
public class CategoryApplicationTests {
    @Autowired
    CategoryService cate; //正确 因为news包名下放bean小豆豆 自动连线
    @Test
    void contextLoads(){
        List<NewsCategory> list=cate.getNews_categorys ();
        System.out.println("数据查询新闻主题有:"+list.size ());


         NewsCategory newsCategory= cate.getNews_categoryById (1);
         System.out.println("id=1的新闻主题:"+newsCategory.getName ());










    }











}
