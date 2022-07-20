<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">


<head>
<style>


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
	<title>TixFlix-Find exciting offers on all the latest movies</title>
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
	  <button class="btn btn-info btn-lg"><a href="latest.jsp"  style="color: white" >Book a Show</a></button>
	  <button class="btn btn-info btn-lg"><a href="upcoming.jsp" style="color: white">View Movies</a></button>
	  <button class="btn btn-info btn-lg"><a href="mybookings.jsp" style="color: white">My Bookings</a></button>
		
          <% 
	 
	  %>
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
		  <li><a href="Register.jsp"><span class="glyphicon glyphicon-user" > Sign-up</a></span></li>
	  	  <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"> Login</a></span></li>
	  	  </ul>
	  	  <% 
	  }
	 
	  %>
	    </div>
  </div>
</nav>


<div class="container">
  <table border="1" align="center"  width="750" cellpadding="6">
            
        
        <tr bgcolor="#00CCFF" > 
             <td  align="center" ><font color="#000000"><B>Ticket Number</B></font></td>
          
        <td align="center" ><font color="#000000"><B>Theatre Name</B></font></td>
		 
		    <td  align="center" ><font color="#000000"><B>Screen No.</B></font></td>
					  <td  align="center" ><font color="#000000"><B>seat_no</B></font></td>
					  <td  align="center" ><font color="#000000"><B>price</B></font></td>
					   <td  align="center" ><font color="#000000"><B>Booking_date/Time</B></font></td>
	<%
 //String a=(String)session.getAttribute("userid");
       String unam=null,dob=null,gender=null,address=null,mobile=null,email=null;
  
PreparedStatement ps = null;
	ResultSet rs = null;
	Connection con=null;

	
	try
	{
              
		Class.forName("com.mysql.jdbc.Driver");	
	       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb","root","root");
		//Connection con = databasecon.getconnection();

		ps = con.prepareStatement("select * from tickets where email='"+l+"'");
		rs = ps.executeQuery();
                String idd=null;
                while(rs.next())
               {
                       
                         idd=rs.getString(9);
                         unam=rs.getString(2);
                         dob=rs.getString(5);
                         gender=rs.getString(6);
                         email=rs.getString(7);
                         mobile=rs.getString(3)+"@"+rs.getString(4);
                     
                      

%>
 
        <tr bgcolor="#CCCCCC"> 
		<td align="center">
           <%=idd%>
          </td>
		  
		<td align="center">
           <%=unam%>
          </td>
		  
          <td align="center">
           <%=dob%>
          </td>
		  
		<td align="center">
           <%=gender%>
          </td>
		<td align="center">
          $ <%=email%>
          </td>
		<td align="center">
           <%=mobile%>
          </td>  
		
	
        </tr>
 
      

      	
    </tr>
<%
	   }
	 
	 }
	   catch(Exception e2)
	   {
	     out.println(e2.getMessage());
	   }
	   
	    
%>
</table> 


<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

     

</div>
<br>
<div class="col-md-12" style="background-color:#4a148c">
<div class="footer">
  <h6><a href="#">About us</a></h6>
  <h6><a href="#">Privacy Policy</a></h6>
  <h6><a href="#">Purchase Policy</a></h6>
</div>
</div>
</body>
</html>