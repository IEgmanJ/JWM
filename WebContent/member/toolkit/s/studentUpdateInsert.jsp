<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

 <jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'studentUpdateInsert.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
    
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">学生信息更新</a></div>
  <% 
  
  String s_name=request.getParameter("s_name");
  String s_nation=request.getParameter("s_nation");
  String s_sex=request.getParameter("s_sex");
  String s_pwd=request.getParameter("s_pwd");

  String s_tell=request.getParameter("s_tell");
  String s_address=request.getParameter("s_address");
   Statement stmt=null;
   stmt =conn.getConnection().createStatement();
   String s_id=(String)session.getAttribute("s_id");
   String sql="update  students set s_name='"+s_name+"' ,s_nation='"+s_nation+"',s_pwd='"+s_pwd+"',s_sex='"+s_sex+"',s_tell='"+s_tell+"',s_address='"+s_address+"'where s_id="+s_id+"";
   System.out.print(sql);
   int temp=stmt.executeUpdate(sql);
   if(temp !=0){
	   out.print("操作成功！正在返回。。。");
     response.setHeader("Refresh","2;URL=../studentUpdate.jsp");
   }
   else{
	   out.print("失败!");
	   
	   
   }
   %>
  </body>
</html>
