package com.springboot.news_.dao;

import com.springboot.news_.entity.NewsDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface NewsdetailDao {
    /*获取最新新闻*/
    List<NewsDetail> getLatestNews_details(@Param ("categoryId") Integer id, Integer start, Integer limit );
/*根据id 查*/
    NewsDetail getNews_detailById(Integer id);
}
