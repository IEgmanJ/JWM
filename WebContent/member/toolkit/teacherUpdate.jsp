<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/JWM.css"/>
<style type="text/css">
 td{
    width:230px;
    text-align:center;
    margin:0px;
    height:34px;
    padding:0px;
 }
 table{
 font-family:"微软雅黑";
   margin:0 auto;
   font-size:14px;
 }
</style>
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">教师信息修改</a></div>
<form>
<table><tr><td>姓名</td><td>教工编号</td><td>操作</td></tr>
<tr><td colspan="3" style="border-top:1px solid;height:1px;"></td></tr>

<%   Statement stmt=null;
String t_id = request.getParameter("id");
String as = (String)session.getAttribute("as");
   stmt =conn.getConnection().createStatement();
    String sql="SELECT t_name , t_id FROM teachers";
   ResultSet rs=stmt.executeQuery(sql);

   if("teacher".equals(as)){
	   response.sendRedirect("s/teacherUpdateSelect.jsp?t_id="+t_id);
   }
else if("admin".equals(as)){
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
		 
		        stmt =conn.getConnection().createStatement();
		        String sql1="select count(*)from teachers";
		        
		      rs=stmt.executeQuery(sql1);
		      rs.next();
		      
		     totalRecorder=rs.getInt(1);
		    if(totalRecorder% pageSize==0){
		        totalPage=totalRecorder/pageSize;
		    }
		    else{
		      totalPage=totalRecorder/pageSize+1;
		    }
		    
		    if(currentPage<1){
		      currentPage=1;
		      }else{
		      if(currentPage>totalPage){
		        currentPage=totalPage;
		      }
		      }
		             
		    sql="select * from teachers limit "+(currentPage-1)*pageSize+","+pageSize;
		    rs=stmt.executeQuery(sql);
		    while(rs.next()){
		    	 
		    %>
		   <tr>
			<td><%=rs.getString("t_name") %></td>
		   	<td><%=rs.getString("t_id") %></td>
			   	<td>
			   		<a href="s/teacherDel.jsp?t_id=<%=rs.getString("t_id") %>">删除</a>
			       	<a href="s/teacherUpdateSelect.jsp?t_id=<%=rs.getString("t_id") %>">修改</a>
			    </td>
		    </tr>
		  
		 
		      
		    <%  }%>
		    <tr><td colspan="3">
		    <font size="2">跳转到:<input type="text" name="page" size="3"><input type="submit" name="page" value="GO">总页数:[<%=currentPage%>/<%=totalPage%>]</font>

		   
		     <% 
		     if(currentPage>1){
		     %>
		     <a href="teacherUpdate.jsp?page=1">首页</a>
		     <a href="teacherUpdate.jsp?page=<%=currentPage-1%>">上一页</a>
		     
		     
		     <% }
		     
		     if(currentPage<totalPage){%>
		     <a href="teacherUpdate.jsp?page=<%=currentPage+1%>">下一页</a>
		     <a href="teacherUpdate.jsp?page=<%=totalPage%>">尾页</a>
		    <%}}catch(Exception e){
		    	e.printStackTrace();
		    	
		    	}}%>
		    	
		    	

    
</table>
</form>
</body>
</html>