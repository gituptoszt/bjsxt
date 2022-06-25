package com.action.back;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Admin;
import com.http.HttpClientUtil;
import com.service.AdminService;
@Controller
public class HttpTest {
	@Autowired
	private AdminService adminService;

	private String app_key = "xywx";

	private String charset = "utf-8";
	private HttpClientUtil httpClientUtil = null;

	public HttpTest() {
		httpClientUtil = new HttpClientUtil();
	}

	// 接口验证
	public String sinfle_login(String url, Map<String, String> createMap) { // 链接地址+参数

		String httpOrgCreateTest = url;
		String httpOrgCreateTestRtn = httpClientUtil.doPost(httpOrgCreateTest,
				createMap, charset);
		System.out.println("result:" + httpOrgCreateTestRtn);
		return httpOrgCreateTestRtn;

	}

	/**
	 * 单点登录 tour
	 * @return
	 * @throws JSONException
	 */
	@RequestMapping("singleLogin.html")
	public ModelAndView singleLogin(HttpServletRequest request,
			HttpServletResponse reponse, ModelMap modelmap)
			throws JSONException {
		String ticket = request.getParameter("ticket");
		// 单点登录认证
		Map<String, String> createMap = new HashMap<String, String>();
		createMap.put("app_key", app_key); // 应用标识
		createMap.put("ticket", ticket); // 签名

		String success = sinfle_login("http://localhost:8080/tour/singleLoginValidate.html",createMap);
		JSONObject json = new JSONObject(success);
		System.out.println("json:" + json);
		
		//如果code的值为200,则单点登录成功(获取到用户信息),应该跳转到首页,否则跳转到登录页面
		if(json.get("code").equals(200)){
			 JSONObject json1 = new JSONObject(json.get("userInfo").toString());
			 System.out.println(json1.get("phone"));
			 System.out.println(json1.get("name"));
			 Admin ad=new Admin();
			 ad.setName(json1.get("name").toString());
			 ad=adminService.selectOne(ad);
			 if(ad!=null){
				 request.getSession().setAttribute("adminSession", ad);
				 return new ModelAndView("redirect:index.html");
			 }
		}
		return new ModelAndView("redirect:login.html");
	}
}
