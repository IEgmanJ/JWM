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
    <title>My JSP 'studentUpdateSelect.jsp' starting page</title>
  </head>
  
  <body>
  <div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> ><a class="xh" href="javascript:void(0)">学生信息修改</a></div>
   
   <%
		String s_id = request.getParameter("s_id");
		String info[] = sqlQuery.read("SELECT * FROM students where s_id='"+s_id+"'", "s_name", "s_pwd", "s_id","s_nation","s_sc_code","s_mj_code","s_sex","s_tell","s_address");
	%>

   <form action="studentUpdateInsert.jsp" method="get">
   <em style="font-size:small">注：学号、学院、专业代码不可修改</em>
<table>
<tr><td >姓名</td><td><input class="input"  name="s_name" type="text" value="<%=info[0] %>"/></td></tr>
<tr><td>密码</td><td><input class="input" name="s_pwd" type="text" value="<%=info[1] %>"/></td></tr>
<tr><td>学号</td><td><input class="input" readonly="readonly" name="s_id" type="text" value="<%=info[2] %>"/></td></tr>
<tr><td>民族</td><td><input class="input" name="s_nation" type="text" value="<%=info[3]%>"/></td></tr>
<tr><td>学院</td><td><input class="input" readonly="readonly" name="s_sc_code" type="text" value="<%=info[4] %>"/></td></tr>
<tr><td>专业</td><td><input class="input" readonly="readonly" name="s_mj_code" type="text" value="<%=info[5]%>"/></td></tr>
<tr><td>性别</td><td><input name="s_sex" type="radio" value="女" <%=info[6].equals("女")?"checked='checked'":null %>/><span style="margin-right:80px">女</span><input  name="s_sex" type="radio" value="男" <%=info[6].equals("男")?"checked='checked'":null %>/>男 </td></tr>
  <tr><td>联系方式</td><td><input class="input" name="s_tell" type="text" value="<%=info[7]%>"></td></tr>
  <tr><td>家庭住址</td><td><input class="input" name="s_address" type="text" value="<%=info[8]%>"></td></tr>
  <tr><td></td><td> <input class="btn" type="submit" value="提交"/> <input  class="btn" type="reset" value="重置"/></td></tr>
</table>
</form>
  </body>
</html>
