package com.springboot.news_.serviceDaoIml;

import com.springboot.news_.dao.NewsdetailDao;
import com.springboot.news_.entity.NewsDetail;
import com.springboot.news_.serviceDao.NewsdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsdetailServiceIml implements NewsdetailService {
    @Autowired
    NewsdetailDao newsdetailDao;

    @Override
    public List<NewsDetail> getLatestNews_details(Integer id,String search,int currPage, int pageSize) {
        int firstIndex=(currPage-1)*pageSize;//分页开始数据
        int lastIndex=currPage*pageSize;//当前页从1开始,截至页数*每页数据
       Integer count= newsdetailDao.getNewsCount (id,search);//新闻总数
        if (lastIndex>count){
            lastIndex=count;
        }
        return newsdetailDao.getLatestNews_details (id,search).subList (firstIndex,lastIndex);
    }

    @Override
    public NewsDetail getNews_detailById(Integer id) {
        return newsdetailDao.getNews_detailById (id);
    }
}
