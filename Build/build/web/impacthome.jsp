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
          <li class="active"><a href="impacthome.jsp">Impact Home</a></li>
          <li><a href="impactnews.jsp">Impact News</a></li>
          <li><a href="impacttalks.jsp">Impact Talks</a></li>
          <li><a href="impactstories.jsp">Impact Stories</a></li>
          <li><a href="impactblogs.jsp">Articles/Blogs</a></li>
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
      <h1>Impact Home Page</h1>
       
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
                                  out.println("<tr><td><h1>Impact Stories</h1><td></tr>");
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
                                out.println("<tr><td><h1>Impact Stories</h1><td></tr>");
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
                           int g1 = 1;

                           String sql1 = "SELECT n.NewsId, n.Title, n.Description, n.Image, c.Name, n.CategoryId, n.NewsCategoryId, n.Publishing_Date, n.Recorded_Date "
                                        +" FROM newsdetails AS n "
                                        +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                        +" LEFT JOIN newscategorydetails AS nc ON nc.NewsCategoryId = n.NewsCategoryId "
                                        +" WHERE n.CategoryId = 1 "
                                        +" AND n.NewsCategoryId IN (1) "
                                        +" AND Publishing_Date >= CURDATE() "
                                        +" ORDER BY Publishing_Date ASC "
                                        +" LIMIT 3";

                           rs2 = DatabaseFile.getInstance().codeselect(sql1);

                           int h1 = 0;

                           while(rs2.next())
                           {
                               if(h1 == 0)
                               {
                                  out.println("<table border='2px' align='center'>");
                                  out.println("<tr><td><h1>Latest News</h1><td></tr>");
                                  out.println("<tr>");
                               }
                                  
                                out.println("<td style='text-align: center;'>"
                                        + "<a href='#?index="+ rs2.getInt("NewsId") +"''><img src='image.jsp?imgid="+rs2.getInt("NewsId")+"' width='200' height='200'/></a>"
                                        + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs2.getString("Title") + "</p>"
                                        + "<p style='text-align: center; color: blue;'>"+rs2.getString("Description") + "</p>"
                                        +"</td>");  
                                
                               g1++;

                               if(h1  == 3)
                               {
                                  out.println("</table>");  
                               }   

                               h1++;

                               if(h1 == 3)
                               {
                                  h1 = 0;
                               }
                           }

                           if(g1 == 1)
                           {
                                out.println("<table border='2px' align='center'>");
                                out.println("<tr><td><h1>Latest News</h1><td></tr>");
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
                           int g2 = 1;

                           String sql3 = "SELECT n.NewsId, n.Title, n.Description, n.Image, c.Name, n.CategoryId, n.NewsCategoryId, n.Publishing_Date, n.Recorded_Date "
                                        +" FROM newsdetails AS n "
                                        +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                        +" LEFT JOIN newscategorydetails AS nc ON nc.NewsCategoryId = n.NewsCategoryId "
                                        +" WHERE n.CategoryId = 4 "
                                        +" AND n.NewsCategoryId IN (25) "
                                        +" AND Publishing_Date >= CURDATE() "
                                        +" ORDER BY Publishing_Date ASC "
                                        +" LIMIT 3";

                           rs3 = DatabaseFile.getInstance().codeselect(sql3);

                           int h2 = 0;

                           while(rs3.next())
                           {
                               if(h2 == 0)
                               {
                                  out.println("<table border='2px' align='center'>");
                                  out.println("<tr><td><h1>Articles/Blogs</h1><td></tr>");
                                  out.println("<tr>");
                               }
                                  
                                out.println("<td style='text-align: center;'>"
                                        + "<a href='#?index="+ rs3.getInt("NewsId") +"''><img src='image.jsp?imgid="+rs3.getInt("NewsId")+"' width='200' height='200'/></a>"
                                        + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs3.getString("Title") + "</p>"
                                        + "<p style='text-align: center; color: blue;'>"+rs3.getString("Description") + "</p>"
                                        +"</td>");  
                                
                               g2++;

                               if(h2  == 3)
                               {
                                  out.println("</table>");  
                               }   

                               h2++;

                               if(h2 == 3)
                               {
                                  h2 = 0;
                               }
                           }

                           if(g2 == 1)
                           {
                               out.println("<table border='2px' align='center'>");
                               out.println("<tr><td><h1>Articles/Blogs</h1><td></tr>");

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
