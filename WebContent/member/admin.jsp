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
		
	}else if("teacher".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "teacher.jsp";
		response.setHeader("Location",newLocn);
	}else if("student".equals(AS)){
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "index.jsp";
		response.setHeader("Location",newLocn);
	}
	System.out.println("session ID："+session.getId());
	System.out.println("session ID："+session.getAttribute("ID"));
	System.out.println("session AS："+session.getAttribute("AS"));
	System.out.println("session USERNAME："+session.getAttribute("USERNAME"));

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理中心  <%=USERNAME %> | 管理员JWM</title>
<link rel="stylesheet" type="text/css" href="../css/JWM.css"/>
<script type="text/javascript">

	function studentImport(){
		document.getElementById("iFRAME").src = "toolkit/studentImport.jsp";
	}
	function studentUpdate(){
		document.getElementById("iFRAME").src = "toolkit/studentUpdate.jsp";
	}
	function courseImport(){
		document.getElementById("iFRAME").src = "toolkit/courseImport.jsp";
	}
	function courseUpdate(){
		document.getElementById("iFRAME").src = "toolkit/courseUpdate.jsp";
	}
	function teacherImport(){
		document.getElementById("iFRAME").src = "toolkit/teacherImport.jsp";
	}
	function teacherUpdate(){
		document.getElementById("iFRAME").src = "toolkit/teacherUpdate.jsp";
	}
	function classroomQuery(){ //暂时不用
		document.getElementById("iFRAME").src = "toolkit/classroomQuery.jsp";
	}
//	function teacherCoursetableQuery(){
//		document.getElementById("iFRAME").src = "toolkit/teacherCoursetableQuery.jsp";
//	}
//	function studentCoursetableQuery(){
//		document.getElementById("iFRAME").src = "toolkit/studentCoursetableQuery.jsp";	
//	}
	function classCoursetableQuery(){
		document.getElementById("iFRAME").src = "toolkit/classCoursetableQuery.jsp";
	}
	function workloadAnalysis(){
		document.getElementById("iFRAME").src = "toolkit/workloadAnalysis.jsp";
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
		
//		alert("IFRAME="+IFRAME+"\nleftWidth="+leftWidth+"\nclientWidth="+clientWidth);
		
		/*
		------------------------------------------
		在IE中 （以Height为例）
		~$('iFRAME').contentDocument.body.scrollHeight
		~iFRAME.
		是只读的，
		很多东西IE中是只读的，在非IE中却可读写
		-----------------------------------------
		不是那样的，$('iFRAME').contentDocument.body.scrollHeight都是只读的
		
		*/
/*		var IFRAMEinnerHeight = IFRAME.contentDocument.body.scrollHeight;
		var IFRAMEinnerWidth = IFRAME.contentDocument.body.scrollWidth; //如果有边框需要加上17，很麻烦，因此 scrolling="no"
		
		alert("IFRAMEinnerHeight="+IFRAMEinnerHeight+"\nIFRAMEinnerWidth="+IFRAMEinnerWidth);
		
		if(clientWidth-leftWidth > IFRAMEinnerWidth){
			var tmp = clientWidth-leftWidth;
			alert("clientWidth-leftWidth = "+tmp);
			IFRAME.width = clientWidth - leftWidth;
			IFRAME.height = IFRAMEinnerHeight ;
			alert("当前可视宽度:"+clientWidth+
					"\n IFRAMEinnerHeight :" + IFRAMEinnerHeight +
					"\n IFRAMEinnerWidth :"  + IFRAMEinnerWidth  +
					"\n IFRAME.height :"+ IFRAME.height+
					"\n IFRAME.width :" + IFRAME.width);
		}else if(clientWidth-leftWidth <= IFRAMEinnerWidth){
			IFRAME.width = IFRAMEinnerWidth ;
			IFRAME.height = IFRAMEinnerHeight ;
			alert("当前可视宽度:"+clientWidth+
					"\n IFRAMEinnerHeight :" + IFRAMEinnerHeight +
					"\n IFRAMEinnerWidth :"  + IFRAMEinnerWidth  +
					"\n IFRAME.height :"+ IFRAME.height+
					"\n IFRAME.width :" + IFRAME.width);
		}
		
*/		
		
		
/*	
失误
		//多了37px，绝对是scroll的宽度
//		if(-[1,])//只对IE8有效
	
		//利用 只读 进行判断	
		if(tmp != IFRAMEinnerWidth){
			IFRAMEinnerWidth--;
			//非IE 
			alert("NOT IE");
		}else if(tmp == IFRAMEinnerWidth){
			alert("IE");
			//IE ； IFRAMEinnerHeight，IFRAMEinnerWidth为只读
			var minWidth = IFRAMEinnerWidth - leftWidth; //所能容忍的最小宽度
			if(clientWidth <= minWidth){
				//什么都不做
			}else{
				iFRAME.width = clientWidth - leftWidth + 37;
				iFRAME.height =  IFRAMEinnerHeight + 37;
			}
		}
*/ 

//	setTimeout("要执行的js语句", 等待的时间)

//	}
	
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
			style="position:absolute;top:0;right:30px;font-size:medium ;display: inline;line-height: 50px;cursor:pointer;padding-left: 10px; padding-right: 10px " 
			onmouseover="topomover(this)" 
			onmouseout="topomout(this)"> <%=USERNAME %>
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
		<div class="contentRight" id="contentMain"><iframe  id="iFRAME" frameborder= '0' src="welcome.html" scrolling="no" width="100%" height="100%"></iframe></div>
		<div style="clear: both;"></div>
	</div>

    <div style="height: 60px;">&nbsp;</div>
    <div class="footer bottom">
        	<ul>
            <li><a class="xh" href="mailto:1187260097@qq.com">联系我们 </a>  </li>
            <li><a class="xh" href="mailto:1617427997@qq.com">快联系我们 </a>  </li>
            <li><a class="xh" href="mailto:944392498@qq.com">赶快联系我们 </a>  </li>
            <li>&copy;2014-2015 JWM</li>
            </ul>
	</div>
</body>
</html>
