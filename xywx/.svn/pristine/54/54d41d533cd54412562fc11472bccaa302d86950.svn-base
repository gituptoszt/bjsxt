package com.utils;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

public class DataUtils {

	/**
	 * 获取访问者ip地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIp(HttpServletRequest request) {

		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		System.out.println(ip);
		// 因为有些有些登录是通过代理，所以取第一个（第一个为真是ip）
		int index = ip.indexOf(',');
		if (index != -1) {
			ip = ip.substring(0, index);
		}
		return ip;
	}

	/**
	 * 获取指定位数的随机数字
	 * @param length 随机数长度
	 * @return
	 */
	public static String getRandom(int length) {
		if (length <= 0) {  
            length = 1;  
        }  
        StringBuilder res = new StringBuilder();  
        Random random = new Random();  
        int i = 0;  
        while (i < length) {  
            res.append(random.nextInt(10));  
            i++;  
        }  
        return res.toString();  
	}
	
	
}
