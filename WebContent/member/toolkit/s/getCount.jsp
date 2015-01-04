<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean>

<%
  	String insertObject = request.getParameter("insertObject");

	String code = request.getParameter("code");
	if("student".equals(insertObject)){
	String sql = "SELECT count(*) AS c FROM students WHERE s_mj_code ='"+code+"'";
		int count = Integer.parseInt( sqlQuery.read(sql,"c")[0] ) + 1;
		out.print(count>9?count:"0"+count);
		System.out.print(count>9?count:"0"+count);
	}else if("teacher".equals(insertObject)){
		String sql = "SELECT count(*) AS c FROM teachers WHERE t_c_code ='"+code+"'";
		int count = Integer.parseInt( sqlQuery.read(sql,"c")[0] ) + 1;
		out.print(count>9?count:"0"+count);
		System.out.print(count>9?count:"0"+count);
	}else{
		out.print("非法访问");
	}
%> 