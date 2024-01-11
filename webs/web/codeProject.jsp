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
    String projectdesc = request.getParameter("projectdesc");
    String priority = request.getParameter("priority");
    String startdate = request.getParameter("datepicker1");
    String finishdate = request.getParameter("datepicker2");
  
    if( ((projectname!=null) && (!projectname.trim().equals(""))) && ((projectdesc!=null) && (!projectdesc.trim().equals("")))
            && ((priority!=null) && (!priority.trim().equals(""))) && ((startdate!=null) && (!startdate.trim().equals("")))
            && ((finishdate!=null) && (!finishdate.trim().equals(""))))
    {                
        //jdbc connection
        try
        {               
            String sql = "INSERT INTO project(ProjectName, ProjectDesc,  Priority, StartDate, FinishDate, CreatedDate)"
                    + " VALUES('"+projectname+"', '"+projectdesc+"', '"+priority+"', '"+startdate+"', '"+finishdate+"', now())";

           DatabaseFile.getInstance().codeinsert(sql);                      
           
           %>
           <jsp:forward page="Project.jsp">
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
           <jsp:forward page="Project.jsp">
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