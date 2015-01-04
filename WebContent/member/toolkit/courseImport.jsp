<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function check(){
		
		if(form.c_code.value=="" ){
			document.getElementById('c_code').innerHTML="<font color=red>课程代码不能为空</font>";
				form.c_code.focus();
				return false;
			}
		if(form.c_name.value=="" ){
		document.getElementById('c_name').innerHTML="<font color=red>课程名称不能为空</font>";
			form.c_name.focus();
			return false;
		}
	
		if(form.c_period.value=="" ){
			document.getElementById('c_period').innerHTML="<font color=red>课时不能为空</font>";
				form.c_period.focus();
				return false;
			}
		}
	</script>
<style>
 .input{
 font-size:14px;
    margin-top:0px;
      height:25px;
      width:300px;
      margin-top:5px;
      margin-bottom:5px  
     }

  .input1{
    height:40px;
    width:60px;
   
}
</style>
<link rel="stylesheet" type="text/css" href="../../css/JWM.css"/>
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程信息录入</a></div>

<form action="s/courseImportInsert.jsp" name="form" id="form"  onSubmit="return check()">
<table style="text-align:center">
<tr><td>课程代码</td><td><input class="input" name="c_code" type="text"></td></tr>
<tr><td colspan="2"><div class="div" id="c_code"></div></td></tr>
<tr><td>课程名称</td><td><input class="input" name="c_name" type="text"></td></tr>
<tr><td colspan="2"><div class="div" id="c_name"></div></td></tr>
<tr><td>每周课时</td><td><input class="input" name="c_period" type="text"></td></tr>
<tr><td colspan="2"><div class="div" id="c_period"></div></td></tr>
 <tr><td colspan="2"><input style="margin-right:50px;margin-left:100px;"  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>

</body>
</html>