<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %> 
  	<%@ page import="theatre.TheatreData" %>
  	<%@ page import="theatre.Thnmloc" %>
<!DOCTYPE html>
<html>
<style>

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
.body1{background-color:#E6E6FA;}
</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Johny English 3</title>
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
<img src="JE.jpg" height="500" width="300"></img>
</div>

   </div>

    <%
    String show_date=null;
    Cookie cookies[]=request.getCookies();
	for(Cookie c: cookies)
	{
		
		if(c.getName().equals("datec"))
		{
			show_date=c.getValue();
		}
	}
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
				<%= at.get(k).getLocation() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
						if(al.get(j).getShow_date().equals(show_date))
						{
			%>			
						<td>
							<input type="submit" name="showtime" value=<%=al.get(j).getTime() %>>&nbsp;&nbsp;
						</td>
					<%
						}
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
<h4><aside>Johny English 3 - JOHNNY ENGLISH STRIKES AGAIN is the third installment of the Johnny English comedy series, with Rowan Atkinson returning as the much loved accidental secret agent. The new adventure begins when a cyber-attack reveals the identity of all active undercover agents in Britain, leaving Johnny English as the Secret Service's last hope. Called out of retirement, English dives head first into action with the mission to find the mastermind hacker. As a man with few skills and analog methods, Johnny English must overcome the challenges of modern technology to make this mission a success.
</h4><br><br>
Genre:COMEDY|ACTION|
</aside></p>
        
</body>
</html>