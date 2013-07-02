<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="main.*" %>
<%@ page import="java.sql.*" %>
<%
 	response.setHeader("cache-control", "no-cache");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", -10);
	
	String login = (String)session.getAttribute("login");
	if(login==null || !login.equals("yes"))
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
%>

<%  
		String npassword  = request.getParameter("npassword");
		String nxueyuan  = request.getParameter("nxueyuan");
		String nxuehao  = request.getParameter("nxuehao");
		String nemail  = request.getParameter("nemail");
		String ID         = (String)session.getAttribute("ID");

		String spath =  "F:\\tuzi\\webapps\\jiaowutongbu\\data\\test.mdb";//Access 数据库路径
        String dbname = "";        //Acvess 数据库用户名，没有则为空
        String user = "";        //Access 数据库密码，没有则为空
//数据库连接字符串 
        String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+spath; 
		//out.print(url);
        //加载驱动程序
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        //建立连接
		out.print(url);out.println();
        Connection conn= DriverManager.getConnection(url); 
        //创建语句对象
        Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        // ****   数据库连接代码　结束 ******
		stmt.executeUpdate("update username set "+" password1='"+npassword+"'"+",xueyuan='"+nxueyuan+"'"+", xuehao='"+nxuehao+"'"+", email='"+nemail+"'"+"  where  name1= '"+ID+"';");
		response.sendRedirect("login.jsp");
	
		stmt.close(); 
		conn.close(); 


%>