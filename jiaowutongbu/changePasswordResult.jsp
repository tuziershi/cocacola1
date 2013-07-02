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
		String password   = request.getParameter("name");
		String password2  = request.getParameter("password1");
		String ID         = (String)session.getAttribute("ID");

		String spath = "F:\\leilei3\\webapps\\jiaowutongbu\\data\\test.mdb";//Access 数据库路径
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
		Statement stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        // ****   数据库连接代码　结束 ******
		out.print("  connect success! !  ");
	//String pword = mysql.query("select password from username where loginName = '"+ID+"';");
		ResultSet rs = stmt.executeQuery("select name1,password1 from username where name1 = '"+ID+"';");
		
		if(rs!=null)
			out.print("  execute success!! ");
		while(rs.next())
		{
			String pwd=rs.getString("password1");
			out.print("    into while    ");
			out.print(password+"   "+password2+"   "+ID+"   "+pwd);
			if(rs!=null  && pwd.equals(password))
			{
				out.print("密码正确");
				stmt2.executeUpdate("update username set password1='"+password2+"'"+"  where  name1 = '"+ID+"';");
				out.print("密码正确");
				 if(rs!=null)
					session.setAttribute("password","right");
				 else
					session.setAttribute("password","error");
			}
			else
			{
				session.setAttribute("password","error");
			}
			response.sendRedirect("login.jsp");
		}
		rs.close();                                    //关闭记录集对象
		stmt.close(); 
		 //rs2.close();                                    //关闭记录集对象
		stmt2.close(); 
		conn.close(); 


%>