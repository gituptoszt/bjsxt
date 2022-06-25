package com.action.back;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Admin;
import com.entity.Article;
import com.entity.Link;
import com.entity.Notice;
import com.entity.Type;
import com.entity.Type2;
import com.google.gson.Gson;
import com.service.AdminService;
import com.service.ArticleService;
import com.service.LinkService;
import com.service.NoticeService;
import com.service.Type2Service;
import com.service.TypeService;

@Controller
public class IndexAction { 
	
	 @Autowired 
	 private AdminService adminService;
	 @Autowired 
	 private NoticeService noticeService;
	 @Autowired 
	 private ArticleService articleService;
	 @Autowired 
	 private LinkService linkService;
	 @Autowired 
	 private TypeService typeService;
	 @Autowired 
	 private Type2Service type2Service;
	 

	/**
	 * 首页index(所有页框架)
	 * 将登陆user信息返回到页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("index.html")
	public ModelAndView selectAll(HttpServletRequest request, ModelMap modelmap) {
		
		Admin adminSession=(Admin) request.getSession().getAttribute("adminSession");
		modelmap.put("adminSession", adminSession);
		return new ModelAndView("back/index");
	}

	
	/**
	 * 登录页面
	 * 无信息返回到页面
	 * @return
	 */
	@RequestMapping("login.html")
	public ModelAndView login(HttpServletRequest request, ModelMap modelmap) {
		
		if(request.getSession().getAttribute("adminSession")!=null){
			request.getSession().removeAttribute("adminSession");
		}else{
			
		}
		modelmap.put("", "");
		return new ModelAndView("back/login");
	}
	
	/**
	 *以下是对用户表admin表的增删改查 
	 */
	
	
	/**
	 * 方法
	 * 根据账户密码判断是否有这个用户
	 * @param obj
	 * @param request
	 * @param response
	 * @param modelmap
	 */
	@RequestMapping("isLoginSuccess.html")
	public void isLoginSuccess(Admin obj, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		String code=obj.getBei_1();
		obj.setBei_1(null);
		obj = adminService.selectOne(obj);
		int a = 0;
		String code1=(String) request.getSession().getAttribute("codeGetPwd");
		if(!code.equalsIgnoreCase(code1)){
			a=2;
		}else if (obj == null) {
			a = 1;
		}else if (obj != null) {
			//将对象放到session里面,session作用域都可以取到
			request.getSession().setAttribute("adminSession", obj);
			a = 3;
		}
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 获取用户信息方法
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("getUserInfo.html")
	public void getUserInfo(HttpServletRequest request,
			HttpServletResponse response) {
		int status=0;
		if (request.getSession().getAttribute("adminSession") != null) {
			status=200;
		}else{
			status=400;
		}
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(status);    
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	@RequestMapping("getUserName.html")
	public void getUserName(Admin admin,HttpServletRequest request,
			HttpServletResponse response) {
		//根据用户id查询用户
		admin=adminService.selectOne(admin);
		String jsonList = new Gson().toJson(admin);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);    
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 用户信息页面
	 * 获取用户的账号,昵称,头像
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("userInfo.html")
	public ModelAndView userInfo(HttpServletRequest request, ModelMap modelmap) {
		//因为登录时用户已经放到session里面,所以页面可以直接从session里面取到对象的信息
		//这里不需要重新查询对象数据
		return new ModelAndView("back/userInfo");
	}
	/**
	 * 用户信息修改方法
	 * 
	 * @param obj
	 * @param request
	 * @param response 
	 * @param modelmap
	 */
	@RequestMapping("userInfoUpdate.html")
	public void userInfoUpdate(Admin obj, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		//更新对象,且移除session里面的这个对象,将更新后的对象重新放到session里面
		int a= adminService.update(obj);
		request.getSession().removeAttribute("adminSession");
		Admin ad =new Admin();
		ad.setId(obj.getId());
		ad=adminService.selectOne(ad);
		request.getSession().setAttribute("adminSession",ad);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(a);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping("changePwd.html")
	public ModelAndView changePwd(HttpServletRequest request, ModelMap modelmap) {

		modelmap.put("", "");
		return new ModelAndView("back/changePwd");
	}
	/**
	 * 密码修改
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("userPwdUpdate.html")
	public void userPwdUpdate(String pwd,HttpServletRequest request,
			HttpServletResponse response) { 
		int a=0;
		if (request.getSession().getAttribute("adminSession") != null) {
			Admin admin=(Admin)request.getSession().getAttribute("adminSession");
			admin.setPwd(pwd);
			a = adminService.update(admin);
			request.getSession().setAttribute("adminSession",admin);
		}
		
		
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(a);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 用户列表网页
	 * 
	 * @return
	 */
	@RequestMapping("allUsers.html")
	public ModelAndView allUsers(HttpServletRequest request, ModelMap modelmap) {
		
		modelmap.put("", "");
		return new ModelAndView("back/allUsers");
	}
	/**
	 * 用户列表信息获取方法
	 * @param obj
	 * @param request
	 * @param response
	 * @param modelmap
	 */
	@RequestMapping("usersList.html")
	public void userList(Admin admin, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {

		List<Admin> userList = adminService.selectAll(admin);

		String jsonList = new Gson().toJson(userList);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 添加用户网页
	 * 
	 * @return
	 */
	@RequestMapping("addUser.html")
	public ModelAndView addUser(HttpServletRequest request, ModelMap modelmap) {
		modelmap.put("", "");
		return new ModelAndView("back/addUser");
	}
	
	/**
	 * 用户添加(方法)
	 * 
	 * @return
	 */
	@RequestMapping("userInsert.html")
	public void userInsert(Admin admin, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		//这里需要给每个用户添加一个默认的头像
		int a = adminService.insert(admin);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 * 编辑用户网页
	 * 这里前台js获取value值(id)拼接在url中传入
	 * @return
	 */
	@RequestMapping("editUser.html")
	public ModelAndView editUser(Admin admin,HttpServletRequest request, ModelMap modelmap) {
		admin=adminService.selectOne(admin);
		modelmap.put("user", admin);
		return new ModelAndView("back/editUser");
	}
	/**
	 * 编辑用户方法
	 * @param obj
	 * @param request
	 * @param response
	 * @param modelmap
	 */
	@RequestMapping("userUpdate.html")
	public void userUpdate(Admin admin, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		
		int a = adminService.update(admin);
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	/**
	 * 用户删除(批量删除)
	 * 
	 * @return
	 */
	@RequestMapping("usersDelete.html")
	public void usersDelete(String ids, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {

		String[] str = ids.split(",");
		List<String> list = new ArrayList<String>();// 集合转list
		list = Arrays.asList(str);
		int a = adminService.deleteAll(list);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 * 以上关于admin用户的功能基本完成
	 */
	
	

	/**
	 * 首页home(主页)
	 * 
	 * @return
	 */
	@RequestMapping("home.html")
	public ModelAndView home(HttpServletRequest request, ModelMap modelmap) {

		modelmap.put("", "");
		return new ModelAndView("back/home");
	}
	
	/**
	 * home页面获取用户总数方法
	 * @return
	 */
	@RequestMapping("allUsersNum.html")
	public void allUsersNum(Admin admin, HttpServletRequest request,HttpServletResponse response,
			ModelMap modelmap) {

		List<Admin> userList = adminService.selectAll(admin);
		int num=userList.size();
		String numJson = new Gson().toJson(num);
		
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(numJson);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * home页面获取文章总数方法
	 * @return
	 */
	@RequestMapping("allArticleNum.html")
	public void allArticleNum(Article article, HttpServletRequest request,HttpServletResponse response,
			ModelMap modelmap) {
		//状态为1则是为删除的
		article.setSt(1);
		List<Article> articleList = articleService.selectAll(article);
		int num=articleList.size();
		String numJson = new Gson().toJson(num);
		
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(numJson);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * home页面获取学校公告总数方法
	 * @return
	 */
	/*@RequestMapping("allNoticeNum.html")
	public void allNoticeNum(Notice notice, HttpServletRequest request,HttpServletResponse response,
			ModelMap modelmap) {
		
		List<Notice> noticeList = noticeService.selectAll(notice);
		int num=noticeList.size();
		String numJson = new Gson().toJson(num);
		
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(numJson);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}*/
	
	/**
	 * 学校公告查询方法
	 * 
	 * @return
	 */
	@RequestMapping("noticeList.html")
	public void noticeList(HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		
		Notice notice=new Notice();
		
		List<Notice> noticeList=noticeService.selectAll(notice);
		
		String jsonList = new Gson().toJson(noticeList);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	
	
	/**
	 * 学校公告列表页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("noticeListShow.html")
	public ModelAndView noticeListShow(HttpServletRequest request, ModelMap modelmap) {

		modelmap.put("", "");
		return new ModelAndView("back/noticeListShow");
	}
	
	/**
	 *学校公告添加页面
	 * 
	 * @return
	 */
	@RequestMapping("noticeAddShow.html")
	public ModelAndView noticeAddShow(HttpServletRequest request, ModelMap modelmap) {
		modelmap.put("", "");
		return new ModelAndView("back/noticeAddShow");
	}
	
	/**
	 * 学校公告添加方法
	 * 
	 * @return
	 */
	@RequestMapping("noticeAdd.html")
	public void noticeAdd(Notice notice,HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		
		int a =noticeService.insert(notice);
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 学校公告编辑页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("noticeEditShow.html")
	public ModelAndView noticeEditShow(Notice obj, HttpServletRequest request, ModelMap modelmap) {
		
		obj=noticeService.selectOne(obj);
		modelmap.put("obj", obj);
		return new ModelAndView("back/noticeEditShow");
	}
	/**
	 * 学校公告编辑方法
	 * 
	 * @return
	 */
	@RequestMapping("noticeEdit.html")
	public void noticeEdit(Notice notice,HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		
		int a =noticeService.update(notice);
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 公告删除(包括批量删除)
	 * 
	 * @return
	 */
	@RequestMapping("noticeDelete.html")
	public void noticeDelete(String ids, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {

		String[] str = ids.split(",");
		List<String> list = new ArrayList<String>();// 集合转list
		list = Arrays.asList(str);
		int a = noticeService.deleteAll(list);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	
	
	
	
	/**
	 * 友情链接列表页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("linkListShow.html")
	public ModelAndView linkListShow(HttpServletRequest request, ModelMap modelmap) {
		
		modelmap.put("", "");
		return new ModelAndView("back/linkListShow");
	}
	/**
	 * 友情链接查询方法
	 * 
	 * @return
	 */
	@RequestMapping("linkList.html")
	public void linkList(HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		
		Link link=new Link();
		
		List<Link> linkList=linkService.selectAll(link);
		
		String jsonList = new Gson().toJson(linkList);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	
	
	/**
	 *友情链接添加页面
	 * 
	 * @return
	 */
	@RequestMapping("linkAddShow.html")
	public ModelAndView linkAddShow(HttpServletRequest request, ModelMap modelmap) {
		modelmap.put("", "");
		return new ModelAndView("back/linkAddShow");
	}
	
	/**
	 * 添加友情链接将数据保存到数据库(方法)
	 * 
	 * @return
	 */
	@RequestMapping("linkInsert.html")
	public void linkInsert(Link link, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		int a = linkService.insert(link);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 * 友情链接编辑页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("linkEditShow.html")
	public ModelAndView linkEdit(Link obj, HttpServletRequest request, ModelMap modelmap) {
		
		obj=linkService.selectOne(obj);
		modelmap.put("obj", obj);
		return new ModelAndView("back/linkEditShow");
	}
	/**
	 * 友情链接编辑提交后数据保存方法
	 * @param obj
	 * @param request
	 * @param response
	 * @param modelmap
	 */
	@RequestMapping("linkUpdate.html")
	public void linkUpdate(Link link, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		//更新link对象
		int a = linkService.update(link);
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	
	/**
	 * 链接删除(包括批量删除)
	 * 
	 * @return
	 */
	@RequestMapping("linkDelete.html")
	public void linkDelete(String ids, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {

		String[] str = ids.split(",");
		List<String> list = new ArrayList<String>();// 集合转list
		//将数组转成list
		list = Arrays.asList(str);
		int a = linkService.deleteAll(list);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	
	/**
	 * 文章类型列表页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("typeListShow.html")
	public ModelAndView typeListShow(HttpServletRequest request, ModelMap modelmap) {
		
		modelmap.put("", "");
		return new ModelAndView("back/typeListShow");
	}
	/**
	 * 文章类型查询方法
	 * 返回类型表1所有的类型(一级类型)
	 * @return
	 */
	@RequestMapping("typeList.html")
	public void typeList(HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		//获取类型表1所有的类型(一级类型)
		Type type=new Type();
		List<Type> typeList=typeService.selectAll(type);
		//将类型返回到页面
		String jsonList = new Gson().toJson(typeList);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 文章类型查询方法
	 * 返回类型表2所有的类型(二级类型)
	 * 这里ajax已经将type_id(一级类型的id)传进来
	 * @return
	 */
	@RequestMapping("type2List.html")
	public void type2List(Type2 type2,HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		//获取类型表2所有的类型(二级类型)
		List<Type2> type2List=type2Service.selectAll(type2);
		//将类型返回到页面
		String jsonList = new Gson().toJson(type2List);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	
	/**
	 *文章一级类型添加页面
	 * 
	 * @return
	 */
	@RequestMapping("typeAddShow.html")
	public ModelAndView typeAddShow(HttpServletRequest request, ModelMap modelmap) {
		modelmap.put("", "");
		return new ModelAndView("back/typeAddShow");
	}
	
	
	/**
	 * 添加文章类型将数据保存到数据库(方法)
	 * 
	 * @return
	 */
	@RequestMapping("typeInsert.html")
	public void typeInsert(Type type, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		int a = typeService.insert(type);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 * 文章类型编辑页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("typeEditShow.html")
	public ModelAndView typeEdit(Type obj, HttpServletRequest request, ModelMap modelmap) {
		obj=typeService.selectOne(obj);
		modelmap.put("obj", obj);
		return new ModelAndView("back/typeEditShow");
	}
	
	
	/**
	 * 文章类型编辑页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("type2EditShow.html")
	public void type2Edit(Type2 obj, HttpServletRequest request,HttpServletResponse response, ModelMap modelmap) {
		List<Type2> type2List=type2Service.selectAll(obj);
		String jsonList = new Gson().toJson(type2List);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	
	
	/**
	 * 文章类型编辑提交后数据保存方法(包括添加二级类型)
	 * @param obj
	 * @param request
	 * @param response
	 * @param modelmap
	 */
	@RequestMapping("typeUpdate.html")
	public void typeUpdate(Type type, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		//这里使用bei_1字段来接收前台传过来的所有input的值
		String type2List=type.getBei_1();
		//这里使用bei_2字段来接收前台传过来的所有input的id,若是新添加的,则id为0
		String type2IdList=type.getBei_2();
		
		type.setBei_1("");
		type.setBei_2("");
		//更新修改的一级类型
		int a = typeService.update(type);
		
		Type2 type2=new Type2();
		
		//这里是将获得的所有input的值与id转换成数组
		String[] type2Arr=type2List.split(",");
		String[] type2IdArr=type2IdList.split(",");
		//添加或者修改
		for(int i=0;i<type2Arr.length;i++){
			//将字符串转换成int类型
			int strToInt=Integer.parseInt(type2IdArr[i]);
			
			//若strToInt为0,则对应的数据类型是新添加的,若不为0,则strToInt是该类型的id修改
			if(strToInt==0){
				type2.setName(type2Arr[i]);
				type2.setType_id(type.getId());//设置一级类型的id字段作为类型外键
				//将新生成的数据添加到数据库
				int a1=type2Service.insert(type2);
			}else{
				//因为strToInt是数据的id,所以这里再次设置这个id
				type2.setId(strToInt);
				type2.setName(type2Arr[i]);
				type2.setType_id(type.getId());//设置一级类型的id字段作为类型外键
				//将原来的数据修改
				int a2=type2Service.update(type2);
			}
			
		}
		
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	
	/**
	 * 文章一级类型删除(包括批量删除)
	 * 删除一级类型要删除对应的二级类型,并将文章的状态置为1
	 * @return
	 */
	@RequestMapping("typeDelete.html")
	public void typeDelete(String ids, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		//这里的id是所有一级类型的id
		String[] str = ids.split(",");
		System.out.println(str);
		
		//两种方式:一种是查询出来所有一级类型对应的文章,改st  (所用方式)
		//另外一种方式是查询所有文章,判断文章的type_id是不是与一级id相等,所是,改st
		
		// 取到每一个id,转换成int类型,根据id删除对应的二级类型以及将文章状态位置2
		for (int i = 0; i < str.length; i++) {
			int id = Integer.parseInt(str[i]);
			//查询所有类型为 删除的一级类型对应的文章
			Article article = new Article();
			article.setType_id(id);
			List<Article> aList=articleService.selectAll(article);
			//在将根据这个一级类型id条件查询出来的文章的st字段设置为2
			for(Article article1:aList){
				article1.setSt(2);// 将状态位置为2
				// 将对应的一级类型下的文章状态位置为2
				articleService.update(article1);
			}
			
			//查询所有类型为 删除的一级类型对应的二级类型,并一个个的删除
			Type2 type2 = new Type2();
			type2.setType_id(id);
			List<Type2> type2List=type2Service.selectAll(type2);
			// 删除对应所删除一级类型的二级类型
			for(Type2 type2_1:type2List){
				type2Service.delete(type2_1);
			}
			
			
		}
		
		List<String> list = new ArrayList<String>();// 集合转list
		list = Arrays.asList(str);
		//删除所有的一级类型
		int a = typeService.deleteAll(list);
		
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 *文章二级类型添加页面
	 * 页面已不再使用
	 * @return
	 */
	/*@RequestMapping("type2AddShow.html")
	public ModelAndView typeAddShow2(Type type,HttpServletRequest request, ModelMap modelmap) {
		type=typeService.selectOne(type);
		modelmap.put("type",type);
		return new ModelAndView("back/type2AddShow");
	}*/
	/*@RequestMapping("type2ListShow.html")
	public ModelAndView type2ListShow(Type type,HttpServletRequest request, ModelMap modelmap) {
		type=typeService.selectOne(type);
		modelmap.put("type",type);
		return new ModelAndView("back/type2ListShow");
	}*/
	/**
	 * 文章二级类型添加页面二级类型显示查询方法
	 * 将二级类型返回到页面用ajax,js展示在页面上
	 * @param obj
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("type2AddListQuery.html")
	public void workItemListQuery(Type2 obj, HttpServletRequest request,HttpServletResponse response, ModelMap modelmap) {
		List<Type2> itemlist=type2Service.selectAll(obj);
		String jsonList = new Gson().toJson(itemlist);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	/**
	 * 文章二级类型删除
	 * 
	 * @return
	 */
/*	@RequestMapping("type2Delete.html")
	public void type2Delete(Type2 type2, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		int a=0;
		if(type2.getId()!=0){
			Article article = new Article();
			article.setType_id(type2.getId());
			article.setSt(3);// 将状态位置为3
			// 将对应的二级类型下的文章状态位置为3
			int a2 = articleService.update(article);
			//删除二级类型
			 a=type2Service.delete(type2);
		}else{
			 a =1;
		}
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}*/
	
	@RequestMapping("type2Delete.html")
	public void type2Delete(Type2 type2, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		int a=0;
		//根据传进来的二级id查询对应的文章
		Article article = new Article();
		article.setType2_id(type2.getId());
		List<Article> articleList=articleService.selectAll(article);
		//将查询到的文章的状态st设置为3
		for(Article article1:articleList){
			article1.setSt(3);// 将状态位置为3
			articleService.update(article1);
		}
		
		//将对应的二级类型删除
		a=type2Service.delete(type2);
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	/**
	 * 文章列表页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("articleListShow.html")
	public ModelAndView articleListShow(HttpServletRequest request, ModelMap modelmap) {
		
		modelmap.put("", "");
		return new ModelAndView("back/articleListShow");
	}
	/**
	 * 文章查询方法
	 * 
	 * @return
	 */
	@RequestMapping("articleList.html")
	public void articleList(Article article,HttpServletRequest request,HttpServletResponse response,  ModelMap modelmap) {
		//获取所有对应的article
		article.setSt(1);//将状态位设置为1,仅查询文章状态位为1的将其显示在页面
		List<Article> articleList=articleService.selectAll(article);
		//根据文章表对应的user_id获取对应的用户,将用户返回到页面,用来获取文章对应的admin用户名
		/*List<Admin> adminList=new ArrayList<Admin>();
		for(Article article1:articleList){
			Admin admin=new Admin();
			admin.setId(article1.getUser_id());
			admin=adminService.selectOne(admin);
			adminList.add(admin);
		}*/
		//将文章列表与admin用户列表放到一个集合,用来在页面获取
		/*List<Object> twoList=new ArrayList<Object>();
		twoList.add(articleList);
		twoList.add(adminList);*/
		
		String jsonList = new Gson().toJson(articleList);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 根据id返回type
	 * @param admin
	 * @param request
	 * @param response
	 */
	@RequestMapping("getTypeName.html")
	public void getTypeName(Type type,HttpServletRequest request,
			HttpServletResponse response) {
		//根据用户id查询用户
		type=typeService.selectOne(type);
		String jsonList = new Gson().toJson(type);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);    
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 根据id返回type2
	 * @param admin
	 * @param request
	 * @param response
	 */
	@RequestMapping("getType2Name.html")
	public void getType2Name(Type2 type2,HttpServletRequest request,
			HttpServletResponse response) {
		//根据用户id查询用户
		type2=type2Service.selectOne(type2);
		String jsonList = new Gson().toJson(type2);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);    
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	
	
	
	
	
	/**
	 *文章添加页面
	 * 
	 * @return
	 */
	@RequestMapping("articleAddShow.html")
	public ModelAndView articleAddShow(HttpServletRequest request, ModelMap modelmap) {
		modelmap.put("", "");
		return new ModelAndView("back/articleAddShow");
	}
	
	/**
	 * 添加文章 将数据保存到数据库(方法)
	 * 
	 * @return
	 */
	@RequestMapping("articleInsert.html")
	public void articleInsert(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		article.setSt(1);//添加文章,文章状态位设置为1,即展示在文章列表
		article.setHot(1);//文章是否置顶,1为默认,2为置顶
		article.setDisplay(1);//  文章添加时display设置为1(1为显示在pc页面,2则不显示)	
		//获取当前用户信息,默认发布人为当前用户
		Admin admin=(Admin) request.getSession().getAttribute("adminSession");
		int user_id=admin.getId();
		article.setUser_id(user_id);
		int a = articleService.insert(article);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 * 文章编辑页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("articleEditShow.html")
	public ModelAndView articleEdit(Article obj, HttpServletRequest request, ModelMap modelmap) {
		
		obj=articleService.selectOne(obj);
		modelmap.put("obj", obj);
		return new ModelAndView("back/articleEditShow");
	}
	/**
	 * 文章编辑提交后数据保存方法
	 * @param obj
	 * @param request
	 * @param response
	 * @param modelmap
	 */
	@RequestMapping("articleUpdate.html")
	public void articleUpdate(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {
		
		int a = articleService.update(article);
		
		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	
	/**
	 * 文章删除(包括批量删除)
	 * 
	 * @return
	 */
	@RequestMapping("articleDelete.html")
	public void articleDelete(String ids, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelmap) {

		String[] str = ids.split(",");
		List<String> list = new ArrayList<String>();// 集合转list
		list = Arrays.asList(str);
		int a = articleService.deleteAll(list);

		String jsonList = new Gson().toJson(a);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonList);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}

	

	/**
	 * 404
	 * 
	 * @return
	 */
	@RequestMapping("404.html")
	public ModelAndView error(HttpServletRequest request, ModelMap modelmap) {

		modelmap.put("", "");
		return new ModelAndView("back/404");
	}

	
}
