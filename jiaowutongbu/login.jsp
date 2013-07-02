<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	response.addHeader("cache-control", "no-cache");
	response.addHeader("pragma", "no-cache");
	response.setDateHeader( "Expires ",   0);   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   
<style type="text/css">
.ziti {
	font-size: 14px;
	font-style: normal;
	font-weight: bolder;
}
.error {
	color: #900;
}
.STYLE1 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 36px;
}
.STYLE4 {font-family: Geneva, Arial, Helvetica, sans-serif; font-size: 24px; }
</style>
</head>
<body background="image/background.jpg" >
<div align="right">
  <img height="144" width="224" src="image/logo1.jpg"/><script language="JavaScript"> 

</script> 
<br /> 
  <br />
  <br />
</div>

<center>
<table width="398" bgcolor="#00FFCC" height="428">
<tr align="center" bgcolor="#000000">
<td width="342" bgcolor="#C0C0C0">
<form name="form1" id="myForm" action="login1.jsp"  method="get">  
<p align="center"><img src="image/jiaowuguanlixitong.PNG" /></p>
  <p><br />
      <span class="STYLE4">用户名：</span>
    <input name="name" type="text" class="STYLE4" size="23"/>
    <br /> 
    <br />
    <span class="STYLE4">密码：</span>    
      <input name="password" type="password" class="STYLE4" id="password" size="23" maxlength="12"/>
      <br />  
    <br />
      <select  name="type" class="STYLE4">
        <option value="student">学生</option>
        <option value="teacher">教师</option>
        <option value="admin">管理员</option>
        <option value="qita">其他</option>
        </select>
  &nbsp;&nbsp;<br />
    <br />
    <input type="button" class="STYLE4" onclick="Mysubmit()" value="登陆"/>

  &nbsp; &nbsp;<input type="reset" class="STYLE4" value="取消"/></p>
</form></td>
</tr>

  <% 
	
	String error = (String)session.getAttribute("error");
	if(error!=null && error.equals("yes"))
	{
		out.write("<p class="+"error"+" >登录失败</p>");
	}
	session.setAttribute("error","no");
%>
</table>
</center>
  <script type="text/javascript">

function Mysubmit()
{
       var x=document.getElementById("myForm");
      
       if(x.elements[2].value != "student")
       {	
	  		alert("暂时不支持该类型的登录");
			return;
		}
		//alert("暂时不支持该类型的登录");
       x.action= x.action+"?random="+Math.random();
       x.submit();
}

</script>
</body>
</html>