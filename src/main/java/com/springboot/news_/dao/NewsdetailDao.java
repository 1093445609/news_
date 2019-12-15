package com.springboot.news_.dao;

import com.springboot.news_.entity.NewsDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface NewsdetailDao {
    /*查询搜索框 分类和查找内容*/

    List<NewsDetail> getLatestNews_details(@Param ("categoryId") Integer id,@Param ("search") String search );
    /*根据id 查*/
    NewsDetail getNews_detailById(Integer id);
    /*总数*/
    Integer getNewsCount(@Param ("categoryId") Integer id,@Param ("search") String search );
}
