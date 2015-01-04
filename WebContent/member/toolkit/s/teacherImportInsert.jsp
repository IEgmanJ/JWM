<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

   <jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

 
    
    <title>studentImportInsert.jsp</title>
    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
   

  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">教师信息录入</a></div>
  <% 
  String t_name=request.getParameter("t_name");
  String t_id=request.getParameter("t_id");
  String t_pwd=request.getParameter("t_pwd");
  String t_sex=request.getParameter("t_sex");
  
  String t_c_code=request.getParameter("t_c_code");
  String t_tell=request.getParameter("t_tell");
  String t_address=request.getParameter("t_address");
  String sql="insert into teachers(t_name,t_id,t_pwd,t_sex,t_c_code,t_tell,t_address) VALUES('"+t_name+"',"+t_id+",'"+t_pwd+"','"+t_sex+"','"+t_c_code+"','"+t_tell+"','"+t_address+"') ";
  System.out.println(sql);
  if(sqlQuery.write(sql)){
     out.print("录入成功！正在返回。。。");
     response.setHeader("Refresh","2;URL=../teacherImport.jsp");
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
