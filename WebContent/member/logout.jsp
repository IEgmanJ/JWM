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
	<div class="header top">
		<div 
			style="position:absolute;top:0;left:0px;font-size:x-large;display: inline;line-height: 50px;cursor:pointer;padding-left: 10px; padding-right: 10px" 
			onmouseover="topomover(this)" 
			onmouseout="topomout(this)"
			onclick="document.getElementById('iFRAME').src = 'welcome.html'">教务辅助管理系统 JWM ☭
		</div>
	</div>
	<div style="height: 50px;">&nbsp;</div>
	
	<div style="position: absolute; top: 40%; width: 100% ;text-align:center; font-size: small">
		<%session.invalidate(); %>
   		你的账号已安全退出，<a class="xh" href="../login.jsp">点此</a>去登录
    </div>
    
   	<div style="height: 60px;">&nbsp;</div>
    <div class="footer bottom">
        	<ul>
            <li><a class="xh" href="mailto:1187260097@qq.com">联系我们 </a>  </li>
            <li><a class="xh" href="mailto:1617427997@qq.com">快联系我们 </a>  </li>
            <li><a class="xh" href="mailto:944392498@qq.com">赶快联系我们 </a>  </li>
            <li>&nbsp;2014-2015 JWM</li>
            </ul>
	</div>
</body>
</html>
