<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
  cn.edu.hziee.utils.DBUtils dob = new cn.edu.hziee.utils.DBUtils();
%>
<html>
  <head>
    <title>考试列表</title>
  </head>
  <body>
    <table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="#8fbc8f" style="margin:auto">
      <tr>
        <td width="80" bgcolor="#8fbc8f"><a href="add.jsp">添加考试</a></td>
        <td width="80" bgcolor="#8fbc8f"><a href="search.jsp" target=_blank>查找考试</a></td>
        <td width="80" bgcolor="#8fbc8f"><a href="userManager.jsp" target=_blank>管理用户</a></td>
      </tr>
      <tr>
        <td width="100" bgcolor="#556b2f">编号</td>
        <td width="100" bgcolor="#556b2f">科目</td>
        <td width="120" bgcolor="#556b2f">负责人</td>
        <td width="320" bgcolor="#556b2f">考试时间与地点</td>
        <td width="120" bgcolor="#556b2f">操作</td>
      </tr>
      <%
        String[] temp = {"id","title","author","article"};
        String str  =request.getParameter("pageNum");
        int pageNum = 1;
        if (str!=null) {
          pageNum = Integer.parseInt(str);
        }

        int pageSize = 10;
        List<String[]> vec1 = dob.find("note",temp,"id=1");
        int total = vec1.size();
        int pageCount = total % pageSize ==0 ? total / pageSize : total / pageSize+1;//总的页码    // limit 0,4   4,4   8,4

        List<String[]> list = dob.find("note",temp,"1=1 order by id desc limit "+(pageNum-1)*pageSize+","+pageSize+"");//排序 页码pageNum 每页pageSize=10条，
        for(int i=0;i<list.size();i++){
          String[] ss = list.get(i);
      %>
      <tr>
        <td bgcolor="#8fbc8f"><%=ss[0]%></td>
        <td bgcolor="#8fbc8f"><%=ss[1]%></td>
        <td bgcolor="#8fbc8f">
          <%=ss[2].length()>6?ss[2].substring(0,5)+"...":ss[2]%></td>
        <td bgcolor="#8fbc8f"><%=ss[3]%></td>
        <td bgcolor="#8fbc8f"><a href="detail.jsp?id=<%=ss[0]%>" target=_blank>查看</a>/<a href="modify.jsp?id=<%=ss[0]%>">修改</a>/<a href="delete.do?id=<%=ss[0] %>">删除</a></td>
      </tr>
      <% } %>
    </table>

    <%
      if(pageNum!=1){
    %>
    <a href="index.jsp?pageNum=1">首页</a>|
    <a href="index.jsp?pageNum=<%=pageNum-1%>">上一页</a>|
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
    <a href="index.jsp?pageNum=<%=pageNum+1%>">下一页</a>|
    <a href="index.jsp?pageNum=<%=pageCount%>">尾页</a>
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
