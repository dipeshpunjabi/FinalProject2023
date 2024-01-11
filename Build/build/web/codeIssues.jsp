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
    String projectname = request.getParameter("projectname");
    String empname = request.getParameter("empname");
    String descreption = request.getParameter("descreption");
    String status = request.getParameter("status");
  
    if(((projectname!=null) && (!projectname.trim().equals(""))) && ((empname!=null) && (!empname.trim().equals("")))
        && ((descreption!=null) && (!descreption.trim().equals(""))) && ((status!=null) && (!status.trim().equals(""))))
    {                
        //jdbc connection
        try
        {               
            String sql = "INSERT INTO issues(Project_ID, Emp_ID, IssuseDesc, Status, CreatedDate)"
                    + " VALUES('"+projectname+"', '"+empname+"', '"+descreption+"', '"+status+"', now())";

           DatabaseFile.getInstance().codeinsert(sql);                      
           
           %>
           <jsp:forward page="Issues.jsp">
                   <jsp:param name="msg" value="Project Assigned Created Sucessfully!"></jsp:param>               
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
           <jsp:forward page="Issues.jsp">
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