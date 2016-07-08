package com.eric.SRS.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SuperAction<T> extends ActionSupport
		implements ServletRequestAware, ServletResponseAware, ServletContextAware, ModelDriven<T> {
	private static final long serialVersionUID = 1L;

	protected HttpServletRequest request;// 请求对象
	protected HttpServletResponse response;// 响应对象
	protected HttpSession session;// 会话对象
	protected ServletContext application;// 全局对象
	protected T model = null;//模型

	@Override
	public T getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setServletContext(ServletContext application) {
		// TODO Auto-generated method stub
		this.application = application;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
		this.session = request.getSession();
	}

}
