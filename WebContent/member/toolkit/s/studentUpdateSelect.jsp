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
 
    <title>My JSP 'studentUpdateSelect.jsp' starting page</title>
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> ><a class="xh" href="javascript:void(0)">学生信息修改</a></div>
   <%
   String s_id=request.getParameter("s_id");
   Statement stmt=null;
   stmt =conn.getConnection().createStatement();
    String sql="SELECT*FROM students where s_id="+s_id+"";
    session.setAttribute("s_id",s_id);
   ResultSet rs=stmt.executeQuery(sql);
   while(rs.next()){
   %>

   <form action="studentUpdateInsert.jsp" method="get">
   <em>注：学号、学院、专业代码不可修改</em>
<table style="text-align:center">
<tr><td >姓名</td><td><input class="input"  name="s_name" type="text" value="<%=rs.getString("s_name") %>"/></td></tr>
<tr><td>密码</td><td><input class="input" name="s_pwd" type="text" value="<%=rs.getString("s_pwd") %>"/></td></tr>
<tr><td>学号</td><td><input class="input" readonly="readonly" name="s_id" type="text" value="<%=rs.getString("s_id") %>"/></td></tr>
<tr><td>民族</td><td><input class="input" name="s_nation" type="text" value="<%=rs.getString("s_nation") %>"/></td></tr>
<tr><td>学院</td><td><input class="input" readonly="readonly" name="s_sc_code" type="text" value="<%=rs.getString("s_sc_code") %>"/></td></tr>
<tr><td>专业</td><td><input class="input" readonly="readonly" name="s_mj_code" type="text" value="<%=rs.getString("s_mj_code") %>"/></td></tr>
<tr><td>性别</td><td><input name="s_sex" type="radio" value="女"<%=rs.getString("s_sex").equals("女")?"checked='checked'":null %>/><span style="margin-right:80px">女</span><input  name="s_sex" type="radio" value="男" <%=rs.getString("s_sex").equals("男")?"checked='checked'":null %>/>男 </td></tr>
  <tr><td>联系方式</td><td><input class="input" name="s_tell" type="text" value="<%=rs.getString("s_tell")%>"></td></tr>
  <tr><td>家庭住址</td><td><input class="input" name="s_address" type="text" value="<%=rs.getString("s_address")%>"></td></tr>
  <tr><td colspan="2"><input style="margin-right:50px;margin-left:60px;"  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>
   <% 
   }
       %>
  </body>
</html>
