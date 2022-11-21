<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    cn.edu.hziee.utils.DBUtils dob = new cn.edu.hziee.utils.DBUtils();
%>
<html>
    <head>
        <title>用户列表</title>
    </head>
    <body>
        <table width="420" border="0" cellpadding="0" cellspacing="1" bgcolor="#8fbc8f" style="margin:auto">
            <tr>
                <td width="100" bgcolor="#556b2f">编号</td>
                <td width="100" bgcolor="#556b2f">用户名</td>
                <td width="100" bgcolor="#556b2f">密码</td>
                <td width="120" bgcolor="#556b2f">操作</td>
            </tr>
            <%
                String[] temp = {"id","username","password"};
                String str  =request.getParameter("pageNum");
                int pageNum = 1;
                if (str!=null) {
                    pageNum = Integer.parseInt(str);
                }

                int pageSize = 10;
                List<String[]> vec1 = dob.find("user",temp,"");
                int total = vec1.size();
                int pageCount = total % pageSize ==0 ? total / pageSize : total / pageSize+1;//总的页码    // limit 0,4   4,4   8,4

                List<String[]> list = dob.find("user",temp,"1=1 order by id desc limit "+(pageNum-1)*pageSize+","+pageSize+"");//排序 页码pageNum 每页pageSize=10条，
                for(int i=0;i<list.size();i++){
                    String[] ss = list.get(i);
            %>
            <tr>
                <td bgcolor="#8fbc8f"><%=ss[0]%></td>
                <td bgcolor="#8fbc8f"><%=ss[1]%></td>
                <td bgcolor="#8fbc8f"><%=ss[2]%></td>
                <td bgcolor="#8fbc8f"><a href="delete.do?id=<%=ss[0] %>">删除</a></td>
            </tr>
            <% } %>
        </table>

        <%
            if(pageNum!=1){
        %>
        <a href="userManager.jsp?pageNum=1">首页</a>|
        <a href="userManager.jsp?pageNum=<%=pageNum-1%>">上一页</a>|
        <%
            }else{
        %>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        首页|上一页|
        <%
            }
            if(pageNum<pageCount){
        %>
        <a href="userManager.jsp?pageNum=<%=pageNum+1%>">下一页</a>|
        <a href="userManager.jsp?pageNum=<%=pageCount%>">尾页</a>
        <%
            }else{
        %>
        下一页|尾页
        <%
            }
        %>
        <p><br>
        </p>
    </body>
</html>
<%

%>
