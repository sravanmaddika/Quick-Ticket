<%@page import="java.sql.*"%>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
PreparedStatement pr=con.prepareStatement("insert into payments values(?,?,?,?,?)");
		pr.setString(1,request.getParameter("tid"));
		pr.setString(2,request.getParameter("cnumber"));
		pr.setString(3,request.getParameter("cvv"));
		pr.setString(4,request.getParameter("tamount"));
                pr.setString(5,request.getParameter("cname"));
                pr.executeUpdate();
                response.sendRedirect("home.jsp");
		

%>