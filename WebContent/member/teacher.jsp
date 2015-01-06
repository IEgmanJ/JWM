<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String id = (String)session.getAttribute("id");
	String as = (String)session.getAttribute("as");
	String username = (String)session.getAttribute("username");
	if(id == null){
		response.sendRedirect("../err.jsp");
	}
	if("admin".equals(as)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "admin.jsp";
		response.setHeader("Location",newLocn);
	}else if("teacher".equals(as)){
		
	}else if("student".equals(as)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "index.jsp";
		response.setHeader("Location",newLocn);
	}

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> 管理中心 <%=username %> | 教师@JWM</title>
<link rel="stylesheet" type="text/css" href="../css/JWM.css"/>
<script language = "JavaScript" src = "../js/iFrameAutoAjust.js" ></script> 
<script type="text/javascript">

	function teacherUpdate(){
		document.getElementById("iFRAME").src = "toolkit/teacherUpdate.jsp?as=<%=as %>&id=<%=id%>";
	}
	function classroomQuery(){
		document.getElementById("iFRAME").src = "toolkit/classroomQuery.jsp";
	}
	function teacherCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/teacherCoursetableQuery.jsp?as=<%=as %>&id=<%=id%>";
	}
	function classCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/classCoursetableQuery.jsp?as=<%=as %>&id=<%=id%>";
	}
	function workloadAnalysis(){
		document.getElementById("iFRAME").src = "toolkit/workloadAnalysis.jsp?as=<%=as %>&id=<%=id%>";
	}
	
	
	function omover(obj){
		obj.className="contentLeftList cllf";
//		obj.style.cursor="pointer";
	}
	function omout(obj){
		obj.className="contentLeftList";
	}
</script>
</head>

<body>
	<div class="header top">
		<div style="float: left;">你好， <%=username %> ！</div>
		<div style="float: left;"><a href="logout.jsp" style="font-size: small;color: white; line-height: 50px;">安全退出</a></div>
	</div>
	<div style="height: 50px;">&nbsp;</div>
	
	<div style="height: 30px;"></div>
	<div class="content">
		<div class="contentLeft">
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
		<div class="contentRight" id="contentMain"><iframe id="iFRAME" style="border-width:0; width: 900px; height: 550px;" src="welcome.html"></iframe></div>
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
