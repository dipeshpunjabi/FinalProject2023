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
          <li><a href="explorengos.jsp">Explore NGOs</a></li>
          <li><a href="explorecsrfoundation.jsp">CSR Foundations</a></li>
          <li class="active"><a href="csrproposal.jsp">CSR Proposal</a></li>
          <li><a href="corporatefaqs.jsp">FAQs - Corporate</a></li>
          <li><a href="Company.jsp">Register/Login</a></li>
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
      <h1>Post CSR Proposal Page</h1>
                              
      <%                  
        ResultSet rs1 = null;

        try
        {
                 String sql = "SELECT COUNT(*) AS c"
                              +" FROM projectdetails ";

                 rs1 = DatabaseFile.getInstance().codeselect(sql);


                 while(rs1.next())
                 {
                    out.println("<h1 style='font-weight: bold; color: red;'>Total Projects ("+ rs1.getInt("c") +")</h1>");
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
         ResultSet rs2 = null;

         try
         {
                  int g = 1;

                  String sql = "SELECT n.ProjectId, n.Title, n.Company, n.Description, n.Address, n.Budget, n.Image, n.CorporateId, n.Publishing_Date, n.Recorded_Date "
                               +" FROM projectdetails AS n "
                               +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                               +" WHERE n.Publishing_Date >= CURDATE() "
                               +" ORDER BY n.Publishing_Date ASC "
                               +" LIMIT 10";

                  rs2 = DatabaseFile.getInstance().codeselect(sql);

                  int h = 0;

                  while(rs2.next())
                  {
                      if(h == 0)
                      {
                         out.println("<table border='2px' align='center'>");
                         out.println("<tr>");
                      }

                       out.println("<td style='text-align: center;'>"
                               + "<a href='#?index="+ rs2.getInt("ProjectId") +"''><img src='image4.jsp?imgid="+rs2.getInt("ProjectId")+"' width='200' height='200'/></a>"
                               + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs2.getString("Title") + "</p>"
                               + "<p style='text-align: center; font-weight: bold; color: red;'>"+ rs2.getString("Company") + "</p>"
                               + "<p style='text-align: center; font-weight: bold; color: blue;'>Proposed Locations: "+ rs2.getString("Address") + "</p>"
                               + "<p style='text-align: center; font-weight: bold; color: blue;'>"+ rs2.getString("Description") + "</p>"
                               + "<p style='text-align: center; color: red;'>Project Budget:"+rs2.getString("Budget") + "</p>"
                               +"</td>");  

                      g++;

                      if(h  == 3)
                      {
                         out.println("</table>");  
                      }   

                      h++;

                      if(h == 3)
                      {
                         h = 0;
                      }
                  }

                  if(g == 1)
                  {
                       out.println("<table border='2px' align='center'>");
                       out.println("<tr><td><h1>Impact Stories</h1><td></tr>");
                       out.println("<tr>"
                                 + "<td> &nbsp; </td>"                                                                                                                                               
                                 + "<td style='color: red;'> No Result Found! </td>"                                                   
                                 + "<td> &nbsp; </td>"
                                 + "<td> &nbsp; </td>"
                                 + "<td> &nbsp; </td>"
                                 + "</tr>");

                       out.println("</table>");
                  }                                                                
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
