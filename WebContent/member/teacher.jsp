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
		
	}else if("student".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "index.jsp";
		response.setHeader("Location",newLocn);
	}

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> 管理中心 <%=USERNAME %> | 教师@JWM</title>
<link rel="stylesheet" type="text/css" href="../css/JWM.css"/>
<script language = "JavaScript" src = "../js/iFrameAutoAjust.js" ></script> 
<script type="text/javascript">

	function teacherUpdate(){
		document.getElementById("iFRAME").src = "toolkit/teacherUpdate.jsp";
	}
	function classroomQuery(){
		document.getElementById("iFRAME").src = "toolkit/classroomQuery.jsp";
	}
	function teacherCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/teacherCoursetableQuery.jsp";
	}
	function classCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/classCoursetableQuery.jsp";
	}
	function workloadAnalysis(){
		document.getElementById("iFRAME").src = "toolkit/workloadAnalysis.jsp";
	}
	
	
	function omover(obj){
		obj.className="contentLeftList cllf";
//		obj.style.cursor="pointer";
	}
	function omout(obj){
		obj.className="contentLeftList";
	}
	
	function topomover(obj){
		obj.className="overheader";
//		obj.style.cursor="pointer";
	}
	function topomout(obj){
		obj.className="";
	}
	function logout(){
		if(confirm("确认退出？")){
			window.location = "logout.jsp";
		}
	}
	
	//iFrame 自适应宽度，高度
	function iFrameAutoAjust() {
		//通过调整iFrame外的层来调整iFrame的大小
		//报错document.getElementById(...).contentDocument.body is null
		var IFRAMEbody = document.getElementById("iFRAME").contentDocument.body;
		
		if(IFRAMEbody != null){
			console.log(IFRAMEbody);
			var IFRAMEdiv = document.getElementById("contentMain");
			var IFRAMEinnerHeight = IFRAMEbody.scrollHeight  ///网页正文全文高
			var IFRAMEinnerWidth = IFRAMEbody.scrollHeight;
			var width = document.body.offsetWidth -  document.getElementById("contentLeft").offsetWidth - 37; //神秘的37
		
			IFRAMEdiv.style.width = width + "px"; 
			IFRAMEdiv.style.height = (IFRAMEinnerHeight) + "px";
			
		}else{
			console.log("未调整");
		}
		setTimeout("iFrameAutoAjust()", 500);
	}
</script>
</head>

<body onload="iFrameAutoAjust()">
	<div class="header top">
		<div 
			style="position:absolute;top:0;left:0px;font-size:x-large;display: inline;line-height: 50px;cursor:pointer;padding-left: 10px; padding-right: 10px" 
			onmouseover="topomover(this)" 
			onmouseout="topomout(this)"
			onclick="document.getElementById('iFRAME').src = 'welcome.html'">教务辅助管理系统 JWM ☭
		</div>
		<div 
			style="width:30px;position:absolute;top:0;right:0px;cursor:pointer;line-height: 50px;"  
			onmouseover="topomover(this)" 
			onmouseout="topomout(this)"
			onclick="logout()">&nbsp;<img src="../img/logout.png" height="20px" width="20px"  alt="退出登录"/>
		</div>
	</div>
	<div style="height: 50px;">&nbsp;</div>
	
	<div style="height: 30px;"></div>
	<div id="content" class="content">
		<div id ="contentLeft" class="contentLeft">
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">个人信息管理</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="teacherUpdate()">▶个人信息修改</div><hr />
			</div>
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">系统功能</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="teacherCoursetableQuery()">▶个人课程表查询</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="classCoursetableQuery()">▶班级课程表查询</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="workloadAnalysis()">▶工作量分析</div><hr />
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
