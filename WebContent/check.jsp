<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%	
	String dbTable = "";	//此类型用户数据存放的表
	String filedUsername = ""; //存放用户名的字段名
	String filedPassword = ""; //存放密码的字段名
	String filedId = "";	//存放次用户id的字段名
	
	//将被存储在session中
	String ID = "";	//用户的id
	String USERNAME = "";//用户名	
	String AS = ""; //作为xx登录
	
	//从主页传来的登录名密码
	String id = request.getParameter("username");  //由于用户名可能有重复，username其实是用户的id
	String password = request.getParameter("password"); 
	
	request.setCharacterEncoding("UTF-8");
	String isTeacher = request.getParameter("isTeacher"); // on or off
	
	System.out.println(id);
	
	String success=""; //用于另一个页面判断登录的身份
	
	if(isTeacher == null){
		//isTeacher没有传递到这个页面，因此是以管理员身份登录
		dbTable = "admin";
		filedUsername = "a_name";
		filedPassword = "a_pwd";
		filedId = "a_id";
		
		success="s1";
		AS = "admin";
		ID = id;
		
		System.out.println("登录的身份是管理员");
	}else if("true".equals(isTeacher)){ //首先判断是否是以老师的身份登录
		dbTable = "teachers";
		filedUsername = "t_name";
		filedPassword = "t_pwd";
		filedId = "t_id";
		
		success="s2";
		AS = "teacher";
		ID = id;
		
		System.out.println("登录的身份是老师");
	}else if("false".equals(isTeacher)){
		dbTable = "students";
		filedUsername = "s_name";
		filedPassword = "s_pwd";
		filedId = "s_id";
		
		success="s3";
		AS = "student";
		ID = id;
		
		System.out.println("登录的身份是学生");
	}
	
	String sql = "SELECT "+filedUsername
			+" FROM "  + dbTable
			+" WHERE " + filedId + " = '"+id+"'" + " AND "
			+filedPassword + " = '" + password + "'";
	//查询 用户名
	String result[] =  sqlQuery.read(sql,filedUsername);
	USERNAME = result[0];
	
	if(result[0] == null){
		out.print(" 登录失败，请检查用户名和密码！");//登录失败
	}else{
		//登录成功
		out.print(" 登录成功，正在跳转！");
		session.setAttribute("ID", ID);
		session.setAttribute("AS", AS);
		session.setAttribute("USERNAME", USERNAME);
		out.print("<span style=\"font-size:1px\">"+success+"</span>");
	}
	
	Thread.sleep(1000); //腾出时间显示动画
%>

</body>
</html>