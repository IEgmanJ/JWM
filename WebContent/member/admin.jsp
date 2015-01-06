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
		
	}else if("teacher".equals(as)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "teacher.jsp";
		response.setHeader("Location",newLocn);
	}else if("student".equals(as)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "index.jsp";
		response.setHeader("Location",newLocn);
	}
	System.out.println("session ID："+session.getId());
	System.out.println("session id："+session.getAttribute("id"));
	System.out.println("session as："+session.getAttribute("as"));
	System.out.println("session username："+session.getAttribute("username"));

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理中心  <%=username %> | 管理员JWM</title>
<link rel="stylesheet" type="text/css" href="../css/JWM.css"/>
<script type="text/javascript">

	function studentImport(){
		document.getElementById("iFRAME").src = "toolkit/studentImport.jsp";
	}
	function studentUpdate(){
		document.getElementById("iFRAME").src = "toolkit/studentUpdate.jsp?as=<%=as %>&id=<%=id%>";
	}
	function courseImport(){
		document.getElementById("iFRAME").src = "toolkit/courseImport.jsp";
	}
	function courseUpdate(){
		document.getElementById("iFRAME").src = "toolkit/courseUpdate.jsp?as=<%=as %>&id=<%=id%>";
	}
	function teacherImport(){
		document.getElementById("iFRAME").src = "toolkit/teacherImport.jsp";
	}
	function teacherUpdate(){
		document.getElementById("iFRAME").src = "toolkit/teacherUpdate.jsp?as=<%=as %>&id=<%=id%>";
	}
	function classroomQuery(){ //暂时不用
		document.getElementById("iFRAME").src = "toolkit/classroomQuery.jsp";
	}
//	function teacherCoursetableQuery(){
//		document.getElementById("iFRAME").src = "toolkit/teacherCoursetableQuery.jsp?as=<%=as %>&id=<%=id%>";
//	}
//	function studentCoursetableQuery(){
//		document.getElementById("iFRAME").src = "toolkit/studentCoursetableQuery.jsp?as=<%=as %>&id=<%=id%>";	
//	}
	function classCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/classCoursetableQuery.jsp?as=<%=as %>&id=<%=id%>";
	}
	function workloadAnalysis(){
		document.getElementById("iFRAME").src = "toolkit/workloadAnalysis.jsp?as=<%=as %>&id=<%=id%>";
	}
	function dataBackup(){
		document.getElementById("iFRAME").src = "toolkit/dataBackup.jsp";
	}
	function AutoSchedule(){
		document.getElementById("iFRAME").src = "toolkit/AutoSchedule.jsp";
	}
	
	function omover(obj){
		obj.className="contentLeftList cllf";
//		obj.style.cursor="pointer";
	}
	function omout(obj){
		obj.className="contentLeftList";
	}
	
	//iFrame 自适应高度
	function iFrameAutoAjust() { 
		var ifm= document.getElementById("iframepage"); 
		var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument; 
		if(ifm != null && subWeb != null) { 
			ifm.height = subWeb.body.scrollHeight; 
		} 
	} 
</script>
</head>

<body>
	<div class="header top">
		<div style="float: left;">你好， <%=username %> ！</div>
		<div style="float: left;"><a href="logout.jsp" style="font-size: small;color: white;line-height: 50px">安全退出</a></div>
	</div>
	<div style="height: 50px;">&nbsp;</div>
	
	<div style="height: 30px;"></div>
	<div class="content">
		<div class="contentLeft">
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
<!-- 			<div style="background:rgba(224, 224, 224, 1);color:rgba(116, 121, 142, 1);text-align: center;height: 30px;font-size: medium;line-height:200%">信息管理</div>	 -->
				<div id="contentLeftListTitle">学生信息管理</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="studentImport()">▶学生信息录入</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="studentUpdate()">▶学生信息修改</div>
			</div>
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">课程信息管理</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="courseImport()">▶课程信息录入</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="courseUpdate()">▶课程信息修改</div>
			</div>
			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">教师信息管理</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="teacherImport()">▶教师信息录入</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="teacherUpdate()">▶教师信息修改</div>
			</div>
			
<!-- 		<div class="contentLeftList" onmouseover="this.className='contentLeftList cllf'" onmouseout="this.className='contentLeftList'" onclick="teacherCoursetableQuery()">教师课程表查询</div><hr />
			<div class="contentLeftList" onmouseover="this.className='contentLeftList cllf'" onmouseout="this.className='contentLeftList'" onclick="studentCoursetableQuery()">学生课程表查询</div><hr />
-->			<div style="border:1px solid #E1E1E1;margin-left:30px;margin-bottom: 10px;">
				<div id="contentLeftListTitle">系统功能</div>
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="classCoursetableQuery()">▶班级课程表查询</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="workloadAnalysis()">▶工作量分析</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="dataBackup()">▶数据备份</div><hr />
				<div class="contentLeftList" onmouseover="omover(this)" onmouseout="omout(this)" onclick="AutoSchedule()">▶自动排课</div>
			</div>
		</div>
		<div class="contentRight" id="contentMain"><iframe  id="iFRAME" frameborder= '0' src="welcome.html" width="100%"></iframe></div>
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
