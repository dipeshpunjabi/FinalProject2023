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
          <li class="active"><a href="index.jsp">Home</a></li>           
          <li><a href="impacthome.jsp">News & Stories</a></li>
          <li><a href="csrresources.jsp">CSR Insights</a></li>
          <li><a href="explorengos.jsp">Companies</a></li>
          <li><a href="listngos.jsp">NGOs</a></li>
          <li><a href="Platform.jsp">Platforms</a></li> 
          <li><a href="aboutus.jsp">About us</a></li> 
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
      <h1>Home Page</h1>
       
      <p style='font-weight: bold; color: green;'>India's CSR impact platform for CSR project ideas, proposals, innovative solutions and partnerships. For CSR/HR heads, non-profits, innovators, social enterprises...</p>
      
       <%                  
	ResultSet rs5 = null;
        out.println("<table border='2px' align='center'>");
        out.println("<tr style='text-align: center; font-weight: bold; color: red;'>");

	try
	{
			 String sql = "SELECT COUNT(*) AS c"
						  +" FROM projectdetails ";

			 rs5 = DatabaseFile.getInstance().codeselect(sql);


			 while(rs5.next())
			 {
                               
                                out.println("<td>");
				out.println("<h1 style='font-weight: bold; color: green;'>"+ rs5.getInt("c") +"</h1>");
				out.println("<h1 style='font-weight: bold; color: red;'>CSR Projects</h1>");
                                out.println("</td>");
                                
			 }    
                         
                         String sql1 = "SELECT COUNT(*) AS c"
                              +" FROM ngodetails ";
                         
                         rs5 = DatabaseFile.getInstance().codeselect(sql1);


			 while(rs5.next())
			 {                               
                                out.println("<td>");
				out.println("<h1 style='font-weight: bold; color: green;'>"+ rs5.getInt("c") +"</h1>");
				out.println("<h1 style='font-weight: bold; color: red;'>validated NGO's</h1>");
                                out.println("</td>");
                                
			 }    
                         
                          String sql2 = "SELECT COUNT(*) AS c"
                                        +" FROM companydetails ";
                          
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
                  ResultSet rs1 = null;

                  try
                  {
                           int g = 1;

                           String sql = "SELECT n.NewsId, n.Title, n.Description, n.Image, c.Name, n.CategoryId, n.NewsCategoryId, n.Publishing_Date, n.Recorded_Date "
                                        +" FROM newsdetails AS n "
                                        +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                        +" LEFT JOIN newscategorydetails AS nc ON nc.NewsCategoryId = n.NewsCategoryId "
                                        +" WHERE n.CategoryId = 2 "                                        
                                        +" AND Publishing_Date >= CURDATE() "
                                        +" ORDER BY Publishing_Date ASC "
                                        +" LIMIT 3";

                           rs1 = DatabaseFile.getInstance().codeselect(sql);

                           int h = 0;

                           while(rs1.next())
                           {
                               if(h == 0)
                               {
                                  out.println("<table border='2px' align='center'>");
                                  out.println("<tr style='text-align: center; font-weight: bold; color: red;'><td><h1>Impact Stories</h1><td></tr>");
                                  out.println("<tr>");
                               }
                                  
                                out.println("<td style='text-align: center;'>"
                                        + "<a href='#?index="+ rs1.getInt("NewsId") +"''><img src='image.jsp?imgid="+rs1.getInt("NewsId")+"' width='200' height='200'/></a>"
                                        + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs1.getString("Title") + "</p>"
                                        + "<p style='text-align: center; color: blue;'>"+rs1.getString("Description") + "</p>"
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
                                out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>Impact Stories</h1><td></tr>");
                                out.println("<tr>"
                                          + "<td> &nbsp; </td>"                                                                                                                                               
                                          + "<td style='color: red;'> No Result Found! </td>"                                                   
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

                  String sql = "SELECT n.NGOId, n.Name, n.EstablishedIn, n.RegistrationNo, n.Description, n.Image, n.Address, n.CorporateId, n.Publishing_Date, n.Recorded_Date "
                               +" FROM ngodetails AS n "
                               +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                               +" WHERE n.Publishing_Date >= CURDATE() "
                               +" ORDER BY n.Publishing_Date ASC "
                               +" LIMIT 3";

                  rs2 = DatabaseFile.getInstance().codeselect(sql);

                  int h = 0;

                  while(rs2.next())
                  {
                      if(h == 0)
                      {
                         out.println("<table border='2px' align='center'>");
                         out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>Verified NGO's</h1><td></tr>");
                         out.println("<tr>");
                      }

                       out.println("<td style='text-align: center;'>"
                               + "<a href='#?index="+ rs2.getInt("NGOId") +"''><img src='image3.jsp?imgid="+rs2.getInt("NGOId")+"' width='200' height='200'/></a>"
                               + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs2.getString("Name") + "</p>"
                               + "<p style='text-align: center; font-weight: bold; color: red;'>Established In: "+ rs2.getString("EstablishedIn") + "</p>"
                               + "<p style='text-align: center; font-weight: bold; color: red;'>Registration No: "+ rs2.getString("RegistrationNo") + "</p>"
                               + "<p style='text-align: center; font-weight: bold; color: red;'>"+ rs2.getString("Address") + "</p>"
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
                       out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>Impact Stories</h1><td></tr>");
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
                  ResultSet rs3 = null;

                  try
                  {
                           int g = 1;

                           String sql = "SELECT n.NewsId, n.Title, n.Description, n.Image, c.Name, n.CategoryId, n.NewsCategoryId, n.Publishing_Date, n.Recorded_Date "
                                        +" FROM newsdetails AS n "
                                        +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                        +" LEFT JOIN newscategorydetails AS nc ON nc.NewsCategoryId = n.NewsCategoryId "
                                        +" WHERE n.CategoryId = 3  "
                                        +" AND n.NewsCategoryId IN (10) "
                                        +" AND Publishing_Date >= CURDATE() "
                                        +" ORDER BY Publishing_Date ASC";

                           rs3 = DatabaseFile.getInstance().codeselect(sql);

                           int h = 0;

                           while(rs3.next())
                           {
                               if(h == 0)
                               {
                                  out.println("<table border='2px' align='center'>");
                                  out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>Impact Talks</h1><td></tr>");
                                  out.println("<tr>");
                               }
                                  
                                out.println("<td style='text-align: center;'>"
                                        + "<a href='codeshop.jsp?index="+ rs3.getInt("NewsId") +"''><img src='image.jsp?imgid="+rs3.getInt("NewsId")+"' width='200' height='200'/></a>"
                                        + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs3.getString("Title") + "</p>"
                                        + "<p style='text-align: center; color: blue;'>"+rs3.getString("Description") + "</p>"
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
                                out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>Impact Talks</h1><td></tr>");
                                out.println("<tr>"
                                          + "<td> &nbsp; </td>"                                                                                                                                               
                                          + "<td style='color: red;'> No Result Found! </td>"                                                   
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
                        if(rs3 != null)
                        {
                           rs3.close();
                        }
                  }

                  %>   
                  
         <%                  
            ResultSet rs4 = null;

            try
            {
                     int g = 1;

                     String sql = "SELECT n.ProjectId, n.Title, n.Company, n.Description, n.Address, n.Budget, n.Image, n.CorporateId, n.Publishing_Date, n.Recorded_Date "
                                  +" FROM projectdetails AS n "
                                  +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                  +" WHERE n.Publishing_Date >= CURDATE() "
                                  +" ORDER BY n.Publishing_Date ASC "
                                  +" LIMIT 10";

                     rs4 = DatabaseFile.getInstance().codeselect(sql);

                     int h = 0;

                     while(rs4.next())
                     {
                         if(h == 0)
                         {
                            out.println("<table border='2px' align='center'>");
                            out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>CSR Proposal</h1><td></tr>");
                            out.println("<tr>");
                         }

                          out.println("<td style='text-align: center;'>"
                                  + "<a href='#?index="+ rs4.getInt("ProjectId") +"''><img src='image4.jsp?imgid="+rs4.getInt("ProjectId")+"' width='200' height='200'/></a>"
                                  + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs4.getString("Title") + "</p>"
                                  + "<p style='text-align: center; font-weight: bold; color: red;'>"+ rs4.getString("Company") + "</p>"
                                  + "<p style='text-align: center; font-weight: bold; color: blue;'>Proposed Locations: "+ rs4.getString("Address") + "</p>"
                                  + "<p style='text-align: center; font-weight: bold; color: blue;'>"+ rs4.getString("Description") + "</p>"
                                  + "<p style='text-align: center; color: red;'>Project Budget:"+rs4.getString("Budget") + "</p>"
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
                          out.println("<tr><td style='text-align: center; font-weight: bold; color: red;'><h1>CSR Proposal</h1><td></tr>");
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
                  if(rs4 != null)
                  {
                     rs4.close();
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
