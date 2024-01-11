<%@page import="com.apps.Logcreation.Log"%>
<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="java.sql.*"%>

<%

try
{
     Log objLog  = objLog = new Log();
     
     //session
     HttpSession hs = request.getSession(true);
       
    //argument
    String username =  hs.getAttribute("x").toString();
        
    //getting values from design page
    String supportcode = request.getParameter("supportcode");
    String supportname = request.getParameter("supportname");
  
    if( ((supportcode!=null) && (!supportcode.trim().equals(""))) && ((supportname!=null) && (!supportname.trim().equals(""))))
    {                
        //jdbc connection
        try
        {               
            String sql = "INSERT INTO supportteams(SupportCode, SupportName, CreatedDate)"
                    + " VALUES('"+supportcode+"', '"+supportname+"', now())";

           DatabaseFile.getInstance().codeinsert(sql);                      
           
           %>
           <jsp:forward page="Support.jsp">
                   <jsp:param name="msg" value="Support Created Sucessfully!"></jsp:param>               
               </jsp:forward>
           <%

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    else
    {
           %>
           <jsp:forward page="Support.jsp">
               <jsp:param name="msg" value="Please Fill All Details"></jsp:param>
           </jsp:forward>
           <%
    }
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
%>