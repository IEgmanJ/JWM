<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%	
	String dbUsername = "";
	String dbPassword = "";
	String dbTable = "";	//此类型用户数据存放的表
	String filedId = "";	//存放次用户id的字段名
	
	String id="";	//用户的id
	String as = ""; //作为xx登录
	
	request.setCharacterEncoding("UTF-8");
	String isTeacher = request.getParameter("isTeacher"); // on or off
	
	String username = request.getParameter("username"); 
	String password = request.getParameter("password"); 
	
	System.out.println(username);
	
	String success="";
	
	if(isTeacher == null){
		//isTeacher没有传递到这个页面，因此是以管理员身份登录
		dbUsername = "a_name";
		dbPassword = "a_pwd";
		dbTable = "admin";
		success="s1";
		filedId = "a_id";
		as = "admin";
		
		
		System.out.println("登录的身份是管理员");
	}else if("true".equals(isTeacher)){ //首先判断是否是以老师的身份登录
		dbUsername = "t_name";
		dbPassword = "t_pwd";
		dbTable = "teachers";
		success="s2";
		filedId = "t_id";
		as = "teacher";
		
		System.out.println("登录的身份是老师");
	}else if("false".equals(isTeacher)){
		dbUsername = "s_name";
		dbPassword = "s_pwd";
		dbTable = "students";
		success="s3";
		filedId = "s_id";

		as = "student";
		
		System.out.println("登录的身份是学生");
	}
	
	String sql = "SELECT "+filedId
			+" FROM "  + dbTable
			+" WHERE " + dbUsername + " = '"+username+"'" + " AND "
			+dbPassword + " = '" + password + "'";
	//查询 id
	String result[] =  sqlQuery.read(sql,filedId);
	id = result[0];
	
	if(result[0] == null){
		out.print(" 登录失败，请检查用户名和密码！");//登录失败
	}else{
		//登录成功
		out.print(" 登录成功，正在跳转！");
		session.setAttribute("id", id);
		session.setAttribute("as", as);
		session.setAttribute("username", username);
		out.print("<span style=\"font-size:1px\">"+success+"</span>");
	}
	
	Thread.sleep(2000); //腾出时间显示动画
%>

</body>
</html>