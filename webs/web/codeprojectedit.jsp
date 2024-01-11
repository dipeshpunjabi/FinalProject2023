<%@page import="com.apps.Database.DatabaseFile"%>
<%@page session="true" %>
<%
    try 
    {
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
        String id = request.getParameter("hide");
                         
       if( ((projectname!=null) && (!projectname.trim().equals(""))) && ((projectdesc!=null) && (!projectdesc.trim().equals("")))
            && ((priority!=null) && (!priority.trim().equals(""))) && ((startdate!=null) && (!startdate.trim().equals("")))
            && ((finishdate!=null) && (!finishdate.trim().equals(""))))
        {     
            String sql = "UPDATE project "
                    + " SET ProjectName = '"+projectname+"', "                  
                    + " ProjectDesc = '"+projectdesc+"', " 
                    + " Priority = '"+priority+"', " 
                    + " StartDate = '"+startdate+"', " 
                    + " FinishDate = '"+finishdate+"' "                                                                                                                          
                    + " WHERE Project_ID = '" + id + "' ";
                               
            DatabaseFile.getInstance().codeupdate(sql);
                        
                     %>
                     <jsp:forward page="Project.jsp">
                             <jsp:param name="msg" value="Record modified Successfully!"/>
                         </jsp:forward>
                     <%                          
        } 
        else 
        {
                     %>
                     <jsp:forward page="Project.jsp">
                             <jsp:param name="msg" value="Record Not Modified Successfully!"/>
                         </jsp:forward>
                     <%    
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>