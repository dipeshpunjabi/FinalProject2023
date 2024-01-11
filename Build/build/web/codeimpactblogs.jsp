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
          <li><a href="impacthome.jsp">Impact Home</a></li>
          <li><a href="impactnews.jsp">Impact News</a></li>
          <li><a href="impacttalks.jsp">Impact Talks</a></li>
          <li><a href="impactstories.jsp">Impact Stories</a></li>
          <li class="active"><a href="impactblogs.jsp">Articles/Blogs</a></li>
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
      <h1>Articles/Blogs Page</h1>
      
      <form action="codeimpactblogs.jsp" method="post">
          
        <table align="center" border="0px" width="100px">

            <tr style="color: red;">
                <td>Search:</td><td><input type="text" name="search" size="34px" autocomplete="off" /></td>
            </tr>
            
            <tr style="color: red;">
                <td>&nbsp;</td><td>(OR)</td>
            </tr>
            
            <tr style="color: red;">                              

                <td>Category Name:</td>

                <td>

                    <select name="categoryname" style="width:225px;">  

                    <option value="-Select-">-Select-</option>

                        <%
                            ResultSet rs = null;

                            try
                            {
                                  String sql = " SELECT NewsCategoryId, Name "
                                             + " FROM newscategorydetails "
                                             + " WHERE CategoryId = 4 "
                                             + " ORDER BY NewsCategoryId ASC";

                                rs = DatabaseFile.getInstance().codeselect(sql);

                                while(rs.next())
                                {
                                    %>
                                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                    <%
                                }                                     
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

                    </select>

                </td>

           </tr>
                        
            <tr>
                  <td>&nbsp;</td>
                  <td><input type="submit" value="Filter"/><input type="reset" value="Clear"/></td>
              </tr>

        </table>
                        
      </form>     
                        
        <h1>Listed Items</h1>

             <%                  
                  ResultSet rs1 = null;

                  try
                  {
                           int g = 1;

                           String sql = "SELECT n.NewsId, n.Title, n.Description, n.Image, c.Name, n.CategoryId, n.NewsCategoryId, n.Publishing_Date, n.Recorded_Date "
                                        +" FROM newsdetails AS n "
                                        +" LEFT JOIN companydetails AS c ON c.CorporateId = n.CorporateId "
                                        +" LEFT JOIN newscategorydetails AS nc ON nc.NewsCategoryId = n.NewsCategoryId "
                                        +" WHERE n.CategoryId = 4  ";
                           
                           if(!(request.getParameter("categoryname").equals("-Select-")))
                           {
                               sql += " AND n.NewsCategoryId = '"+request.getParameter("categoryname")+"' ";
                           }
                           else
                           {
                               if((request.getParameter("search") != null) && (!(request.getParameter("search").trim().equals(""))))
                               {
                                    sql += " AND n.Title LIKE '%"+request.getParameter("search").trim()+"%' ";
                               }
                           }
                           
                            sql += " AND Publishing_Date >= CURDATE() "
                                +" ORDER BY Publishing_Date ASC";
                              
                           System.out.println(sql);

                           rs1 = DatabaseFile.getInstance().codeselect(sql);

                           int h = 0;

                           while(rs1.next())
                           {
                               if(h == 0)
                               {
                                  out.println("<table border='2px' align='center'>");
                                  out.println("<tr>");
                               }
                                  
                                out.println("<td style='text-align: center;'>"
                                        + "<a href='codeshop.jsp?index="+ rs1.getInt("NewsId") +"''><img src='image.jsp?imgid="+rs1.getInt("NewsId")+"' width='200' height='200'/></a>"
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
