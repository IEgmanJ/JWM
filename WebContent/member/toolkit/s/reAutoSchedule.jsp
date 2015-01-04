<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ca" class="DB.CourseAuto" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
<title>正在排课</title>
</head>
<body>

<%
	if(ca.clearAllCourserTable()){
		String[] Info = ca.paike();
		out.println("已完成");
		out.println("<br/>开始时间："+Info[0]);
		out.println("<br/>结束时间："+Info[1]);
%>
<br/><a class="xh" href="classCoursetableQuery.jsp">点此</a>去查看新的课程表。
<%
	}else{
		out.println("原有课程信息清除失败，请改天再试。");
	}
%>
</body>
</html>