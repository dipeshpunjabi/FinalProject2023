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
        String supportcode = request.getParameter("supportcode");        
        String supportname = request.getParameter("supportname");
        String id = request.getParameter("hide");
                         
        if(((supportcode!=null) && (!supportcode.trim().equals(""))) && ((supportname!=null) && (!supportname.trim().equals("")))
                && ((id!=null) && (!id.trim().equals(""))))
        {     
            String sql = "UPDATE supportteams "
                    + " SET SupportCode = '"+supportcode+"', "                  
                    + " SupportName = '"+supportname+"' "              
                    + " WHERE Support_ID = '" + id + "' ";
                               
            DatabaseFile.getInstance().codeupdate(sql);
                        
                     %>
                     <jsp:forward page="Support.jsp">
                             <jsp:param name="msg" value="Record modified Successfully!"/>
                         </jsp:forward>
                     <%                          
        } 
        else 
        {
                     %>
                     <jsp:forward page="Support.jsp">
                             <jsp:param name="msg" value="Record Not Modified Successfully!"/>
                         </jsp:forward>
                     <%    
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>