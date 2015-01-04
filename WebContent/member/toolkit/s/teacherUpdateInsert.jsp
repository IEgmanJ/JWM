<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

 <jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'teacherUpdateInsert.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
    
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> ><a class="xh" href="javascript:void(0)">教师信息修改</a></div>
  <% 
  
  String t_name=request.getParameter("t_name");
  String t_sex=request.getParameter("t_sex");
  String t_pwd=request.getParameter("t_pwd");
  String t_c_code=request.getParameter("t_c_code");
  String t_tell=request.getParameter("t_tell");
  String t_address=request.getParameter("t_address");
   Statement stmt=null;
   stmt =conn.getConnection().createStatement();
   String t_id=(String)session.getAttribute("t_id");
   String sql="update  teachers set t_name='"+t_name+"' ,t_c_code='"+t_c_code+"',t_pwd='"+t_pwd+"',t_sex='"+t_sex+"',t_tell='"+t_tell+"',t_address='"+t_address+"'where t_id="+t_id+"";
   System.out.print(sql);
   int temp=stmt.executeUpdate(sql);
   if(temp !=0){
	   out.print("操作成功！正在返回。。。");
     response.setHeader("Refresh","2;URL=../teacherUpdate.jsp");
   }
   else{
	   out.print("失败!");
	   
	   
   }
   %>
  </body>
</html>
