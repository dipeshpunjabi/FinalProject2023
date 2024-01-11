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
          <li><a href="csrindia.jsp">CSR in India</a></li>
          <li class="active"><a href="csrprofile.jsp">Companies CSR Profile</a></li>
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
      <h1>Companies CSR Profile Page</h1>
      
      <form action="codecsrprofile.jsp" method="post">
          
        <table align="center" border="0px" width="100px">

            <tr style="color: red;">
                <td>Search:</td><td><input type="text" name="search" size="34px" autocomplete="off" /></td>
            </tr>
                                    
            <tr>
                  <td>&nbsp;</td>
                  <td><input type="submit" value="Search"/></td>
            </tr>

        </table>
                        
      </form>
                        
      <%                  
                  ResultSet rs1 = null;

                  try
                  {
                           String sql = "SELECT COUNT(*) AS c"
                                        +" FROM companydetails ";

                           rs1 = DatabaseFile.getInstance().codeselect(sql);


                           while(rs1.next())
                           {
                              out.println("<h1 style='font-weight: bold; color: red;'>Total Companies ("+ rs1.getInt("c") +")</h1>");
                           }                                                        
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
                  
                  <%                        
                        ResultSet rs = null;
                        
                        try
                        {
                                int g = 1;
                             
                                 out.println("<table border='2px'  style='text-align: center;' width='100%'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Company Name</th>");                               
                                 out.println("<th>CSR Foundation Status</th>");
                                 out.println("<th>Sector</th>");
                                 out.println("<th>2021 - 2022</th>"); 
                                 out.println("<th>2022 - 2023</th>"); 
                                 out.println("</tr>");

                                String sql = "SELECT CorporateId, Name, PhoneNo, Email, Address, Foundation, Sector, 2022Data, 2023Data, Recorded_Date "
                                        +" FROM companydetails ";
                                
                                if((request.getParameter("search") != null) && (!(request.getParameter("search").trim().equals(""))))
                                {
                                    sql += " WHERE Name LIKE '%"+request.getParameter("search").trim()+"%' ";
                                }
                                
                                    sql +=" ORDER BY Recorded_Date DESC "
                                        +" LIMIT 10";

                                 rs = DatabaseFile.getInstance().codeselect(sql);
                                 
                                while(rs.next())
                                {
                                     out.println("<tr>"
                                             + "<td>" + g++ + "</td>"
                                             + "<td>" + rs.getString("Name") + "</td>"  
                                             + "<td>" + rs.getString("Foundation") + "</td>"                                                  
                                             + "<td>" + rs.getString("Sector") + "</td>" 
                                             + "<td>" + rs.getString("2022Data") + "</td>" 
                                             + "<td>" + rs.getString("2023Data") + "</td>" 
                                             + "</tr>");
                                }
                                
                                if(g == 1)
                                {
                                     out.println("<tr>"
                                             + "<td>&nbsp;</td>"
                                             + "<td>&nbsp;</td>"
                                             + "<td>&nbsp;</td>"                                         
                                             + "<td style='color: red;'> No Result Found! </td>"
                                             + "<td>&nbsp;</td>"
                                             + "<td>&nbsp;</td>"
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
