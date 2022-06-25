package com.http;
import java.util.HashMap;  
import java.util.Map;  
//对接口进行测试  
public class TestMain {  
    private String url = "http://192.168.1.77:8080/school/swsw.html";  
    private String charset = "utf-8";   
    private HttpClientUtil httpClientUtil = null;  
      
    public TestMain(){    
        httpClientUtil = new HttpClientUtil();  
    }  
        
    public void test(){  
        String httpOrgCreateTest = url;  
        Map<String,String> createMap = new HashMap<String,String>();  
       /* createMap.put("name","测试");  
        createMap.put("pwd","密码");  
        createMap.put("phone","手机号");  */
        String httpOrgCreateTestRtn = httpClientUtil.doPost(httpOrgCreateTest,createMap,charset);  
        System.out.println("result:"+httpOrgCreateTestRtn);  
    }   
      
    public static void main(String[] args){  
        TestMain main = new TestMain();  
       main.test();  
    }  
}