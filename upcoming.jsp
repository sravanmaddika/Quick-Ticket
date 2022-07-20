<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<head>
<style>
.body1{background-color:#E6E6FA;}

#grad2 {
    
    background-color:#4a148c;
}

</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Upcoming movies</title>
</head>
<body class="body1">


<div>
</div>
<div id="grad2">
<nav class="navbar navbar-light">  <div class="container-fluid">
  	
      
	<font style="font-family:Algerian;"><h1><b><a href="home.jsp" style="color: white">MOVIE TICKETING SYSTEM</a></b></h1></font>
	<h4 style="color:white;" >
	<%String l=(String)session.getAttribute("login");
		if(l!=null)
		{	
			out.print("Welcome "+l);
		}
		session.setAttribute("flag","0");
	%>
	</h4>
	<br>
	  <button class="btn btn-info btn-lg"><a href="home.jsp" class="active"  style="color: white">Home</a></button>
	  <button class="btn btn-info btn-lg"><a href="upcoming.jsp" style="color: white">View Movies</a></button>

	 
	  <%if(l!=null)
	  {
		  if(!l.contains(".com"))
		  {
			  %> <button class="btn btn-info btn-lg"><a href="adminhome.jsp" style="color: white">Admin Home</a></button> <% 
		  }
		  %>
	  	<div align=right><a href="Logout.jsp" style="color: white">Logout</a></div>
	  	<%
	  } 
	  else
	  {
		  %>
		  <ul class="nav navbar-nav navbar-right">
		  <li><a href="Register.jsp"><span class="glyphicon glyphicon-user"> Sign-up</a></span></li>
	  	  <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"> Login</a></span></li>
	  	  </ul>
	  	  <% 
	  }
	  %>
	    </div>
  </div>
</nav>
<font style="font-family:Times New Roman;"><h1><center>List of Available Movies</center></h1></font>
<form  method="post">
  <table WIDTH="900" ALIGN="CENTER" BORDER="1">
     <tbody >
         
      
        <%       Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
		System.out.println("select * from movie_list where release_date='"+request.getParameter("dateselect")+"'");
			PreparedStatement pr=con.prepareStatement("select * from movie_list");
                        ResultSet result=pr.executeQuery();
                while(result.next()){%>  <tr>
                        <td><center><img src="getImage.jsp?id=<%=result.getString("movie_name")%>" height="300" width="300"></img></td>
                        <td><b>MOVIE NAME:</b> <%=result.getString("movie_name")%><br>
                        <b>RELEASED DATE:</b> <%=result.getString("release_date")%><br>
                        <b>GENRE:</b> <%=result.getString("genre")%><br>
                        <b>DESCRIPTION:</b> <%=result.getString("description")%><br>
                        </td>
                        
     <%}%>

      </tr>
     
    </tbody>
    </table>
</form>

<div class="col-md-12" style="background-color:#4a148c">
<div class="footer">
  <h6><a href="#">About us</a></h6>
  <h6><a href="#">Privacy Policy</a></h6>
  <h6><a href="#">Purchase Policy</a></h6>
</div>
</div>
</body>
</html>
