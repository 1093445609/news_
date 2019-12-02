package com.springboot.news_.entity;


public class NewsComment {

  private long id;
  private long newsid;
  private String content;
  private java.sql.Timestamp createDate;
  private String ip;
  private String author;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getNewsid() {
    return newsid;
  }

  public void setNewsid(long newsid) {
    this.newsid = newsid;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public java.sql.Timestamp getCreateDate() {
    return createDate;
  }

  public void setCreateDate(java.sql.Timestamp createDate) {
    this.createDate = createDate;
  }


  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }


  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

}
