package cn.edu.hziee.servlet;

import cn.edu.hziee.utils.DBUtils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CoreServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI();// path = /Demo/add.do
		String flag = path.substring(path.lastIndexOf('/')+1, path.lastIndexOf('.')); // flag = add
		debug(flag);
		request.setCharacterEncoding("utf-8");
		DBUtils dob = new DBUtils();
		if("add".equals(flag)){//添加考试安排
			debug("添加考试安排");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String article = request.getParameter("article");
			//插入数据
			String[] temp = {"title","author","article"};
			String[] values= {title,author,article};
			dob.add("note",temp , values);
			//请求分派
			gotoPage(request, response,"/index.jsp");
		}
		if("edit".equals(flag)){//修改考试安排
			debug("修改考试安排");
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String article = request.getParameter("article");
			String[] field = {"title","article"};
			String[] value = {title,article};
			dob.edit("note", field, value, "id="+id);
			gotoPage(request, response,"/index.jsp");
		}
		if("delete".equals(flag)){//删除考试安排
			debug("删除考试安排");
			String id = request.getParameter("id");
			dob.delete("note", "id="+id);
			gotoPage(request, response,"/index.jsp");
		}

	}
	private void gotoPage(HttpServletRequest request, HttpServletResponse response,String path)
			throws ServletException, IOException {
		//请求分派
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	public static void debug(String str ){
		System.out.println(str);
	}
}
