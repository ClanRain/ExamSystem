<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dob" class="cn.edu.hziee.utils.DBUtils"/>

<html>
  <head>
    <title>修改</title>
  </head>
    <script language="javascript">
      function isok(){
       if(form1.title.value=='')
       {
         window.alert("标题不能为空，请重输！");
         form1.title.focus();
         return false;
       }
       if(form1.article.value=='')
       {
         window.alert("内容不能为空，请重输！");
         form1.content.focus();
         return false;
       }

       return true;
      }
    </script>
  <body>
    <%
      String id = request.getParameter("id");
      String[] temp = {"title","article"};
      List<String[]> vec = dob.find("note",temp,"id="+id);
      for(int i=0;i<vec.size();i++){
            String[] ss = vec.get(i);
    %>
    <form name="form1" method="post" action="edit.do" onSubmit="return isok();">
      <table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" style="margin:auto">
        <tr>
          <td colspan="2" bgcolor="#8fbc8f">&nbsp;</td>
        </tr>
        <tr>
          <td width="100" bgcolor="#556b2f">标题:</td>
          <td width="700" bgcolor="#8fbc8f">
          <input type="hidden" name="id" value="<%=id%>">
          <input name="title" type="varchar" value="<%=ss[0] %>"></td>
        </tr>
        <tr>
          <td bgcolor="#556b2f">内容:</td>
          <td bgcolor="#8fbc8f"><textarea name="article" cols="40" rows="15"><%=ss[1] %></textarea></td>
        </tr>
        <tr>
          <td bgcolor="#8fbc8f">&nbsp;</td>
          <td bgcolor="#8fbc8f"><input type="submit" name="Submit" value="修改"></td>
        </tr>
      </table>
    </form>
    <%} %>
  </body>
</html>
