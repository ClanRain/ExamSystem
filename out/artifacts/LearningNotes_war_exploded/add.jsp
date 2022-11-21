<%@ page language="java"  pageEncoding="UTF-8"%>
<html>
  <head>
    <title>添加考试</title>
  </head>
  <script language="javascript">
 function isok(){
   if(form1.title.value=='')
     {
       window.alert("科目名称不能为空，请重输！");
       form1.title.focus();
       return false;
     }
   if(form1.author.value=='')
     {
       window.alert("负责人不能为空，请重输！");
       form1.author.focus();
       return false;
     }
   if(form1.article.value=='')
     {
       window.alert("考试时间与地点不能为空，请重输！");
       form1.content.focus();
       return false;
     }

  return true;
 }
</script>
  <body>
    <form name="form1" method="post" action="add.do" onSubmit="return isok();">
        <table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="#8fbc8f" style="margin:auto">
          <tr>
            <td width="100" bgcolor="#8fbc8f">科目:</td>
            <td width="700" bgcolor="#8fbc8f"><input type="text" name="title"></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#556b2f">负责人:</td>
            <td width="700" bgcolor="#8fbc8f"><input type="text" name="author"></td>
          </tr>
          <tr>
            <td bbgcolor="#8fbc8f">考试时间与地点:</td>
            <td bgcolor="#8fbc8f"><textarea name="article" cols="100" rows="20"></textarea></td>
          </tr>
          <tr>
            <td bgcolor="#556b2f">&nbsp</td>
            <td bgcolor="#8fbc8f"><input type="submit" name="Submit" value="添加"></td>
          </tr>
        </table>
    </form>
  </body>
</html>
