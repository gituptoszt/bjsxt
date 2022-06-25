package com.http;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import com.http.HttpClientUtil;

public class HttpUtil {
	

	/**
	 * 接口调用返回JSONObject
	 * @param url
	 * @param createMap
	 * @return
	 * @throws JSONException
	 */ 
	
	/*Map<String,String> createMap = new HashMap<String,String>();  
		createMap2.put("time",times);  
	 */	
	public static JSONObject httpSend(String url, Map<String, String> createMap) throws JSONException { // 链接地址+参数
		// 编码格式
		String charset = "utf-8";
		HttpClientUtil httpClientUtil = new HttpClientUtil();
		String httpOrgCreateTest = url;
		// 请求接口地址+参数
		String httpOrgCreateTestRtn = httpClientUtil.doPost(httpOrgCreateTest, createMap, charset);
		// 转换JSONObject
		JSONObject json=new JSONObject(httpOrgCreateTestRtn); 
		
		return json;
	}
}
