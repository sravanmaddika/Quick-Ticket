<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %> 
  <%@ page import="theatre.TheatreData" %>
  <%@ page import="theatre.Thnmloc" %>
<!DOCTYPE html>
<html>
<head>
<style>
.body1{background-color:#E6E6FA;}
.text1
{
   float:left;
   width:65%;
}

.text2
{
   float:left;
   width:30%;
   margin-left:50px
  
}
#grad2 {
    
    background-color:#4a148c;
}

</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Manmarziyaan</title>
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
	  <button class="btn btn-info btn-lg"><a href="latest.jsp"  style="color: white" >Latest Movies</a></button>
	  <button class="btn btn-info btn-lg"><a href="upcoming.jsp" style="color: white">Upcoming Movies</a></button>

	 
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
  </div>
</nav>

<div class=text2>
<img src="manmarziyaan.jpg" height="500" width="300"></img>
</div>


</div>

</div>

    <%
	ArrayList<TheatreData> al=(ArrayList)session.getAttribute("tl");
    ArrayList<Thnmloc> at=(ArrayList)session.getAttribute("tl1");    	
    ArrayList<String> theatre=new ArrayList();
    ArrayList<String> location=new ArrayList();
	%>
	<%
String login=(String)session.getAttribute("login");

if(login==null)
	{
	   response.sendRedirect("Login.jsp");
	}

else
{
	Cookie email_ck=new Cookie("email_ck",login);
	response.addCookie(email_ck);
}	
	%>

<form action="BookServlet" method="post">
<table>
	<% 
		for(int k=0;k<at.size();k++)
		{
			String t=at.get(k).getName();
			request.setAttribute("t",t);
			String loc=at.get(k).getLocation();
			request.setAttribute("l",loc);
	%>	
		<tr>
			<td>
				<%= at.get(k).getName() %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%theatre.add(at.get(k).getName()); %>
			</td>
			
			<td>
				<%= at.get(k).getLocation() %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%location.add(at.get(k).getLocation()); %>
			</td>
			<td>
			<input type="radio" name="index" value=<%=k %> required><br>
			</td>
				<%
					for(int j=0;j<al.size();j++)
					{
						if(at.get(k).getLocation().equals(al.get(j).getLocation()) && at.get(k).getName().equals(al.get(j).getName()))
						{		
				%>
							<td>
								<input type="submit" name="showtime" value=<%=al.get(j).getTime() %>>&nbsp;&nbsp;
							</td>
						<%
						}
					}	
						%>					
		</tr>
		<%
		}
		session.setAttribute("theatre",theatre);
		session.setAttribute("location",location);
		
		%>
		</table>
		</form>
		</div>
				</form>
				<div class=text1>
<p align="center">
<br>
<h3>SYNOPSIS</h3>
<h4><aside>Manmarziyaan - Rummi (Pannu) is a free-spirited young woman. She lives with her extended family in Punjab state, doing her best to be a good daughter. But youthful desires have led her to Vicky (Kaushal). With his impulsive nature and shock of dyed-blue hair, he's the excitement she wants right now. How long can they keep their trysts secret from her family?
</h4><br><br>
Genre:ROMANCE|DRAMA
</aside></p>
</body>
</html>