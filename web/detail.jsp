<%@ page contentType="text/html; charset=gb2312" import="java.util.*" language="java" errorPage="" %>
<jsp:useBean id="dob" class="cn.edu.hziee.utils.DBUtils"/>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��ϸ����</title>
  </head>
  <body>
    <%
      String id = request.getParameter("id");
      String[] temp = {"id","title","author","article"};
      List<String[]> vec = dob.find("note",temp,"id="+id);
      for(int i=0;i<vec.size();i++){
            String[] ss = vec.get(i);
    %>
    <table width="800" height="500" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" style="margin:auto">
      <tr>
        <td width="337" height="25" bgcolor="#8fbc8f">��ţ���<%=ss[0]%>�� </td>
      </tr>
      <tr>
        <td height="25" bgcolor="#8fbc8f">��Ŀ����<%=ss[1]%>��</td>
      </tr>
      <tr>
        <td height="25" bgcolor="#8fbc8f">�����ˣ���<%=ss[2]%>��</td>
      </tr>
      <tr>
        <td height="25" bgcolor="#8fbc8f">����ʱ����ص㣺</td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF"><%=ss[3]%></td>
      </tr>
    </table>
    <%} %>
  </body>
</html>
