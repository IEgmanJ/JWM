<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

<jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 

    
    <title>My JSP 'courseUpdateSelect.jsp' starting page</title>
  <style type="text/css">
body {
    margin: 0;
    font-family: "Segoe UI","Segoe UI Web Regular","Segoe UI Symbol","Helvetica Neue","BBAlpha Sans","S60 Sans",Arial,sans-serif;
    color: #000;
    background-color: #fff;
    font-size: 88%;
}
 .input{
 font-size:14px;
    margin-top:0px;
      height:35px;
      width:350px;
      margin-top:5px;
      margin-bottom:5px     }


.input1{
    height:40px;
    width:60px;
   
}
table{

   margin:0 auto;
       font-size:14px;
     
}
</style>
 
  </head>
  
  <body>
 <div style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> ><a class="xh" href="javascript:void(0)">课程信息修改</a></div>
   <%
   String c_code=request.getParameter("c_code");
   Statement stmt=null;
   stmt =conn.getConnection().createStatement();
    String sql="SELECT*FROM courser where c_code='"+c_code+"'";
    session.setAttribute("c_code",c_code);
   ResultSet rs=stmt.executeQuery(sql);
   while(rs.next()){
   %>
 <form action="courseUpdateInsert.jsp" method="get">
<table style="text-align:center">
<tr><td >课程名称</td><td><input class="input"  name="c_name" type="text" value="<%=rs.getString("c_name") %>"/></td></tr>
<tr><td>课程代码</td><td><input class="input" name="c_code" type="text" value="<%=rs.getString("c_code") %>"/></td></tr>
  <tr><td>课程时长</td><td><input class="input" name="c_period" type="text" value="<%=rs.getString("c_period")%>"></td></tr>
  <tr><td colspan="2"><input style="margin-right:50px;margin-left:60px;"  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>
   <% 
   }
       %>
  </body>
</html>
