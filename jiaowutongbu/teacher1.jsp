<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ page import="java.sql.*" %>
<%
 	response.setHeader("cache-control", "no-cache");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", -10);
	String search      = request.getParameter("name");
	String login = (String)session.getAttribute("login");
	if(login==null || !login.equals("yes"))
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	String ID         = (String)session.getAttribute("name");
	

	String spath =  "F:\\leilei3\\webapps\\jiaowutongbu\\data\\test.mdb";
	String dbpath =System.getProperty("user.dir")+spath;
	String dbname = "";  
	String user = "";   
String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+spath; 

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	Connection conn= DriverManager.getConnection(url); 

	Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	 ResultSet rs = stmt.executeQuery("select * from teacher where mainwords like '%"+search+"%'");
	String[] name1=new String[50];
	String[] zhuanye=new String[50];
	String[] mainwords=new String[50];
	int i=0;
	while(rs.next())
	{
		name1[i] =rs.getString ("name1");
		zhuanye[i] = rs.getString("zhuanye");
		mainwords[i] = rs.getString("mainwords");
		i++;
	}
rs.close();                         
stmt.close(); 
conn.close(); 
	
	
	
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
<body background="image/back1.jpg">
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
<td width="864" rowspan="2" align="center"><table width="100%" border="0">
      <tr bgcolor="#CCCCCC">
        <td height="28" colspan="8">您好，共有<%out.write(Integer.toString(i));%>条搜索结果</td>
      </tr>
      <tr >
        <td height="215" colspan="8"><table width="100%" border="0">
          <tr bgcolor="#00FFFF">
            <td width="18%">教师：</td>
            <td width="38%">专业：</td>
            <td width="44%" height="30">关键字</td>
          </tr>
		  <%
			  int j=0;
			  for(j=0;j<i;j++)
			  {
					out.write("<tr bgcolor=\"#CCCCCC\"><td>");
					out.write(name1[j]);
					out.write("</td><td>");
					out.write(zhuanye[j]);
					out.write("</td><td>");
					out.write(mainwords[j]);
					out.write("</td></tr>");
			  }
		  
		  
		  %>
          
          
        </table></td>
        </tr>
    </table></td>
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

</body>
</html>