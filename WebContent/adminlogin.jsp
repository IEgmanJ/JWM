<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ID = (String)session.getAttribute("ID");
	String AS = (String)session.getAttribute("AS");
	String USERNAME = (String)session.getAttribute("USERNAME");
	if("admin".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "member/admin.jsp";
		response.setHeader("Location",newLocn);
	}else if("teacher".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "member/teacher.jsp";
		response.setHeader("Location",newLocn);
	}else if("student".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "member/index.jsp";
		response.setHeader("Location",newLocn);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录 | JWM</title>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<link rel="stylesheet" type="text/css" href="css/JWM.css"/>
<script type="text/javascript">
	function login(){
	
		document.getElementById("errInfo").innerHTML = "<img src='img/waitlg.gif' />";
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;

		if(check(username,password)){
			//点击登陆后，禁用登陆按钮、用户名、密码输入框。知道“err”收到数据后再启用（删除此属性）
			document.getElementById("username").setAttribute("disabled", "disabled"); 
			document.getElementById("password").setAttribute("disabled", "disabled"); 
			document.getElementById("submit").setAttribute("disabled", "disabled"); 
			
			loadXMLDoc(username,password);
		}
	}
	function loadXMLDoc(username,password){
		var xmlhttp;
		if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		}else{
			xmlhttp = new ActiveXObjext("Microsoft.XMLHTTP");
		}	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				document.getElementById("errInfo").innerHTML = xmlhttp.responseText;
				//解除锁定
				document.getElementById("username").removeAttribute("disabled"); 
				document.getElementById("password").removeAttribute("disabled"); 
				document.getElementById("submit").removeAttribute("disabled"); 
				
				if(xmlhttp.responseText.match("s1")){ 
					xmlhttp = null;
					window.location.href = "member/admin.jsp"; //s1管理员
				}
			}
		}
		xmlhttp.open("post",encodeURI("check.jsp?t=" + Math.random()+"&username="+username+"&password="+password),true);
		xmlhttp.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
		xmlhttp.send();	
	}
	
	function check(username,password){
		if(username == ""){
			document.getElementById("errInfo").innerHTML = "请输入用户名";
			document.getElementById("username").focus();
			return false;
		}else if(password == ""){
			document.getElementById("errInfo").innerHTML = "请输入密码";
			document.getElementById("password").focus();
			return false;
		}else{
			return true;
		}
	}
	function clearErr(){
		document.getElementById("errInfo").innerHTML ="";
	}

</script>
</head>

<body>
	<div style="height:40px;"></div>
	<div class="centerParent">
    	<div class="centerLeft" style="background-color:rgb(0, 113, 197);">
        	<img src="img/loginLeftAdmin.png" width="500px" height="500px"/>
        </div>
        <div class="centerRight">
        	<div style="height:40px;"></div>
            <div style="height:50px; text-align:center"><img src="img/logo.png" width="190" height="50" /></div>
            <div style="height:30px"></div>
		  	<div class="tl" style="width:300px; float:right">
            	<div style="height:30px; font-size:small; color:RED" id="errInfo"></div>
				<form action="" onsubmit=" ">
	            	<input name="username" id="username" type="text" placeholder="用户名" class="inputLarge" onclick="clearErr()"/><br />
	             	<input name="password" id="password" type="password" placeholder="密码" class="inputLarge" onclick="clearErr();"/><br />
	                <div style="height:30px"></div>
	                <input name="submit" id="submit" type="button" value="登   录" onclick="login()" class="inputButton"/><br />
	            </form>
            	<div style="height:190px; width:300px;"></div>
                <div style="width:300px;">不是管理员？ <a class="xh" style="font-weight:bold;" href="login.jsp">点此</a> 去登录</div>
            </div>
        </div>
		<div style="clear:both"></div>
    </div>
    <div style="height: 30px;"></div>
    
    <div style="height: 60px;">&nbsp;</div>
    <div class="footer bottom">
        	<ul>
            <li><a class="xh" href="mailto:1187260097@qq.com">联系我们 </a>  </li>
            <li><a class="xh" href="mailto:1617427997@qq.com">快联系我们 </a>  </li>
            <li><a class="xh" href="mailto:944392498@qq.com">赶快联系我们 </a>  </li>
            <li>©2015 JWM</li>
            </ul>
	</div>
</body>
</html>
