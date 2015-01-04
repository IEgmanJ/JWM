<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

   <jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>studentImportInsert.jsp</title>
    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
   

  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">学生信息录入</a></div>
  <% 
  String s_name=request.getParameter("s_name");
  String s_id=request.getParameter("s_id");
  String s_pwd=request.getParameter("s_pwd");
  String s_nation=request.getParameter("s_nation");
  String s_sex=request.getParameter("s_sex");
  String s_sc_code=request.getParameter("s_sc_code");
  String s_mj_code=request.getParameter("s_mj_code");
  String s_tell=request.getParameter("s_tell");
  String s_address=request.getParameter("s_address");
  String sql="insert into students(s_name,s_id,s_pwd,s_nation,s_sex,s_sc_code,s_mj_code,s_tell,s_address) VALUES('"+s_name+"',"+s_id+",'"+s_pwd+"','"+s_nation+"','"+s_sex+"','"+s_sc_code+"','"+s_mj_code+"','"+s_tell+"','"+s_address+"') ";
  if(sqlQuery.write(sql)){
     out.print("录入成功！正在返回。。。");
     response.setHeader("Refresh","2;URL=../studentImport.jsp");
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
