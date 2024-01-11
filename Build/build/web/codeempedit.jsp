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
        String empname = request.getParameter("empname");
        String phoneno = request.getParameter("phoneno");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        String usernames = request.getParameter("username");
        String password = request.getParameter("password");
        String id = request.getParameter("hide");

        if( ((empname!=null) && (!empname.trim().equals(""))) && ((phoneno!=null) && (!phoneno.trim().equals("")))
                && ((email!=null) && (!email.trim().equals(""))) && ((position!=null) && (!position.trim().equals("")))
                && ((usernames!=null) && (!usernames.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
        {     
            String sql = "UPDATE emp "
                    + " SET Name = '"+empname+"', "                  
                    + " PhoneNo = '"+phoneno+"', " 
                    + " Email = '"+email+"', " 
                    + " Position = '"+position+"', " 
                    + " username = '"+usernames+"', "
                    + " password = '"+password+"' "                                                                                                                                             
                    + " WHERE Emp_ID = '" + id + "' ";
                               
            DatabaseFile.getInstance().codeupdate(sql);
                        
                     %>
                     <jsp:forward page="Employee.jsp">
                             <jsp:param name="msg" value="Record modified Successfully!"/>
                         </jsp:forward>
                     <%                          
        } 
        else 
        {
                     %>
                     <jsp:forward page="Employee.jsp">
                             <jsp:param name="msg" value="Record Not Modified Successfully!"/>
                         </jsp:forward>
                     <%    
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>