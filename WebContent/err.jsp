<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>你还没登录</title>
<link rel="stylesheet" type="text/css" href="css/JWM.css"/>
</head>

<body>
	<div class="header">J W M</div>
	<div style="height: 350px; width: 900px; text-align: center;margin: 0 auto; margin-top: 200px;">
   		请<a class="xh" href="login.jsp">登录</a>后再访问此页面
   		<%System.out.println(session.getAttribute("username")); %>
    </div>
    <div class="footer">
    	<div style="width:900px; text-align:right; margin:0 auto;">
    	<table style="height:90px; margin-right:0px; ">
        	<tr>
            <td ><a class="xh" href="mailto:1187260097@qq.com">联系我们</a>  </td>
            <td ><a class="xh" href="mailto:1617427997@qq.com">快联系我们 </a>  </td>
            <td ><a class="xh" href="mailto:944392498@qq.com">赶快联系我们 </a>  </td>
            <td>©2015 JWM</td>
            </tr>
        </table>
        </div>
</div>
</body>
</html>
