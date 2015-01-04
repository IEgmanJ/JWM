<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注销成功</title>
<link rel="stylesheet" type="text/css" href="../css/JWM.css"/>
</head>

<body>
	<div class="header">J W M</div>
	<div style="height: 350px; width: 900px; text-align: center;margin: 0 auto; margin-top: 200px;">
		<%session.invalidate(); %>
   		你的账号已安全退出，<a class="xh" href="../login.jsp">点此</a>去登录
    </div>
    <div class="footer">
    	<div style="width:900px; text-align:right; margin:0 auto;">
    	<table style="height:90px; margin-right:0px; ">
        	<tr>
            <td ><a class="xh" href="javascript:void(0)">联系我们 </a>  </td>
            <td ><a class="xh" href="javascript:void(0)">快联系我们 </a>  </td>
            <td ><a class="xh" href="javascript:void(0)">赶快联系我们 </a>  </td>
            <td>©2015 JWM</td>
            </tr>
        </table>
        </div>
</div>
</body>
</html>
