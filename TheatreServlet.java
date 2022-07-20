package theatre;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class TheatreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		HttpSession session=request.getSession();
		PreparedStatement pr=null;
		String date=request.getParameter("dateselect");  
                Cookie datec=new Cookie("datec",date);
		response.addCookie(datec);
		try
		{
			ArrayList<TheatreData> al=new ArrayList<TheatreData>();
			ArrayList<Thnmloc> at=new ArrayList<Thnmloc>();
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
			st=con.createStatement();
                         
				Cookie ck1=new Cookie("ck1",request.getParameter("a"));
				response.addCookie(ck1);
				rs=st.executeQuery("Select th_name,location,sh_time,sh_date from shows where movie_name='"+request.getParameter("a")+"'");			
				while(rs.next())
				{       
					al.add(new TheatreData(rs.getString(4),rs.getString(3),rs.getString(1),rs.getString(2)));		
				}
				rs1=st.executeQuery("select th_name,location  from movie_list where movie_name='"+request.getParameter("a")+"'");
				while(rs1.next())
				{
					at.add(new Thnmloc(rs1.getString(1),rs1.getString(2)));
				}
				session.setAttribute("tl1",at);
				session.setAttribute("tl",al);
				response.sendRedirect("batti.jsp?"+request.getParameter("a"));
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
