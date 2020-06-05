package com.zd.video.po.sys;

import java.util.Date;

public class Video {
    private Integer id;

    private String desception;

    private String url;

    private Integer star;

    private Integer category;

    private Integer iscandown;

    private String createtime;

    private Integer createuserid;

    private String time;

    private String cover;

    private String createuname;

    public String getCreateuname() {
        return createuname;
    }

    public void setCreateuname(String createuname) {
        this.createuname = createuname;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDesception() {
        return desception;
    }

    public void setDesception(String desception) {
        this.desception = desception == null ? null : desception.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public Integer getIscandown() {
        return iscandown;
    }

    public void setIscandown(Integer iscandown) {
        this.iscandown = iscandown;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public Integer getCreateuserid() {
        return createuserid;
    }

    public void setCreateuserid(Integer createuserid) {
        this.createuserid = createuserid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}