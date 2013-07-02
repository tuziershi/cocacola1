<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control", "no-cache");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader( "Expires ",   0);   

	String login = (String)session.getAttribute("login");
	if(login==null || !login.equals("yes"))
	{
		response.sendRedirect("login.jsp");

		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   
<title>教务同步</title>
</head>
<body background="image/get.jpg">
<script language="JavaScript">  
 
javascript:window.history.forward(1);   

</script>  
<center>
<table width="100%" border="0">
  <tr>
    <td height="51" colspan="2" align="center"><h1><img src="image/jiaowuguanlixitong.PNG" " /></h1></td>
  </tr>
    <td height="16"><font size = 6><b><%
    
    String name = (String)session.getAttribute("name");
    out.write(name);
    				    
     				%></b></font><img src="image/huanyingdenglu.PNG" />
  </td>
  <tr>
    <td colspan="2" align="left"></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><table width="100%" border="2">
      <tr>
        <td width="10%">&nbsp;</td>
        <td width="12%" ><a href="homepage.jsp"><img src="image/fanhuishouye.PNG"/></a></td>
        <td width="10%">&nbsp;</td>
        <td width="12%" ><a href="changePassword.jsp"><img src="image/xiugaimima.PNG" /></a></td>
        <td width="10%">&nbsp;</td>
        <td width="10%"><a href="return.jsp"><img src="image/fanhuidenglujiemian.PNG" width="151" height="41"/></a></td>
        <td width="10%">&nbsp;</td>
         <td width="12%" ><a href="changeInformation.jsp"><img src="image/xiugaigerenxinxi.PNG" width="170" height="38"/></a></td>
        <td width="10%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="222" height="148" align="center"><table width="253" border="0" height="149">
      <tr>
        <td height="36" align="center" bgcolor="#00FFFF"><strong><img src="image/fenzu.PNG" width="157" height="31"/></strong></td>
      </tr>
      <tr>
        <td height="30" align="center"><a href="teacher.jsp"><img src="image/jiaoshizu.PNG" width="147" height="43"/></a></td>
      </tr>
      <tr>
        <td height="33" align="center"><a href="showtaolunzu.jsp"><img src="image/taolunzu.PNG" width="148" height="43"/></a></td>
      </tr>
      <tr>
        <td height="23" align="center">&nbsp;</td>
      </tr>
    </table></td>
    <td width="861" rowspan="2" align="center">
  <center>
<table border="1" height="180" width="220">
<form name="form1" id="myForm" action="changePasswordResult.jsp" method="post"> 
	<tr align="center">
		<td width="110">旧密码</td>
		<td width="110">
		  <input type="password" name="name"  size="15"/>
		</td>
	</tr>
	<tr align="center">
	  <td width="110">新密码</td>
	  <td width="110"><input type="password" name="password1" size="15" /></td>
	</tr>
	<tr align="center">
	  <td width="110">重新输入新密码</td>
	  <td width="100"><input type="password" name="password2"  size="15"/></td>
	</tr>
	<tr>
	  <td width="110" align="center"><input type="button" value="确定" 
	onclick="Mysubmit()"/></td>
	  <td width="110" align="center"><input type="reset" value="重置"/></td>
	</tr>
</form>
</table>
</center>
  </tr>

  <tr>
    <td height="137" align="center"><table width="261" border="0">
      <tr>
        <td height="36" align="center" bgcolor="#00FFFF"><strong><img src="image/fenren.PNG" /></strong></td>
      </tr>
      <tr>
         <td height="33" align="center"><a href="showguanzhuzhe.jsp"><img src="image/guanzhuzhe.PNG" width="130" height="43"/></a></td>
      </tr>
      <tr>
        <td height="29" align="center"><a href="showfensi.jsp"><img src="image/fensi.PNG" width="127" height="52"/></a></td>
      </tr>
       <tr>
        <td height="23" align="center">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="44" colspan="2" align="center"><img src="image/jiaowuguanlixitong.PNG" width="106" height="23"/></td>
  </tr>
</table>
</center>
<script type="text/javascript">

function Mysubmit()
{
       var x=document.getElementById("myForm");

      
 	   if(x.elements[1].value != x.elements[2].value)
       {	
	  		alert("密码错误，请重新输入");
		  	x.elements[0].value = "";
      			x.elements[1].value = "";
       			x.elements[2].value = "";
			return;
	   }
      
       x.submit();
}



</script>
</body>
</html>