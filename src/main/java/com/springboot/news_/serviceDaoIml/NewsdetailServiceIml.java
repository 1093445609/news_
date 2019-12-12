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
    public List<NewsDetail> getLatestNews_details(Integer id,Integer start, Integer size,String search) {
        return newsdetailDao.getLatestNews_details (id,start, size,search);
    }

    @Override
    public NewsDetail getNews_detailById(Integer id) {
        return newsdetailDao.getNews_detailById (id);
    }
}
