<%@page import="com.apps.Logcreation.Log"%>
<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="java.sql.*"%>

<%

try
{
     Log objLog  = objLog = new Log();
     
     //session
     HttpSession hs = request.getSession(true);
       
    //getting values from design page
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String foundation = request.getParameter("foundation");
    String sector = request.getParameter("sector");
    String data_2022 = request.getParameter("2022Data");
    String data_2023 = request.getParameter("2023Data");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Log.logger.info("name:"+name);
    Log.logger.info("phone:"+phone);
    Log.logger.info("email:"+email);
    Log.logger.info("address:"+address);
    Log.logger.info("foundation:"+foundation);
    Log.logger.info("sector:"+sector);
    Log.logger.info("data_2022:"+data_2022);
    Log.logger.info("data_2023:"+data_2023);
    Log.logger.info("username"+username);
    Log.logger.info("password"+password);
  
    if( ((name!=null) && (!name.trim().equals(""))) && ((phone!=null) && (!phone.trim().equals("")))
            && ((email!=null) && (!email.trim().equals(""))) && ((address!=null) && (!address.trim().equals("")))
            && ((!foundation.equals("select"))) && ((sector!=null) && (!sector.trim().equals(""))) 
            && ((data_2022!=null) && (!data_2022.trim().equals(""))) && ((data_2023!=null) && (!data_2023.trim().equals(""))) 
            && ((username!=null) && (!username.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
    {                
        //jdbc connection
        try
        {               
            String sql = "INSERT INTO companydetails(Name, PhoneNo, Email, Address, Foundation, Sector, 2022Data, 2023Data, Username, Password, Recorded_Date)"
                    + " VALUES('"+name+"', '"+phone+"', '"+email+"', '"+address+"', '"+foundation+"', '"+sector+"', '"+data_2022+"', '"+data_2023+"', '"+username+"', '"+password+"', now())";

            Log.logger.info("sql:"+sql);	  
            
            //CALLING DATABASE Class           
            DatabaseFile.getInstance().codeinsert(sql);

           %>
               <jsp:forward page="Company.jsp">
                   <jsp:param name="msg" value="Company Created Sucessfully!"></jsp:param>               
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
                <jsp:forward page="Company.jsp">
                    <jsp:param name="msg" value="Please Fill All Details!"></jsp:param>
                </jsp:forward>
           <%
    }    
}
catch(Exception e)
{
    e.printStackTrace();
}    
%>