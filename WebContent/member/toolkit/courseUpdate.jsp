<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <jsp:useBean id="conn" class="DB.MyConn" scope="session"></jsp:useBean> 
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
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程信息修改</a></div>
<form>
<table><tr><td>课程代码</td><td>课程名称</td><td>操作</td></tr>
<tr><td colspan="3" style="border-top:1px solid;height:1px"></td></tr>

<%   
Statement stmt=null;
String as = (String)session.getAttribute("as");
	stmt =conn.getConnection().createStatement();

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
		        String sql="select count(*)from courser";
		        
		        ResultSet rs=stmt.executeQuery(sql);
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
		             
		    sql="select * from courser limit "+(currentPage-1)*pageSize+","+pageSize;
		    rs=stmt.executeQuery(sql);
		    while(rs.next()){
		    	 
		    %>
		   <tr>
			<td><%=rs.getString("c_code") %></td>
		   	<td><%=rs.getString("c_name") %></td>
			   	<td>
			   		<a href="s/courseDel.jsp?c_code=<%=rs.getString("c_code") %>">删除</a>
			       	<a href="s/courseUpdateSelect.jsp?c_code=<%=rs.getString("c_code") %>">修改</a>
			    </td>
		    </tr>
		      
		    <%  }%>
		    <tr><td colspan="3">
		   
		    <font size="2">跳转到:<input type="text" name="page" size="3"><input type="submit" name="page" value="GO">总页数:[<%=currentPage%>/<%=totalPage%>]</font>
		     <% 
		     if(currentPage>1){
		     %>
		     <a href="courseUpdate.jsp?page=1">首页</a>
		     <a href="courseUpdate.jsp?page=<%=currentPage-1%>">上一页</a>
		     
		 
		     <% }
		     
		     if(currentPage<totalPage){%>
		     <a href="courseUpdate.jsp?page=<%=currentPage+1%>">下一页</a>
		     <a href="courseUpdate.jsp?page=<%=totalPage%>">尾页</a>
		           
		    <%}}catch(Exception e){
		    	e.printStackTrace();
		    	
		    	}%>
    
</table>
</form>
</body>
</html>