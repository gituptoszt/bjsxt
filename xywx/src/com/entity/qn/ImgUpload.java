package com.entity.qn;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.google.gson.Gson;

@Controller
public class ImgUpload {

	/**
	 * 七牛云 上传
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping("imgUpload.html")
	public void qnUpload(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		Utils utils = new Utils();
		MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
		String path =  request.getSession().getServletContext().getRealPath("/")+"/upload/";
		//获取当前项目路径
		String projectPath=request.getContextPath();
		System.out.println(projectPath);
		String imgUrl=projectPath+"/upload/"; //"/xywx/upload/"
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < multipartRequest.getFiles("file").size(); i++) {
			MultipartFile file = multipartRequest.getFiles("file").get(i);
			if (!file.isEmpty()) {
				// 获取后缀
				String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
				String newFileName = new Date().getTime() + "." + suffix;
				imgUrl+=newFileName;
				path += newFileName;
				File newFile = new File(path);
				System.out.println(path);    
				try {
					file.transferTo(newFile);
					Thumbnails.of(newFile).scale(0.5f).toFile(newFile);//按比例缩小  
					map.put("src", imgUrl);
					utils.setTitle(newFileName);     
					utils.setCode("0"); 
					utils.setMsg("success");
				} catch (IllegalStateException | IOException e) {
					utils.setCode("1");
					utils.setMsg("fail");
					map.put("src", "");
					e.printStackTrace();
				}
			}
		}
		utils.setData(map);

		String json = new Gson().toJson(utils);
		System.out.println(json);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
/*	@RequestMapping("imgLoad.html")
	public void  showPicture(String path,HttpServletResponse response) throws IOException{
		File filePic = new File(path);
		if(filePic.exists()){
		   FileInputStream is = new FileInputStream(filePic);
		   int i = is.available(); // 得到文件大小  
		   byte data[] = new byte[i];  
		   is.read(data); // 读数据  
		   is.close();
		   response.setContentType("image/*"); // 设置返回的文件类型  
		   OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
		   toClient.write(data); // 输出数据
		   toClient.close();  
		}
	} */
	
}
