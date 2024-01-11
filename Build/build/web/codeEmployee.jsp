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
    String empname = request.getParameter("empname");
    String phoneno = request.getParameter("phoneno");
    String email = request.getParameter("email");
    String position = request.getParameter("position");
    String usernames = request.getParameter("username");
    String password = request.getParameter("password");
  
    if( ((empname!=null) && (!empname.trim().equals(""))) && ((phoneno!=null) && (!phoneno.trim().equals("")))
            && ((email!=null) && (!email.trim().equals(""))) && ((position!=null) && (!position.trim().equals("")))
            && ((usernames!=null) && (!usernames.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
    {                
        //jdbc connection
        try
        {               
            String sql = "INSERT INTO emp(Name, PhoneNo, Email, Position, username, Password, CreatedDate)"
                    + " VALUES('"+empname+"', '"+phoneno+"', '"+email+"', '"+position+"', '"+usernames+"', '"+password+"', now())";

           DatabaseFile.getInstance().codeinsert(sql);                      
           
           %>
           <jsp:forward page="Employee.jsp">
                   <jsp:param name="msg" value="Project Created Sucessfully!"></jsp:param>               
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
           <jsp:forward page="Employee.jsp">
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