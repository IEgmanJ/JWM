<%@page import="java.util.ArrayList"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean> 
<%
	String s_id =  (String)session.getAttribute("ID");
	String as = (String)session.getAttribute("AS");
	if("admin".equals(as)||"teacher".equals(as)){ 
	%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../../css/JWM.css"/>
		<style type="text/css">
		td{
			padding-top:5px;
			padding-bottom:5px;
			width:200px;
		}
		</style>
	</head>
	<body>
		<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">学生信息修改</a></div>
		<form>
			<table>
				<tr style="font-weight:bold;">
					<td>姓名</td>
					<td>学号</td>
					<td>操作</td>
					</tr>
				<tr>
					<td colspan="3" style="border-top:1px solid;height:1px"></td>
					</tr>
				<%
					try{
						String str=(String)request.getParameter("page");
						if(str==null||str==""){
							str="1";
						}
						int pageSize=10;//每页5条
						int totalPage=0;//页数
						int totalRecorder=0;//总共记录
						int currentPage=0;//当前页
						int nextPage=0;//下一页
						int beforePage=0;//上一页
						
						currentPage=Integer.parseInt(str);
						totalRecorder = Integer.parseInt(sqlQuery.read("SELECT count(*) AS sum FROM students","sum")[0]);
						
						if(totalRecorder% pageSize==0){
							totalPage=totalRecorder/pageSize;
						}else{
							totalPage=totalRecorder/pageSize+1;
						}
						
						if(currentPage<1){
							currentPage=1;
						}else{
							if(currentPage>totalPage){
								currentPage=totalPage;
							}
						}
						
						ArrayList<String[]> allStudents = sqlQuery.reads("select * from students limit "+(currentPage-1)*pageSize+","+pageSize, "s_id" ,"s_name");
						for(String[] student : allStudents){
					%>
				<tr>
					<td><%=student[0]/*学号 */%></td>
					<td><%=student[1]/*姓名 */%></td>
					<td>
						<a class="xh" href="s/studentDel.jsp?s_id=<%=student[0] %>">删除</a>
						<a class="xh" href="s/studentUpdateSelect.jsp?s_id=<%=student[0] %>">修改</a>
						</td>
					</tr>
					<%
						}
						%>
				<tr style="color:rgb(0, 113, 197);font-size:smaller">
					<td colspan="3">跳转到:
						<input name="page" style="width:25px; height:18px;">
						<input type="submit" name="page" style="width: 25px; height: 18px; color:rgb(255, 255, 255); background-color:rgb(0, 113, 197);border-color: rgb(0, 113, 197);border-style: solid;padding:0px" value="GO">总页数:[<%=currentPage%>/<%=totalPage%>]
					<%
						if(currentPage>1){
						%>
						<a class="xh" href="studentUpdate.jsp?page=1">首页</a>
						<a class="xh" href="studentUpdate.jsp?page=<%=currentPage-1%>">上一页</a>
					<%
						}
						if(currentPage<totalPage){
						%>
						<a class="xh" href="studentUpdate.jsp?page=<%=currentPage+1%>">下一页</a>
						<a class="xh" href="studentUpdate.jsp?page=<%=totalPage%>">尾页</a>
					<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
						</td>
					</tr>
			</table>
		</form>
		<%    	
   	}
	else if("student".equals(as)){
		response.sendRedirect("s/studentUpdateSelect.jsp?s_id="+s_id);
	}
	%>
	</body>
</html>