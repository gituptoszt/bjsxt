package com.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtils {


	// 获得今年的年份返回数字
	public static  String getCurYearNum() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = new Date();
		String formatDate = sdf.format(date);
		return formatDate;
	}

	// 或得当天的0点时间数据
	public static long getCurStartTime() {
		Calendar todayStart = Calendar.getInstance();
		todayStart.set(Calendar.HOUR, 0);
		todayStart.set(Calendar.MINUTE, 0);
		todayStart.set(Calendar.SECOND, 0);
		todayStart.set(Calendar.MILLISECOND, 0);
		return todayStart.getTime().getTime();
	}

	// 获得系统当前日期
	public static String getCurrentTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		return df.format(new Date());
	}
	// 获得系统当前日期
	public static String getCurrentTimes(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");// 设置日期格式
		return df.format(new Date());
	}
	// 获得系统当前日期
	public static String getCurrentMonth(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");// 设置日期格式
		return df.format(new Date());
	}
	
	// 获得系统当前日期
	public static String getCurrentTim(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		return df.format(new Date());
	}
	// 获得系统当前日期
	public static String getCurrent() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		return df.format(new Date());
	}
	
	// 获得系统当前日期
	public static String getCurrentHour(){
		SimpleDateFormat df = new SimpleDateFormat("HH");// 设置日期格式
		return df.format(new Date());
	}

	// 获得系统当前日期前一周的时间
	public static String getLastWeekTime(String currentDate){

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		Calendar curr = Calendar.getInstance();
		try {
			curr.setTime(df.parse(currentDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		curr.set(Calendar.DAY_OF_MONTH, curr.get(Calendar.DAY_OF_MONTH) - 7);
		Date date = curr.getTime();
		return df.format(date);
	}

	// 获得系统当前日期前一月的时间
	public static String getLastMonthTime(String currentDate){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		Calendar curr = Calendar.getInstance();
		try {
			curr.setTime(df.parse(currentDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		curr.set(Calendar.MONTH, curr.get(Calendar.MONTH) - 1);
		Date date = curr.getTime();
		return df.format(date);
	}
	// 获得某月后一月
	public static String getLastMonth(String currentDate,int num){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");// 设置日期格式
		Calendar curr = Calendar.getInstance();
		try {
			curr.setTime(df.parse(currentDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		curr.set(Calendar.MONTH, curr.get(Calendar.MONTH) + num);
		Date date = curr.getTime();
		return df.format(date);
	}
	// 获取本年的第一月
	 public static String getYearFirst(int year){  
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");// 设置日期格式
	        Calendar calendar = Calendar.getInstance();  
	        calendar.clear();  
	        calendar.set(Calendar.YEAR, year);  
	        Date currYearFirst = calendar.getTime();  
	        return df.format(currYearFirst);  
	    }  

	// 获得系统当前日期前一年的时间
	public static String getLastYearTime(String currentDate){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		Calendar curr = Calendar.getInstance();
		try {
			curr.setTime(df.parse(currentDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		curr.set(Calendar.YEAR, curr.get(Calendar.YEAR) - 1);
		Date date = curr.getTime();
		return df.format(date);
	}

	// 获得系统当前日期本周日的日期
	public static String getSunday(String currentDate){
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			cal.setTime(df.parse(currentDate));
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return df.format(cal.getTime());
	}
	
	// 获得系统当前日期本周六的日期
	public static String getSaturday(String currentDate){
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			cal.setTime(df.parse(currentDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		return df.format(cal.getTime());
	}

	// 根据日期获得星期
	public static String getWeekOfDate(String date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String[] weekDaysName = { "周日", "周一", "周二", "周三", "周四", "周五",
				"周六" };
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int intWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		return weekDaysName[intWeek];
	}
	// 根据日期获得月份
	public static String getMonthOfDate(String date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		String[] monthName = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int month = calendar.get(Calendar.MONTH);
		return monthName[month];
	}
	
	// 根据日期获得月第一天
	public static String getFirstDay(String date,int i){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendar.add(Calendar.MONTH, i);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return df.format(calendar.getTime());
	}

	// 根据日期获得月最后一天
	public static String getLastDay(String date,int i){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		// 获取当前月最后一天
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendar.add(Calendar.MONTH, i);
		calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return df.format(calendar.getTime());
	}
	
	// 据日期获得本月天数
	public static int getMonthDays(String date)throws ParseException {  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance(); 
        calendar.setTime(df.parse(date));
        calendar.set(Calendar.DATE, 1);  
        calendar.roll(Calendar.DATE, -1);  
        return calendar.get(Calendar.DATE);
    }  
	
	// 根据参数获得格式化日期数据
	public static String geFormatDate(String date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		return df.format(new Date());

	}

	// 获取从今天开始的以后的若干天
	public static String getfutureTime(int difDays){
		// 获取当前日期
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String nowDate = sf.format(date);
		// 通过日历获取日期
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sf.parse(nowDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.add(Calendar.DAY_OF_YEAR, difDays);
		String futureDate = sf.format(cal.getTime());
		return futureDate;
	}

	// 获取从某天开始以后的若干天
	public static String getDays(String startTime, int difDays){
		// 获取当前日期
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		// 通过日历获取日期
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sf.parse(startTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.add(Calendar.DAY_OF_YEAR, difDays);
		String getDays = sf.format(cal.getTime());
		return getDays;
	}

	// 获取从某天开始以后的若干小时
	public static String getDayHours(String startTime, int difHours)
			throws ParseException {
		// 获取当前日期
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH");
		// 通过日历获取日期
		Calendar cal = Calendar.getInstance();
		cal.setTime(sf.parse(startTime));
		cal.add(Calendar.HOUR_OF_DAY, difHours);
		String getDays = sf.format(cal.getTime());
		return getDays;
	}

	//
	public static String getDayHourSeconds(String startTime, int difSeconds)
			throws ParseException {
		// 获取当前日期
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		// 通过日历获取日期
		Calendar cal = Calendar.getInstance();
		cal.setTime(sf.parse(startTime));
		cal.add(Calendar.DAY_OF_YEAR, difSeconds);
		String getDays = sf.format(cal.getTime());
		return getDays;
	}

	// 获取2个时间差的天数具体值
	public static List<String> getDifDays(String startTime, String endTime)
			throws ParseException {
		SimpleDateFormat getDidParam = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(getDidParam.parse(startTime));
		long stTime = cal.getTimeInMillis();
		cal.setTime(getDidParam.parse(endTime));
		long edTime = cal.getTimeInMillis();
		long difdays = (edTime - stTime) / (1000 * 3600 * 24);
		List<String> difDays = new ArrayList<String>();
		for (int i = 0; i <= difdays; i++)// 这里获取到实际的日期值 和索引 这里写等于因为临界值
		{
			difDays.add(getDays(startTime, i));
		}
		return difDays;
	}
	// 获取2个时间差的天数具体值
	public static int getDifDay(String startTime, String endTime)
			throws ParseException {
		SimpleDateFormat getDidParam = new SimpleDateFormat("MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(getDidParam.parse(startTime));
		long stTime = cal.getTimeInMillis();
		cal.setTime(getDidParam.parse(endTime));
		long edTime = cal.getTimeInMillis();
		long difdays = (edTime - stTime) / (1000 * 3600 * 24)+1;
		return Integer.parseInt(String.valueOf(difdays));
	}
	// 获取2个时间差的天数具体值
	public static int getDifDayss(String startTime, String endTime)
			throws ParseException {
		SimpleDateFormat getDidParam = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(getDidParam.parse(startTime));
		long stTime = cal.getTimeInMillis();
		cal.setTime(getDidParam.parse(endTime));
		long edTime = cal.getTimeInMillis();
		long difdays = (edTime - stTime) / (1000 * 3600 * 24)+1;
		return Integer.parseInt(String.valueOf(difdays));
	}
	// 获取两个年份相差年数
	public static int getDifYear(String startTime, String endTime)
			throws ParseException {
		SimpleDateFormat getDidParam = new SimpleDateFormat("yyyy");
		Calendar begin = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		begin.setTime(getDidParam.parse(startTime));
		end.setTime(getDidParam.parse(endTime));
		int difdays =end.get(Calendar.YEAR)-begin.get(Calendar.YEAR);
		return difdays;
	}

	// 获取到一个小时之内的随机时间
	public static Date getRandomTime(String beginDate, String endDate) {
		try {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd:hh:mm:ss");
			Date start = format.parse(beginDate);// 构造开始日期
			Date end = format.parse(endDate);// 构造结束日期
			// getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。

			if (start.getTime() >= end.getTime()) {

				return null;

			}

			long date = random(start.getTime(), end.getTime());

			return new Date(date);

		} catch (Exception e) {

			e.printStackTrace();

		}
		return null;
	}

	// 获取指定范围的随机数
	private static long random(long begin, long end) {
		long rtn = begin + (long) (Math.random() * (end - begin));
		// 如果返回的是开始时间和结束时间，则递归调用本函数查找随机值
		if (rtn == begin || rtn == end) {
			return random(begin, end);
		}
		return rtn;
	}

	// 获取到比现在小时相差若干个小时的 时间text
	public static String getDifHour(String startHour, int difHours) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(startHour);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.add(Calendar.HOUR_OF_DAY, difHours);
		return sdf.format(ca.getTime());
	}

	public static String getAllTime(){
		String start = "2014-02-01";
		String end = "2014-03-02";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dBegin;
		Date dEnd;
		try {
			dEnd = sdf.parse(end);
			dBegin= sdf.parse(start);
			List<Date> lDate = findDates(dBegin, dEnd);
			for (Date date : lDate) {
				System.out.println(sdf.format(date));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "";
	}

	public static List<Date> findDates(Date dBegin, Date dEnd) {
		List lDate = new ArrayList();
		lDate.add(dBegin);
		Calendar calBegin = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calEnd.setTime(dEnd);
		// 测试此日期是否在指定日期之后
		while (dEnd.after(calBegin.getTime())) {
			// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
			calBegin.add(Calendar.SECOND, 60);
			lDate.add(calBegin.getTime());
		}
		return lDate;
	}
	/***
	 * 日期减一分钟
	 * 
	 * @return
	 */
	public static String getdateHHjianyi() {
		
		Date beginDate = new Date();
		Calendar date = Calendar.getInstance();
		date.setTime(beginDate);
		date.set(Calendar.MINUTE, date.get(Calendar.MINUTE) - 1);
		Date endDate = date.getTime();

		return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(endDate);
	}
	/***
	 * 日期加30分钟
	 * 
	 * @return
	 * @throws ParseException 
	 */
	public static String getHalfHour(String minute){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar date = Calendar.getInstance();
		try {
			date.setTime(sdf.parse(minute));
			date.set(Calendar.MINUTE, date.get(Calendar.MINUTE) +30);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date endDate = date.getTime();
		return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(endDate);
	}
	
}
