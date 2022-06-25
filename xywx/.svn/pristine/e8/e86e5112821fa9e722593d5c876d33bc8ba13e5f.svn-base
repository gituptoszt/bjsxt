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
@RequestMapping("/pc")
public class PcAction { 
	
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
	 * 登录页面 无信息返回到页面
	 * 
	 * @return
	 */
	@RequestMapping("pcLogin2.html")
	public ModelAndView login(HttpServletRequest request, ModelMap modelmap) {
		//点击退出时跳转到这个页面,并清空session
		if (request.getSession().getAttribute("pcAdminSession") != null) {
			request.getSession().removeAttribute("pcAdminSession");
		} else {

		}
		modelmap.put("", "");
		return new ModelAndView("pc/pcLogin2");
	}
	 
	/**
	 * 登录页面 无信息返回到页面
	 * 
	 * @return
	 */
	@RequestMapping("pcLogout.html")
	public ModelAndView pcLogout(HttpServletRequest request, ModelMap modelmap) {
		//点击退出时跳转到这个页面,并清空session
		if (request.getSession().getAttribute("pcAdminSession") != null) {
			request.getSession().removeAttribute("pcAdminSession");
		} else {

		}
		modelmap.put("", "");
		return new ModelAndView("redirect:pcIndex.html");
	}
	
	
	/**
	 *登陆功能
	 * @param request
	 * @param modelmap
	 * @return
	 */
	/*@RequestMapping("pcLogin.html")
	public ModelAndView pcLogin(HttpServletRequest request, ModelMap modelmap) {
		Admin adminSession=(Admin) request.getSession().getAttribute("adminSession");
		modelmap.put("adminSession", adminSession);
		
		//点击退出时跳转到这个页面,并清空session
		if(request.getSession().getAttribute("pcAdminSession")!=null){
			request.getSession().removeAttribute("pcAdminSession");
		}else{
			
		}
		
		return new ModelAndView("pc/pcLogin");
	}*/
	
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
			request.getSession().setAttribute("pcAdminSession", obj);
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
		if (request.getSession().getAttribute("pcAdminSession") != null) {
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
	
	/**
	 *测试pc页面top公共部分
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcPageTop.html")
	public ModelAndView pcPageTop(HttpServletRequest request, ModelMap modelmap) {
		return new ModelAndView("pc/pcPageTop");
	}
	
	
	
	
	/**
	 *测试pc页面tfooter公共部分(包括友情链接)
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcPageFooter.html")
	public ModelAndView pcPageFooter(HttpServletRequest request, ModelMap modelmap) {
		/*Admin adminSession=(Admin) request.getSession().getAttribute("adminSession");
		modelmap.put("adminSession", adminSession);*/
		return new ModelAndView("pc/pcPageFooter");
	}
	
	/**
	 *主页(将公共页面导入后的主页)
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcIndex.html")
	public ModelAndView pcIndex(HttpServletRequest request, ModelMap modelmap) {
		pcPublicData(modelmap);
		//从数据库中取出所有的一级类型
		Type type=new Type();
		List<Type> typeList=typeService.selectAll(type);
		
		List<Article> articleList=new ArrayList<Article>();
		//根据一级类型取出前6篇文章
		for(Type type1:typeList){
			Article article=new Article();
			// 文章display字段应该为1表示展示在pc页面,st状态位为1表示未被删除
			article.setDisplay(1);
			article.setSt(1);
			article.setType_id(type1.getId());
			
			List<Article> articleList1=articleService.selectAll(article);
			
			//若是类型下的文章大于6,只取前六个,若是小于等于6,全取
			int aLength=0;
			if(articleList1.size()<=6){
				aLength=articleList1.size();
			}else{
				aLength=6;
			}
			//将取出来的数据放到另外一个集合
			for(int a=0;a<aLength;a++){
				Article article1=articleList1.get(a);
				articleList.add(article1);
			}
			
		}
		
		modelmap.put("articleList", articleList);
		
		return new ModelAndView("pc/pcIndex");
	}
	
	/**
	 *将所有页面的公共数据取出封装到这一个方法里面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	public ModelMap pcPublicData(ModelMap modelmap) {
		// 从数据库中取出公告放到公告栏
		Notice notice = new Notice();
		List<Notice> noticeList = noticeService.selectAll(notice);
		modelmap.put("noticeList", noticeList);
		//从数据库取一级类型数据,放到导航栏
		Type type=new Type();
		List<Type> typeList=typeService.selectAll(type);
		modelmap.put("typeList", typeList);
		//从数据库取二级类型数据,放到导航栏中一级类型下
		Type2 type2=new Type2();
		List<Type2> type2List=type2Service.selectAll(type2);
		modelmap.put("type2List", type2List);
		
		//从数据库中取出所有链接放到友情链接
		Link link=new Link();
		List<Link> linkList=linkService.selectAll(link);
		modelmap.put("linkList", linkList);
		
		return modelmap;
	}
	
	
	
	/**
	 * 点击一级菜单,以及更多都会跳到这里,
	 * 将对应的文章列表返回到页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcPageList1.html")
	public ModelAndView pcPageList1(Article article,HttpServletRequest request, ModelMap modelmap) {
		pcPublicData(modelmap);
		//文章display字段应该为1表示展示在pc页面,st状态位为1表示未被删除
		article.setDisplay(1);
		article.setSt(1);
		
		//设置分页每页数量
		article.setNumber(10);
		
		//根据传进来的一级类型id查询相应的文章
		List<Article> articleList=articleService.selectAll2(article);
		modelmap.put("articleList", articleList);
		
		//查询一级类型取一级类型的标题
		Type type =new Type();
		type.setId(article.getType_id());
		type=typeService.selectOne(type);
		modelmap.put("type", type);
		
		//查询总数量,将总数一级该对象返回到页面
		int count=articleService.selectCount(article);
		
		modelmap.put("obj", article);
		modelmap.put("count", count);
		
		return new ModelAndView("pc/pcPageList");
	}
	
	/**
	 * 点击二级菜单会跳到这里,
	 * 将对应的文章列表返回到页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcPageList2.html")
	public ModelAndView pcPageList2(Article article,HttpServletRequest request, ModelMap modelmap) {
		pcPublicData(modelmap);
		// 文章display字段应该为1表示展示在pc页面,st状态位为1表示未被删除
		article.setDisplay(1);
		article.setSt(1);
		
		// 设置分页每页数量
		article.setNumber(10);
		
		// 根据传进来的二级类型id查询相应的文章
		List<Article> articleList = articleService.selectAll2(article);
		modelmap.put("articleList", articleList);
		
		// 根据二级id查询一级名称
		Type2 type2 = new Type2();
		type2.setId(article.getType2_id());
		type2 = type2Service.selectOne(type2);

		// 查询二级类型对应的一级类型的标题
		Type type = new Type();
		type.setId(type2.getType_id());
		type = typeService.selectOne(type);

		// 将一级标题放到页面
		modelmap.put("type", type);
		
		
		// 查询总数量,将总数该对象返回到页面
		int count = articleService.selectCount(article);

		modelmap.put("obj", article);
		modelmap.put("count", count);
		
		
		return new ModelAndView("pc/pcPageList");
	}
	
	/**
	 * 点击文章标题
	 * 将对应的文章内容返回到页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcPageDetail.html")
	public ModelAndView pcPageDetail(Article article,HttpServletRequest request, ModelMap modelmap) {
		pcPublicData(modelmap);
		//根据文章id查询文章
		article=articleService.selectOne(article);
		modelmap.put("article", article);
		
		// 查询一级类型取一级类型的标题
		Type type = new Type();
		type.setId(article.getType_id());
		type = typeService.selectOne(type);

		// 将一级标题放到页面

		modelmap.put("type", type);
		
		return new ModelAndView("pc/pcPageDetail");
	}
	
	/**
	 * 点击公告进入公告页面
	 * @param request
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("pcPageNotice.html")
	public ModelAndView pcPageNotice(Notice notice,HttpServletRequest request, ModelMap modelmap) {
		pcPublicData(modelmap);
		//根据文章id查询文章
		notice=noticeService.selectOne(notice);
		modelmap.put("notice", notice);
		
		return new ModelAndView("pc/pcPageNotice");
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
