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
          <li><a href="aboutus.jsp">About us</a></li>
          <li class="active"><a href="contactus.jsp">Contact us</a></li>
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
      <h1 style='font-weight: bold; color: red;'>Contact us</h1>
      
      <p>To explore how CSR PORTAL can help you in amplifying impact communication and catalyzing partnerships (if you are an NGO, social enterprise, innovator, CSR foundation or a company), please reach out to us:</p>
      
      <table align="center" border="0px" width="100px">

        <tr>
            <td style='font-weight: bold; color: red;'>Call:</td>
            <td style='font-weight: bold; color: blue;'>+91-7892932882</td>
        </tr>
          
        <tr>
            <td style='font-weight: bold; color: red;'>Email:</td>
            <td style='font-weight: bold; color: blue;'>dipesh@csrportal.org</td>
        </tr>

      </table>
      
      <p>For escalation, write to us at <span style='font-weight: bold; color: red;'>abishek@csrportal.org</span></p>
      
      <table align="center" border="0px" width="100px">

        <tr>
            <td>
                <p style='font-weight: bold; color: green;'>Operations Office</p>
                <span>
                CSRPORTAL<br/>
                806-808, Shivalik Satyamev<br/>
                Near Vakil Saheb Bridge, Bopal Rd,<br/>
                Bopal, Ahmedabad, Gujarat 380058.
                </span>
            </td>
            
            <td>
                <p style='font-weight: bold; color: green;'>Registered Office</p>
                <span>
                    Oracle Consultants Pvt Ltd<br/>
                    Nayagaon, District-Udaipur,<br/>
                    Rajasthan, India 313804<br/>
                </span>
            </td>
        </tr>
          

      </table>
      
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
