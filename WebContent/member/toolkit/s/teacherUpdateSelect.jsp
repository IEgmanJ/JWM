<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

 <jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
    <style type="text/css">



 .input{
 font-size:14px;
    margin-top:0px;
      height:25px;
      width:300px;
      margin-top:5px;
      margin-bottom:5px     }

     td{
     height:25px;
     }
.input1{
    height:40px;
    width:60px;
   
}
table{

   margin:0 auto;
       font-size:14px;
       height:300px;
}
</style>
 
    <title>My JSP 'teacherUpdateSelect.jsp' starting page</title>
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> ><a class="xh" href="javascript:void(0)">教师信息修改</a></div>
   <%
   String t_id=request.getParameter("t_id");
   Statement stmt=null;
   stmt =conn.getConnection().createStatement();
    String sql="SELECT*FROM teachers where t_id="+t_id+"";
    session.setAttribute("t_id",t_id);
   ResultSet rs=stmt.executeQuery(sql);
   while(rs.next()){
   %>

   <form action="teacherUpdateInsert.jsp" method="get">
   <em>注：教工号、课程代码不可修改</em>
<table style="text-align:center">
<tr><td >姓名</td><td><input class="input"  name="t_name" type="text" value="<%=rs.getString("t_name") %>"/></td></tr>
<tr><td>密码</td><td><input class="input" name="t_pwd" type="text" value="<%=rs.getString("t_pwd") %>"/></td></tr>
<tr><td>教工编号</td><td><input class="input" readonly="readonly" name="t_id" type="text" value="<%=rs.getString("t_id") %>"/></td></tr>
<tr><td>课程</td><td><input class="input" readonly="readonly" name="t_c_code" type="text" value="<%=rs.getString("t_c_code") %>"/></td></tr>
<tr><td>性别</td><td><input name="t_sex" type="radio" value="女"<%=rs.getString("t_sex").equals("女")?"checked='checked'":null %>/><span style="margin-right:80px">女</span><input  name="t_sex" type="radio" value="男" <%=rs.getString("t_sex").equals("男")?"checked='checked'":null %>/>男 </td></tr>
  <tr><td>联系方式</td><td><input class="input" name="t_tell" type="text" value="<%=rs.getString("t_tell")%>"></td></tr>
  <tr><td>家庭住址</td><td><input class="input" name="t_address" type="text" value="<%=rs.getString("t_address")%>"></td></tr>
  <tr><td colspan="2"><input style="margin-right:50px;margin-left:60px;"  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>
   <% 
   }
       %>
  </body>
</html>
