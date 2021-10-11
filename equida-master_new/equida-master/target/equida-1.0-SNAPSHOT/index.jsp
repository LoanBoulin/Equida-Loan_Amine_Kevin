<%-- 
    Document   : index.jsp
    Created on : 29 sept. 2021, 08:44:13
    Author     : adminsio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
        session.setAttribute("login", false);

     
    String redirectURL = "http://localhost:8080/equida/ServletAccueil/accueil";
    response.sendRedirect(redirectURL);
    

%>




   
    
