package com.test;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;



public class junitTest {
	
	@Test
	public void test() {
		Map<String, String> createMap = new HashMap<String, String>();
		createMap.put("app_key", "ticket"); // 应用标识
		createMap.put("ticket", "ticket"); 
		assertEquals(2, new testDemo().add(1, 2));
	}

}
