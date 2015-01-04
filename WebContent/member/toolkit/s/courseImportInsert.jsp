<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
   <jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean> 
    
    <title>My JSP 'courseImportInsert.jsp' starting page</title>
   

  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程信息导入</a></div>
  <% 
  String c_code=request.getParameter("c_code");
  String c_name=request.getParameter("c_name");
  String c_period=request.getParameter("c_period");
  String sql="insert into courser(c_name,c_code,c_period) VALUES('"+c_name+"','"+c_code+"','"+c_period+"') ";
  System.out.println(sql);
  if(sqlQuery.write(sql)){
     out.print("录入成功！正在返回。。。");
     response.setHeader("Refresh","2;URL=../courseImport.jsp");
   }
  else{%>
  <div>J W M</div>
	<div style="height: 350px; width: 900px; text-align: center;margin: 0 auto; margin-top: 200px;">
   		录入失败！请<a class="xh"  href="javascript:history.go(-1)">返回</a>,重新填写
  
    </div>
<% 
  }

  %>
 
  </body>
</html>
