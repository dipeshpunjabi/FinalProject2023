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
          <li><a href="csrproposal.jsp">CSR Proposal</a></li>
          <li class="active"><a href="corporatefaqs.jsp">FAQs - Corporate</a></li>
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
      <h1>FAQs - Corporate Page</h1>
      
      <h1>General FAQs on CSRBOX</h1>
         
       <%                        
            ResultSet rs = null;

            try
            {
                    int g = 1;

                     out.println("<table border='2px' width='100%'>");
                     out.println("<tr>");
                     out.println("<th>Sno</th>");
                     out.println("<th>Question</th>");
                     out.println("</tr>");

                    String sql = "SELECT FAQId, Question, Answer, QuestionType, Category, CorporateId, Publishing_Date, Recorded_Date "
                            +" FROM faqdetails "
                            +" WHERE Category = 'Corporate' "
                            + "AND QuestionType = 'General FAQs on CSRBOX' "                                        
                            +" ORDER BY Recorded_Date DESC ";

                     rs = DatabaseFile.getInstance().codeselect(sql);

                    while(rs.next())
                    {
                         out.println("<tr>"
                                 + "<td>" + g++ + "</td>"
                                 + "<td>" + rs.getString("Question") 
                                 + "<br><br>" + rs.getString("Answer") + "</td>"                                                  
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
        
        <h1>CSRBOX Dashboard</h1>
         
       <%                        
            ResultSet rs1 = null;

            try
            {
                    int g = 1;

                     out.println("<table border='2px' width='100%'>");
                     out.println("<tr>");
                     out.println("<th>Sno</th>");
                     out.println("<th>Question</th>");
                     out.println("</tr>");

                    String sql = "SELECT FAQId, Question, Answer, QuestionType, Category, CorporateId, Publishing_Date, Recorded_Date "
                            +" FROM faqdetails "
                            +" WHERE Category = 'Corporate' "
                            + "AND QuestionType = 'CSRBOX Dashboard' "                                        
                            +" ORDER BY Recorded_Date DESC ";

                     rs1 = DatabaseFile.getInstance().codeselect(sql);

                    while(rs1.next())
                    {
                         out.println("<tr>"
                                 + "<td>" + g++ + "</td>"
                                 + "<td>" + rs1.getString("Question") 
                                 + "<br><br>" + rs1.getString("Answer") + "</td>"                                                  
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
