package cn.edu.hziee.servlet;

import cn.edu.hziee.Dao.AdminDao;
import cn.edu.hziee.Dao.UserDao;
import cn.edu.hziee.Entity.Admin;
import cn.edu.hziee.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String username= request.getParameter("username");
        String password = request.getParameter("password");
        //获取选择登陆对象的类型参数
        int type = Integer.parseInt(request.getParameter("type"));
        switch (type) {
            case 1:{
                UserDao userDao = new UserDao();
                User user = userDao.login(username,password);
                userDao.closeCon();
                if (user == null)
                {
                    response.getWriter().write("用户登录失败");
                    return;
                }else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("userType", type);
                    response.sendRedirect("indexUser.jsp");// 跳转到indexUser.jsp页面
                }
                break;
            }
            case 2:{
                AdminDao adminDao = new AdminDao();
                Admin admin = adminDao.login(username, password);
                adminDao.closeCon();
                if(admin == null)
                {
                    response.getWriter().write("管理员登录失败");
                    return;
                }else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", admin);
                    session.setAttribute("userType", type);
                    response.sendRedirect("index.jsp");// 跳转到index.jsp页面
                }
                break;
            }
            case 3:{
                UserDao userDao = new UserDao();
                User user = userDao.login(username,password);
                userDao.closeCon();
                if (user == null)
                {
                    response.getWriter().write("考务人员登录失败");
                    return;
                }else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("userType", type);
                    response.sendRedirect("indexUser.jsp");// 跳转到indexUser.jsp页面
                }
                break;
            }
            default:
                break;
        }
    }
    //注销登录  退出
    private void logout(HttpServletRequest request,HttpServletResponse response) throws IOException{
        request.getSession().removeAttribute("user");
        response.sendRedirect("login.jsp");
    }
}
