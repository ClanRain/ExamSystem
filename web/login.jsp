
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login</title>
        <style>
            body {text-align:center;}
        </style>
    </head>
    <body>
        <form action="LoginServlet" method="post">
            <br>
            <label style="font-size:30px;color:darkorange;">考试管理系统登录</label>
            <br><br>
            账号：<input type="text" name="username"><br>
            密码：<input type="password" name="password"><br>
            <input type="radio" id="radio-1" name="type" checked value="1" />
            <label>学生</label>
            <input type="radio" id="radio-2" name="type" value="2" />
            <label>管理员</label>
            <input type="radio" id="radio-3" name="type" value="3" />
            <label>考务人员</label>
            <br><br>&nbsp
            <input type="submit" value="登录">
        </form>
        <script type="text/javascript">
            var a = ($(document).height() - $('form').height()) / 2;
            $('form').css('margin-top', a + 'px');
        </script>
    </body>
</html>

