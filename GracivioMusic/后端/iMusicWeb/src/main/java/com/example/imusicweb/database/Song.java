package com.example.imusicweb.database;

import java.util.Date;

public class Song {
    private Integer id;
    private Integer singer_id;
    private String name;
    private String introduction;
    private Date create_time;
    private Date update_time;
    private String pic;
    private String lyric;
    private String url;
    private Integer visited_times;
    private Integer liked_times;
    private Integer comment_times;
    private int clickTimes;

    public int getClickTimes() {
        return clickTimes;
    }

    public void setClickTimes(int clickTimes) {
        this.clickTimes = clickTimes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSinger_id() {
        return singer_id;
    }

    public void setSinger_id(Integer singer_id) {
        this.singer_id = singer_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getVisited_times() {
        return visited_times;
    }

    public void setVisited_times(Integer visited_times) {
        this.visited_times = visited_times;
    }

    public Integer getLiked_times() {
        return liked_times;
    }

    public void setLiked_times(Integer liked_times) {
        this.liked_times = liked_times;
    }

    public Integer getComment_times() {
        return comment_times;
    }

    public void setComment_times(Integer comment_times) {
        this.comment_times = comment_times;
    }
}
