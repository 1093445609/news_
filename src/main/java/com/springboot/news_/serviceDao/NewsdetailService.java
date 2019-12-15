package com.springboot.news_.serviceDao;

import com.springboot.news_.entity.NewsDetail;

import java.util.List;

public interface NewsdetailService {
    /*
    * 获取最新的新闻
    * */
     public List<NewsDetail> getLatestNews_details(Integer id,String search,int currPage, int pageSize);
/*根据新闻id获取新闻实体对象*/
    public  NewsDetail getNews_detailById(Integer id) ;


}
