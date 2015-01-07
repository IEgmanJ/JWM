<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean>
<%
	String searchObject = request.getParameter("searchObject");
	String code = request.getParameter("code"); //班级/专业代码 学生id
	
	
	String sql = "";
	
	if("class".equals(searchObject)){ //查询的对象是班级
		
//		sql = "SELECT ct_12 ,ct_34 ,ct_56 ,ct_78 , ct_weeks FROM courser_table WHERE ct_g_mj_code = '"+code+"' ORDER BY ct_weeks";
	//FROM http://zhidao.baidu.com/link?url=9WEotrm1m3X83WLdg7EKtQOH1SC1wZsAKmOw3M0jfQzVWhrfrs6SJ2UHuE_aKvAls1jlSf_JuRCxGXKFHYglqHdWsUcQeGW7LUi1ZRt7GJG
			//这样写有一个问题：只要查询结果中的某一列有一个值为空，这一列都不会显示
		sql = 	 "SELECT  ct.ct_12 , m.c_name AS c12 ,ct.ct_34 , n.c_name AS c34 ,ct.ct_56,o.c_name AS c56 ,ct.ct_78 ,p.c_name AS c78, ct.ct_weeks "
				+"FROM courser_table AS ct INNER JOIN courser as m "
					+"ON ct.ct_12 = m.c_code INNER JOIN courser as n "
						+"ON ct.ct_34 = n.c_code INNER JOIN courser as o "
							+"ON ct.ct_56 = o.c_code INNER JOIN courser as p "
								+"ON ct.ct_78 = p.c_code  AND ct.ct_g_mj_code = '"+code+"' GROUP BY ct.ct_weeks";
	
				
		
	}else if("student".equals(searchObject)){ //查询的对象是学生
		
//		sql = "SELECT ct.ct_12 ,ct.ct_34 ,ct.ct_56 ,ct.ct_78  , ct_weeks FROM courser_table AS ct INNER JOIN students AS s ON  ct.ct_g_mj_code = "+
				//班级代码
//				"(SELECT grades.g_mj_code FROM students INNER JOIN  grades ON students.s_mj_code = grades.g_mj_code AND students.s_id =  '"+code+"') GROUP BY ct.ct_weeks";
	
		sql = 	 "SELECT  ct.ct_12 , m.c_name AS c12 ,ct.ct_34 , n.c_name AS c34 ,ct.ct_56,o.c_name AS c56 ,ct.ct_78 ,p.c_name AS c78, ct.ct_weeks "
				+"FROM courser_table AS ct INNER JOIN courser as m "
					+"ON ct.ct_12 = m.c_code INNER JOIN courser as n "
						+"ON ct.ct_34 = n.c_code INNER JOIN courser as o "
							+"ON ct.ct_56 = o.c_code INNER JOIN courser as p "
								+"ON ct.ct_78 = p.c_code  AND ct.ct_g_mj_code = "
									+"(SELECT s_mj_code FROM students WHERE s_id =  '"+code+"') GROUP BY ct.ct_weeks";
		
	}
	
	ArrayList<String[]> al = sqlQuery.reads(sql, "ct_weeks","c12" ,"c34","c56","c78");
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>课程表</title>
<script type="text/javascript">
window.onload = function(){
<% 
	for(String[] s : al){
		String weeks = s[0]; //周N
		for(int i = 1 ; i <= 4 ;i ++){
			%>
//			var n = "<%=i*2-1%>"; //第N节课
			document.getElementById("<%=weeks+(i*2-1)+""%>").innerHTML = "<%=s[i]%>";
			//周一 11 13 15 17 19
			<%
		}
	}
%>
}
</script>
<link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:16px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse; /*单元格间距*/
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
</head>

<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> 
		<%="class".equals(searchObject)?" > <a class='xh' href='../classCoursetableQuery.jsp'>课程表查询</a>":"" /*如果查询的班级课程表，说明此页面是由搜索入口进入的*/%>
		> <a class="xh" href="javascript:void(0)"><%="class".equals(searchObject)?"班级":"我的" %>课程表</a></div>
<div style="margin: 0 auto; text-align:center; padding-top:50px;p;">
<table class="gridtable" >
  <caption style="color:rgb(0, 113, 197);font-size:xx-large ;">课程表</caption>
  <tbody>
    <tr>
      <th scope="col"></th>
      <th scope="col">星期一</th>
      <th scope="col">星期二</th>
      <th scope="col">星期三</th>
      <th scope="col">星期四</th>
      <th scope="col">星期五</th>
      <th scope="col">星期六</th>
      <th scope="col">星期日</th>
    </tr>
    <tr>
      <th scope="row">第一二节</th>
      <td id="11">&nbsp;</td>
      <td id="21">&nbsp;</td>
      <td id="31">&nbsp;</td>
      <td id="41">&nbsp;</td>
      <td id="51">&nbsp;</td>
      <td id="61">&nbsp;</td>
      <td id="71">&nbsp;</td>
    </tr>
    <tr>
      <th scope="row">第三四节</th>
      <td id="13">&nbsp;</td>
      <td id="23">&nbsp;</td>
      <td id="33">&nbsp;</td>
      <td id="43">&nbsp;</td>
      <td id="53">&nbsp;</td>
      <td id="63">&nbsp;</td>
      <td id="73">&nbsp;</td>
    </tr>
    <tr>
      <th scope="row">第五六节</th>
      <td id="15">&nbsp;</td>
      <td id="25">&nbsp;</td>
      <td id="35">&nbsp;</td>
      <td id="45">&nbsp;</td>
      <td id="55">&nbsp;</td>
      <td id="65">&nbsp;</td>
      <td id="75">&nbsp;</td>
    </tr>
    <tr>
      <th scope="row">第七八节</th>
      <td id="17">&nbsp;</td>
      <td id="27">&nbsp;</td>
      <td id="37">&nbsp;</td>
      <td id="47">&nbsp;</td>
      <td id="57">&nbsp;</td>
      <td id="67">&nbsp;</td>
      <td id="77">&nbsp;</td>
    </tr>
  </tbody>
</table>
</div>
</body>
</html>
