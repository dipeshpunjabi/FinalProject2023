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
          <li class="active"><a href="explorecsrfoundation.jsp">CSR Foundations</a></li>
          <li><a href="csrproposal.jsp">CSR Proposal</a></li>
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
      <h1>CSR Foundations Page</h1>
      
      <form action="codecsrfoundation.jsp" method="post">
          
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
                        
        <h1>Listed Items</h1>

             <%                  
                  ResultSet rs1 = null;

                  try
                  {
                           int g = 1;

                           String sql = "SELECT f.FoundationId, f.Title, f.Description, f.Image, f.ParentCompany, f.CorporateId, f.Publishing_Date, f.Recorded_Date "
                                        +" FROM csrfoundationdetails AS f "
                                        +" LEFT JOIN companydetails AS c ON c.CorporateId = f.CorporateId "
                                        +" WHERE f.Publishing_Date >= CURDATE() ";
                           
                           if((request.getParameter("search") != null) && (!(request.getParameter("search").trim().equals(""))))
                           {
                                 sql += " AND f.Title LIKE '%"+request.getParameter("search").trim()+"%' ";
                           }
                           
                           sql +=" ORDER BY f.Publishing_Date ASC";
                           
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
                                        + "<a href='#.jsp?index="+ rs1.getInt("FoundationId") +"''><img src='image2.jsp?imgid="+rs1.getInt("FoundationId")+"' width='200' height='200'/></a>"
                                        + "<br/><p style='text-align: center; font-weight: bold; color: red;'>"+ rs1.getString("Title") + "</p>"
                                        + "<p style='text-align: center; color: blue;'>"+rs1.getString("Description") + "</p>"
                                        + "<p style='text-align: center; color: green;'>Parent Company : "+rs1.getString("ParentCompany") + "</p>"
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
