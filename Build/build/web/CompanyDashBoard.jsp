<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>CSR Portal</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<%@page errorPage="ErrorPage.jsp"%>
</head>
<body id="top">
<div class="wrapper row1">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="mgnt.jsp">Corporate Social Responsibility Portal</a></h1>
      <p>CSR Portal
        <span style="padding-left: 650px; color: red;"> Welcome : <%=session.getAttribute("x")%></span>
      </p>
    </div>
    <div class="fl_right">
      <ul> </ul>
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row2">
  <div class="rnd">
    <!-- ###### -->
    <div id="topnav">
      <ul>
          <li class="active"><a href="CompanyDashBoard.jsp">Dashboard</a></li>           
          <li><a href="CompanyProfile.jsp">Profile</a></li>
          <li><a href="CompanySignout.jsp">Sign Out</a></li>
      </ul>
    </div>
    <!-- ###### -->
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <h1>Company Dashboard Page</h1>
       
       <%                  
	ResultSet rs5 = null;
        out.println("<table border='2px' align='center'>");
        out.println("<tr style='text-align: center; font-weight: bold; color: red;'>");

	try
	{
			 String sql = "SELECT COUNT(*) AS c "
                                    +" FROM projectdetails AS n "
                                    +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                    +" WHERE n.CorporateId = '"+session.getAttribute("UID").toString()+"'";

			 rs5 = DatabaseFile.getInstance().codeselect(sql);

			 while(rs5.next())
			 {
                               
                                out.println("<td>");
				out.println("<h1 style='font-weight: bold; color: green;'>"+ rs5.getInt("c") +"</h1>");
				out.println("<h1 style='font-weight: bold; color: red;'>CSR Projects</h1>");
                                out.println("</td>");
                                
			 }    
                         
                         String sql1 = "SELECT COUNT(*) AS c "
                                    +" FROM ngodetails AS n "
                                    +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                    +" WHERE n.CorporateId = '"+session.getAttribute("UID").toString()+"'";
                         
                         rs5 = DatabaseFile.getInstance().codeselect(sql1);


			 while(rs5.next())
			 {                               
                                out.println("<td>");
				out.println("<h1 style='font-weight: bold; color: green;'>"+ rs5.getInt("c") +"</h1>");
				out.println("<h1 style='font-weight: bold; color: red;'>validated NGO's</h1>");
                                out.println("</td>");
                                
			 }    
                         
                          String sql2 = "SELECT COUNT(*) AS c "
                                     +" FROM companydetails AS n "                                    
                                     +" WHERE n.CorporateId = '"+session.getAttribute("UID").toString()+"'";
                          
                          rs5 = DatabaseFile.getInstance().codeselect(sql2);

			 while(rs5.next())
			 {                               
                                out.println("<td>");
				out.println("<h1 style='font-weight: bold; color: green;'>"+ rs5.getInt("c") +"</h1>");
				out.println("<h1 style='font-weight: bold; color: red;'>Companies CSR Profile</h1>");
                                out.println("</td>");
                                
			 }  
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		  if(rs5 != null)
		  {
			 rs5.close();
		  }
	}

        out.println("</tr>");
        out.println("</table>");
	%>   
         
      <%
      //getting response
      
      out.println("<font color = 'red' >");
      
      try
      {
          if( (request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals(""))) )
          {
              out.println(request.getParameter("msg"));
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      out.println("<font>");
      %>   
      
    </div>
    
  </div>
    
 </div>
    
</body>
    
</html>
