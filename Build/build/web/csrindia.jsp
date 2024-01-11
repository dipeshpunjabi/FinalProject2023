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
      <h1><a href="index.jsp">Corporate Social Responsibility Portal</a></h1>
      <p>CSR Portal</p>
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
          <li><a href="index.jsp">Home</a></li>           
          <li><a href="csrresources.jsp">CSR Resources</a></li>
          <li class="active"><a href="csrindia.jsp">CSR in India</a></li>
          <li><a href="csrprofile.jsp">Companies CSR Profile</a></li>
          <li><a href="csrfoundation.jsp">CSR Foundations</a></li>
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
      <h1 style='font-weight: bold; color: red;'>CSR in India</h1>
      
      <p>CSR Portal is India's largest CSR data and CSR partnerships platform. The platform provides information about CSR in India, CSR projects in India, CSR fund distribution in India along with details of CSR implementation partners, CSR services providers and CSR related products suppliers. Users can filter and find data on top CSR projects, top companies with CSR fund and CSR foundations in India. All highlighted projects are on the basis of companies CSR reporting year 2016-2017.</p>
                
      <h1>Theme wise CSR</h1>
                    
        <%                        
            ResultSet rs = null;

            try
            {
                    int g = 1;

                     out.println("<table border='2px' width='100%'>");
                    
                     String sql = " SELECT CSRIndiaId, Title, Category, Recorded_Date "
                             + " FROM csrindiadetails "
                             + " WHERE Category = 'Theme wise CSR'";

                     rs = DatabaseFile.getInstance().codeselect(sql);

                    while(rs.next())
                    {
                         out.println("<tr>"
                                 + "<td>" + g++ + "</td>"
                                 + "<td>" + rs.getString("Title") + "</td>"
                                 + "</tr>");
                    }

                    if(rs != null)
                    {
                         rs.close();
                         rs = null;
                    }

                     out.println("</table>");
            }
            catch(Exception e)
            {
                  e.printStackTrace();                                         			
            }
            finally
            {
                if(rs != null)
                {
                    rs.close();
                }
            }    
        %>
        
        <h1>Sector wise CSR</h1>
                    
        <%                        
            ResultSet rs1 = null;

            try
            {
                    int g = 1;

                     out.println("<table border='2px' width='100%'>");
                    
                     String sql = " SELECT CSRIndiaId, Title, Category, Recorded_Date "
                             + " FROM csrindiadetails "
                             + " WHERE Category = 'Sector wise CSR'";

                     rs1 = DatabaseFile.getInstance().codeselect(sql);

                    while(rs1.next())
                    {
                         out.println("<tr>"
                                 + "<td>" + g++ + "</td>"
                                 + "<td>" + rs1.getString("Title") + "</td>"
                                 + "</tr>");
                    }

                    if(rs1 != null)
                    {
                         rs1.close();
                         rs1 = null;
                    }

                     out.println("</table>");
            }
            catch(Exception e)
            {
                  e.printStackTrace();                                         			
            }
            finally
            {
                if(rs1 != null)
                {
                    rs1.close();
                }
            }    
        %>
        
        <h1>Geography wise CSR</h1>
                    
        <%                        
            ResultSet rs2 = null;

            try
            {
                    int g = 1;

                     out.println("<table border='2px'  width='100%'>");
                    
                     String sql = " SELECT CSRIndiaId, Title, Category, Recorded_Date "
                             + " FROM csrindiadetails "
                             + " WHERE Category = 'Geography wise CSR'";

                     rs2 = DatabaseFile.getInstance().codeselect(sql);

                    while(rs2.next())
                    {
                         out.println("<tr>"
                                 + "<td>" + g++ + "</td>"
                                 + "<td>" + rs2.getString("Title") + "</td>"
                                 + "</tr>");
                    }

                    if(rs2 != null)
                    {
                         rs2.close();
                         rs2 = null;
                    }

                     out.println("</table>");
            }
            catch(Exception e)
            {
                  e.printStackTrace();                                         			
            }
            finally
            {
                if(rs2 != null)
                {
                    rs2.close();
                }
            }    
        %>
        
        <h1>Implementing Agencies</h1>
                    
        <%                        
            ResultSet rs3 = null;

            try
            {
                    int g = 1;

                     out.println("<table border='2px' width='100%'>");
                    
                     String sql = " SELECT CSRIndiaId, Title, Category, Recorded_Date "
                             + " FROM csrindiadetails "
                             + " WHERE Category = 'Implementing Agencies'";

                     rs3 = DatabaseFile.getInstance().codeselect(sql);

                    while(rs3.next())
                    {
                         out.println("<tr>"
                                 + "<td>" + g++ + "</td>"
                                 + "<td>" + rs3.getString("Title") + "</td>"
                                 + "</tr>");
                    }

                    if(rs2 != null)
                    {
                         rs3.close();
                         rs3 = null;
                    }

                     out.println("</table>");
            }
            catch(Exception e)
            {
                  e.printStackTrace();                                         			
            }
            finally
            {
                if(rs3 != null)
                {
                    rs3.close();
                }
            }    
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
