package com.springboot.news_.dao;

import com.springboot.news_.vo.NewsVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
@Mapper
@Component
public interface NewsVoDao {

    public NewsVo FindAll();

}
