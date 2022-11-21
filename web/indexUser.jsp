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
        <td width="80" bgcolor="#8fbc8f"><a href="add.jsp">报名考试</a></td>
        <td width="80" bgcolor="#8fbc8f"><a href="search.jsp" target=_blank>查找考试</a></td>
    </tr>
    <tr>
        <td width="100" bgcolor="#556b2f">编号</td>
        <td width="100" bgcolor="#556b2f">科目</td>
        <td width="120" bgcolor="#556b2f">负责人</td>
        <td width="320" bgcolor="#556b2f">考试时间与地点</td>
        <td width="120" bgcolor="#556b2f">操作</td>
    </tr>
    <%
        String id = "4";
        String[] temp = {"id","title","author","article"};
        List<String[]> vec = dob.find("note",temp,"id="+id);
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

<p><br>
</p>
</body>
</html>
<%

%>
