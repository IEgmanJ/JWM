<%@ page language="java"  pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean> 
<html>
  <head>

    <link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
	<style type="text/css">
	.input{
		height:30px;
		width:350px; 
	}
	.btn{
		background-color:rgb(0, 113, 197);
		color:rgb(255, 255, 255);
		border-width:0px;
		margin-right:40px;
		height:30px;
		width:100px;
	}
	table{
		margin:0 auto;
		line-height:30px;
	}
	td{
		padding-top:5px;
		padding-bottom:5px;
	}
	</style>
 
    <title>My JSP 'teacherUpdateSelect.jsp' starting page</title>
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> ><a class="xh" href="javascript:void(0)">教师信息修改</a></div>
   <%
   String t_id=request.getParameter("t_id");
   String[] info = sqlQuery.read("SELECT * FROM teachers where t_id="+t_id+"","t_name","t_pwd","t_id","t_c_code","t_sex","t_tell","t_address");
   %>

   <form action="teacherUpdateInsert.jsp" method="get">
   <em style="font-size:small">注：教工号、课程代码不可修改</em>
<table style="text-align:center">
<tr><td >姓名</td><td><input class="input"  name="t_name" type="text" value="<%=info[0] %>"/></td></tr>
<tr><td>密码</td><td><input class="input" name="t_pwd" type="text" value="<%=info[1] %>"/></td></tr>
<tr><td>教工编号</td><td><input class="input" readonly="readonly" name="t_id" type="text" value="<%=info[2] %>"/></td></tr>
<tr><td>课程</td><td><input class="input" readonly="readonly" name="t_c_code" type="text" value="<%=info[3] %>"/></td></tr>
<tr><td>性别</td><td><input name="t_sex" type="radio" value="女"<%=info[4].equals("女")?"checked='checked'":null %>/><span style="margin-right:80px">女</span><input  name="t_sex" type="radio" value="男" <%=info[4].equals("男")?"checked='checked'":null %>/>男 </td></tr>
  <tr><td>联系方式</td><td><input class="input" name="t_tell" type="text" value="<%=info[5]%>"></td></tr>
  <tr><td>家庭住址</td><td><input class="input" name="t_address" type="text" value="<%=info[6]%>"></td></tr>
  <tr><td></td><td><input  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>
  </body>
</html>
