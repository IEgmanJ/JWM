<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

 <jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'courseUpdateInsert.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
    
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程信息更新</a></div>
  <% 
  String c_name=request.getParameter("c_name");

  String c_period=request.getParameter("c_period");
   Statement stmt=null;
   stmt =conn.getConnection().createStatement();
   String c_code=(String)session.getAttribute("c_code");
   String sql="update  courser set c_name='"+c_name+"' ,c_code='"+c_code+"',c_period='"+c_period+"'where c_code='"+c_code+"'";
   System.out.print(sql);
   int temp=stmt.executeUpdate(sql);
   if(temp !=0){
	   out.print("操作成功！正在返回。。。");
	     response.setHeader("Refresh","2;URL=../courseUpdate.jsp");   }
   else{
	   out.print("失败!");
	   
	   
   }
   %>
  </body>
</html>
