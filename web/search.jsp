<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.hziee.utils.DBUtils" %>
<html>
  <head>
    <title>搜索</title>
  </head>
  <body>
    <form name="form1" method="post" action="">
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      关键字：
      <input name="key" type="text" id="key">
      <input type="submit" name="Submit" value="查找">
    </form>
    <%
    request.setCharacterEncoding("UTF-8");
    String key = request.getParameter("key");
    String condition="";
    if(key!=null){
        condition="author like '%"+key+"%'";
        System.out.println(condition);
    }else{
        condition="";
    }
    %>
    <%--<jsp:useBean id="dob" class="cn.edu.hziee.utils.DBUtils"/>--%>
    <%
        DBUtils dob = new DBUtils();
    %>
    <table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="#8fbc8f"style="margin:auto">
      <tr>
        <td width="100" bgcolor="#8fbc8f"><a href="add.jsp">添加考试</a></td>
      </tr>
      <tr>
        <td width="100" bgcolor="#556b2f">编号</td>
        <td width="100" bgcolor="#556b2f">科目</td>
        <td width="100" bgcolor="#556b2f">负责人</td>
        <td width="280" bgcolor="#556b2f">考试时间与地点</td>
        <td width="120" bgcolor="#556b2f">操作</td>
      </tr>
      <%
      String[] temp = {"id","title","author","article"};
      List<String[]> vec = dob.find("note",temp,condition);
      for(int i=0;i<vec.size();i++){
    	  String[] ss = vec.get(i);
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
  </body>
</html>
