<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<meta charset="ISO-8859-1">
<title>Delete Shows</title>

<title>Insert title here</title>
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
	  <button class="btn btn-info btn-lg"><a href="addmovies.jsp"  style="color: white" >Add Movie</a></button>
	  <button class="btn btn-info btn-lg"><a href="addshows.jsp" style="color: white">Add Shows</a></button>
	  
	  <button class="btn btn-info btn-lg"><a href="updateshow.jsp"  style="color: white" >Update shows</a></button>

	<% 
	 if(!l.contains(".com"))
	  {
		  %> <button class="btn btn-info btn-lg"><a href="adminhome.jsp" style="color: white">Admin Home</a></button> <% 
	  }
	  %>
	 
	  <%if(l!=null)
	  {
		  %>
	  	<div align=right><a href="Logout.jsp" style="color:white">Logout</a></div>
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
  
</nav>
</div>
<center>
	<form action="DeleteServlet" method="post">
		<table height="350">
                     <h2 align="center">Delete Show Information</h2> 
                   
			<tr>
				<td>
					Movie Name
				</td>
				<td>	
                                    <select name="mname" style="width: 200px;">
                                        <option>**** Choose Movie****</option>
                                        
                                        <%Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
			System.out.println("After Connection");
			PreparedStatement pr=con.prepareStatement("select movie_name from movie_list");
                        ResultSet result=pr.executeQuery();
                        while(result.next()){
			%>
                        <option value="<%=result.getString(1)%>"><%=result.getString(1)%></option>               
                          <%}%>              
                                        
                                    </select>
				</td>
			</tr>
			<tr>		
				<td>
					Show Date
				</td>
				<td>		
					<input type="date" name="sdate" style="width: 200px;"/>
				</td>
			</tr>
			<tr>
				<td>		
					Show Time
				</td>	
				<td>
					<input type="time" name="stime" style="width: 200px;"/>
				</td>
			</tr>
			<tr>
				<td>
					Theatre Name
				</td>
				<td>
					<select name="tname" style="width: 200px;">
                                        <option>**** Choose Theatre****</option>
                                     <%PreparedStatement pr1=con.prepareStatement("select th_name from theatre_list");
                        ResultSet result1=pr1.executeQuery();
                        while(result1.next()){
			%>
                        <option value="<%=result1.getString(1)%>"><%=result1.getString(1)%></option>               
                          <%}%>              
                                        
                                    </select>
				</td>
			</tr>
			<tr>
				<td>
					Location
				</td>
				<td>
					<select name="location" style="width: 200px;">
                                        <option>**** Choose Location****</option>
                                     <%PreparedStatement pr11=con.prepareStatement("select location from theatre_list");
                        ResultSet result11=pr11.executeQuery();
                        while(result11.next()){
			%>
                        <option value="<%=result11.getString(1)%>"><%=result11.getString(1)%></option>               
                          <%}%>              
                                        
                                    </select>
				</td>
			</tr>
			<tr>
				<td>
					Screen No
				</td>
				<td>
                                    <select name="sno" style="width: 200px;">
                                        <option>1</option>
                                         <option>2</option> <option>3</option>
                                          <option>4</option>
                                           <option>5</option>
                                            <option>6</option>
                                             <option>7</option>
                                              <option>8</option>
                                         
                                    </select>
				</td>
			</tr>
		</table>
		<input type="submit"/>	
	</form>
</center>
</body>
</html>