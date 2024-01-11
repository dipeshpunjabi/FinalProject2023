<%@page import="com.apps.Database.DatabaseFile"%>
<%@page import="com.apps.Logcreation.Log"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%
     ResultSet rs = null;
     String sql = "";
     String imgLen = "";

    if (request.getParameter("imgid") != null && request.getParameter("imgid") != "") 
    {
        int id = Integer.parseInt(request.getParameter("imgid"));
        String filename = "image" + id + ".jpg";

        try 
        {
            sql = "SELECT Image "
                + "FROM ngodetails "
                + "WHERE NGOId = '" + id + "'";

            rs = DatabaseFile.getInstance().codeselect(sql);

            if (rs.next()) 
            {
                imgLen = rs.getString(1);
            }                      

            rs = DatabaseFile.getInstance().codeselect(sql);

            if (rs.next()) 
            {
                int len = imgLen.length();
                byte[] rb = new byte[len];

                InputStream readImg = rs.getBinaryStream(1);

                int index = readImg.read(rb, 0, len);

                response.reset();
                response.setContentType("image/jpg");
                response.setHeader("Content-disposition", "attachment; filename=" + filename);
                response.getOutputStream().write(rb, 0, len);
                response.getOutputStream().flush();
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();

            Log.logger.error("Error:", e);
            Log.logger.warn("This is a warning message");
            Log.logger.trace("This message will not be logged since log level is set as DEBUG");
        } 
        finally 
        {
            if(rs != null)
            {
               rs.close();
            }
        }
    }
%>
