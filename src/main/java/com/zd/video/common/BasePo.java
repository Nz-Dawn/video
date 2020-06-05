package com.zd.video.common;

/**
 * 分页信息(配合layui)
 * @author Maochao-zhu
 * 返回 BasePageData.count参数和list 
 * XML文件中增加 <if test="pageSize>0"> limit #{currPage},#{pageSize} </if>
 * 即可获取分页数据信息
 */
public class BasePo {
	private int page;//当前页
	private int limit;//每页显示多少条数据
	private int currPage;//从第多少条数数据开始
	private int pageSize;//每页显示多少条数数据
	
	public BasePo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getCurrPage() {
		page = page<=0?1:page;
		currPage = (page-1) * limit; 
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	public int getPageSize() {
		pageSize = limit;
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
