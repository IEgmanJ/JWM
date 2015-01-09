<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String ID = (String)session.getAttribute("ID");
	String AS = (String)session.getAttribute("AS");
	String USERNAME = (String)session.getAttribute("USERNAME");
	if(ID == null){
		response.sendRedirect("../err.jsp");
	}
	if("admin".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "admin.jsp";
		response.setHeader("Location",newLocn);
	}else if("teacher".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "teacher.jsp";
		response.setHeader("Location",newLocn);
	}else if("student".equals(AS)){
		
	}

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理中心  <%=USERNAME %> | 学生@JWM</title>
<link rel="stylesheet" type="text/css" href="../css/JWM.css"/>
<script language = "JavaScript" src = "../js/iFrameAutoAjust.js" ></script> 
<script type="text/javascript">
	function studentUpdate(){
		document.getElementById("iFRAME").src = "toolkit/studentUpdate.jsp";
	}
	function classroomQuery(){//暂时不用
		document.getElementById("iFRAME").src = "";
	}
	function studentCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/studentCoursetableQuery.jsp";
	}
	function classCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/classCoursetableQuery.jsp";
	}
	
	function omover(obj){
		obj.className="contentLeftList cllf";
//		obj.style.cursor="pointer";
	}
	function omout(obj){
		obj.className="contentLeftList";
	}
	//iFrame 自适应宽度，高度
	function iFrameAutoAjust() {
		//通过调整iFrame外的层来调整iFrame的大小
		var IFRAMEdiv = document.getElementById("contentMain");
		var IFRAMEinnerHeight = document.getElementById("iFRAME").contentDocument.body.scrollHeight  ///网页正文全文高
		var IFRAMEinnerWidth = document.getElementById("iFRAME").contentDocument.body.scrollHeight;
		
		var width = document.body.offsetWidth -  document.getElementById("contentLeft").offsetWidth - 37; //神秘的37
		
		IFRAMEdiv.style.width = width + "px"; 
		IFRAMEdiv.style.height = (IFRAMEinnerHeight+37) + "px";
		
		setTimeout("iFrameAutoAjust()", 500);		
	}
</script>
</head>

<body onload="iFrameAutoAjust()">
	<div class="header top">
		<div style="float: left;">你好， <%=USERNAME %> ！</div>
		<div style="float: left;"><a href="logout.jsp" style="font-size: small;color: white; line-height: 50px;">安全退出</a></div>
	</div>
	<div style="height: 50px;">&nbsp;</div>
	
	<div style="height: 30px;"></div>
	<div id="content" class="content">
		<div id ="contentLeft" class="contentLeft">
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">个人信息管理</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="studentUpdate()">▶个人信息修改</div>
			</div>
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">系统功能</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="studentCoursetableQuery()">▶个人课程表查询</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="classCoursetableQuery()">▶班级课程表查询</div>
			</div>
		</div>
		<div class="contentRight" id="contentMain"><iframe  id="iFRAME" frameborder= '0' src="welcome.html" scrolling="no" width="100%" height="100%"></iframe></div>
		<div style="clear: both;"></div>
	</div>

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
