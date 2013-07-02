<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="main.*" %>
<%@ page import="java.sql.*" %>
<%
	response.setHeader("cache-control", "no-cache");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", -10);
%>
<%  
	String name      = request.getParameter("name");
	String password  = request.getParameter("password");
	String type      = request.getParameter("type");

        //以下几项请自行修改
        String spath = "F:\\leilei3\\webapps\\jiaowutongbu\\data\\test.mdb";//Access 数据库路径
        String dbname = "";        //Acvess 数据库用户名，没有则为空
        String user = "";        //Access 数据库密码，没有则为空
//数据库连接字符串 
         
		//out.print(url);
        //加载驱动程序
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        //建立连接
        String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+"F:\\leilei3\\webapps\\jiaowutongbu\\data\\test.mdb";
        
        Connection conn= DriverManager.getConnection(url); 
        //创建语句对象
        Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        // ****   数据库连接代码　结束 ******
		out.print("数据库连接成功");
	ResultSet rs = stmt.executeQuery("select password1 from username where name1 = '"+name+"'");
	while(rs.next())
	{
		String pwd=rs.getString("password1");
		if(rs!=null  && pwd.equals(password))
		{
			if(type.equals("student"))
			{
				session.setAttribute("login","yes");
				session.setAttribute("password",password);
				session.setAttribute("ID",name);
				response.sendRedirect("homepage.jsp");
			}
		}
		else
		{
			session.setAttribute("error","yes");
			response.sendRedirect("login.jsp");
		}
	}
	rs.close();                                    //关闭记录集对象
    stmt.close(); 
	conn.close(); 

%>
