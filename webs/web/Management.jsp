<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Management System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="styles/layout.css" type="text/css" />
        <%@page errorPage="ErrorPage.jsp"%>
        <%@page session="true" %>
    </head>
    <body id="top">
        <div class="wrapper row1">
            <div id="header" class="clear">
                <div class="fl_left">
                    <h1><a href="mgnt.jsp">Project Management System</a></h1>
                    <p>Management System
                        <span style="padding-left: 650px; color: red;"> Welcome : <%=session.getAttribute("x")%></span>                           
                    </p>
                </div>
                <div class="fl_right">
                    <!--      <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">A - Z Index</a></li>
                            <li class="last"><a href="#">Admin Login</a></li>
                            <li class="last"><a href="#">Staff Login</a></li>
                          </ul>
                          <form action="#" method="post" id="sitesearch">
                            <fieldset>
                              <strong>Search:</strong>
                              <input type="text" value="Search Our Website&hellip;" onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
                              <input type="image" src="images/search.gif" id="search" alt="Search" />
                            </fieldset>
                          </form>-->
                </div>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row2">
            <div class="rnd">
                <!-- ###### -->
                <div id="topnav">
                    <ul>                               
                        <li><a href="Management.jsp">Projects</a></li>
                        <li class="active"><a href="Employees.jsp">Employees</a></li>
                        <li><a href="AssignProjects.jsp">Assign Project</a></li>                          
                        <li class="last"><a href="Signout.jsp">Sign Out</a></li>
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
                                        
                   <h1>Project List</h1>
                    
                    <%                        
                        ResultSet rs = null;
                        
                        try
                        {
                                int g = 1;
                             
                                 out.println("<table border='2px'  style='text-align: center;' width='100%'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Project Name</th>");                               
                                 out.println("<th>Project Desc</th>");
                                 out.println("<th>Priority</th>");
                                 out.println("<th>Start Date</th>"); 
                                 out.println("<th>Finish Date</th>");                                                                                                                                                                                       
                                 out.println("<th>Created Date</th>");                                                                                                                                                                                                
                                 out.println("</tr>");

                                 String sql = " SELECT Project_ID, ProjectName, ProjectDesc,  Priority, StartDate, FinishDate, CreatedDate "
                                         + " FROM project ";

                                 rs = DatabaseFile.getInstance().codeselect(sql);
                                 
                                while(rs.next())
                                {
                                     out.println("<tr>"
                                             + "<td>" + g++ + "</td>"
                                             + "<td>" + rs.getString(2) + "</td>"  
                                             + "<td>" + rs.getString(3) + "</td>"                                                  
                                             + "<td>" + rs.getString(4) + "</td>" 
                                             + "<td>" + rs.getString(5) + "</td>" 
                                             + "<td>" + rs.getString(6) + "</td>" 
                                             + "<td>" + rs.getString(7) + "</td>" 
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
                                       
                    </div>

                    <%
                        //getting response
                        try {
                            out.println("<font color = 'red'>");

                            if ((request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals("")))) {
                                out.println(request.getParameter("msg"));
                            }

                            out.println("</font>");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <!-- ####################################################################################################### -->
                </div>
            </div>
        </div>
        <!-- ####################################################################################################### 
        <div class="wrapper row4">
          <div class="rnd">
            <div id="footer" class="clear">
               ####################################################################################################### 
              <div class="fl_left clear">
                <div class="fl_left center"><img src="images/demo/worldmap.gif" alt="" /><br />
                  <a href="#">Find Us With Google Maps &raquo;</a></div>
                <address>
                Address Line 1<br />
                Address Line 2<br />
                Town/City<br />
                Postcode/Zip<br />
                <br />
                Tel: xxxx xxxx xxxxxx<br />
                Email: <a href="#">contact@domain.com</a>
                </address>
              </div>
              <div class="fl_right">
                <div id="social" class="clear">
                  <p>Stay Up to Date With Whats Happening</p>
                  <ul>
                    <li><a style="background-position:0 0;" href="#">Twitter</a></li>
                    <li><a style="background-position:-72px 0;" href="#">LinkedIn</a></li>
                    <li><a style="background-position:-142px 0;" href="#">Facebook</a></li>
                    <li><a style="background-position:-212px 0;" href="#">Flickr</a></li>
                    <li><a style="background-position:-282px 0;" href="#">RSS</a></li>
                  </ul>
                </div>
                <div id="newsletter">
                  <form action="#" method="post">
                    <fieldset>
                      <legend>Subscribe To Our Newsletter:</legend>
                      <input type="text" value="Enter Email Here&hellip;" onfocus="this.value=(this.value=='Enter Email Here&hellip;')? '' : this.value ;" />
                      <input type="text" id="subscribe" value="Submit" />
                    </fieldset>
                  </form>
                </div>
              </div>
               ####################################################################################################### 
            </div>
          </div>
        </div>
         ####################################################################################################### 
        <div class="wrapper">
          <div id="copyright" class="clear">
            <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></p>
            <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
          </div>
        </div>-->
    </body>
</html>
