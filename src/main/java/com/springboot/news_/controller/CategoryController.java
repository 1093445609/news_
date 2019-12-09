package com.springboot.news_.controller;

import com.springboot.news_.entity.NewsCategory;
import com.springboot.news_.serviceDao.CategoryService;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
/*controller先写,url后面根据j's'p更改
*
* 这些都是不展示查询的是主题id
* */
@RestController
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @RequestMapping("/category")
    public  String getNews_categorys(Model model){
        List<NewsCategory> list=categoryService.getNews_categorys ();
        model.addAttribute ("list",list);
        return list.toString ();
    }
    @RequestMapping("/categorybyid")
    public  String getNews_categoryById(Model model,Integer id){
        id=2;
        NewsCategory newsCategory=categoryService.getNews_categoryById (id);
       // model.addAttribute ("newsCategory",newsCategory);
        return newsCategory.getName ();

    }


}
