package com.http;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
/* 
 * 利用HttpClient进行post请求的工具类 
 */  
public class HttpClientUtil {  
	/**
	 * 传进来的参数,一个是网址,一个是map(可以包含签名sign,ticket,时间,应用标识等信息)
	 * @param url
	 * @param map
	 * @param charset
	 * @return
	 */
    public String doPost(String url,Map<String,String> map,String charset){  
        HttpClient httpClient = null;  
        HttpPost httpPost = null;  
        String result = null;  
        try{  
            httpClient = new SSLClient();  
            httpPost = new HttpPost(url);  
            //设置参数  
            List<NameValuePair> list = new ArrayList<NameValuePair>();  
            Iterator iterator = map.entrySet().iterator(); //高效遍历Map的方式 
            while(iterator.hasNext()){  
                Entry<String,String> elem = (Entry<String, String>) iterator.next();  
                list.add(new BasicNameValuePair(elem.getKey(),elem.getValue()));  //BasicNameValuePair是存储键值对的类
            }  
            if(list.size() > 0){
            	//UrlEncodedFormEntity这个类是用来把输入数据编码成合适的内容
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,charset);  
                httpPost.setEntity(entity);  //使用httpPost的setEntry()来设置请求参数
            }  
            HttpResponse response = httpClient.execute(httpPost);  //返回一个HttpResponse
            if(response != null){ 
            	//获取服务器的响应内容
                HttpEntity resEntity = response.getEntity();  //getEntity()方法可获取HttpEntity对象,该对象包装了服务器的响应内容
                if(resEntity != null){
                	//EntityUtils为HttpEntity对象提供的静态帮助类,把内容转成字符串
                    result = EntityUtils.toString(resEntity,charset);  
                }  
            }  
        }catch(Exception ex){  
            ex.printStackTrace();  
        }  
        return result;  
    }  
    
    
   
}  