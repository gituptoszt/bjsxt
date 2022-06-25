package com.interceptors;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * 拦截器 负责对身份的验证
 * 
 * @author wind
 * 
 */
@Controller
public class MyInterceptor extends HandlerInterceptorAdapter {
	// 存放不拦截的请求 在 spring.xml中配置
	private List<String> uncheckUrls;
	List<String> listdata = new ArrayList<String>();


	/**
	 * 最后执行，可用于释放资源
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	/**
	 * 显示视图前执行
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 请求前拦截
	 * */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("拦截器启动");
		//判断是否需要拦截 集合里的值 在spring配置文件里配置
                String requestname = request.getRequestURI().substring(1);
		if (!uncheckUrls.contains(requestname)) {
		   return super.preHandle(request, response, handler);
		}
		return super.preHandle(request, response, handler);
	}

	public List<String> getUncheckUrls() {
		return uncheckUrls;
	}

	public void setUncheckUrls(List<String> uncheckUrls) {
		this.uncheckUrls = uncheckUrls;
	}

	

}
