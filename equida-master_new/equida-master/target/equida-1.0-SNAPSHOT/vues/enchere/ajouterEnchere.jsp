<%-- 
    Document   : ajouterClient
    Created on : 18 août 2021, 18:02:51
    Author     : Zakina
--%>

<%@page import="model.Client"%>
<%@page import="model.Vente"%>
<%@page import="model.Lot"%>
<%@page import="forms.FormEnchere"%>
<%@page import="model.Enchere"%>
<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pays"%>
<%@page import="forms.FormClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equida</title>
        <link><link rel="stylesheet" href=""/>
    </head>
    <body>
        
        <div class="container"> 
        
         <%
             
                Enchere uneEnchere=(Enchere)request.getAttribute("enchere");
                
                String leLot =(String)request.getAttribute("leLot");
                String leClient =(String)request.getAttribute("leClient");
                String leCheval =(String)request.getAttribute("leCheval");
                
                FormEnchere form = (FormEnchere)request.getAttribute("form");
                
                out.println("<h1>NOUVELLE ENCHERE pour le cheval : "+ leCheval +"</h1>");


            %>
        
        <form class="form-inline" action="ajouterEnchere" method="POST">
            
                
                <label for="montant">MONTANT : </label>
                <input id="montant"  type="number"  name="montant" class="form-control" size="30" maxlength="30">      
                </br>
                
              
                    <%
                    out.println("<input type='hidden' name='lot' value='" + leLot+"'/>" );
                    out.println("<input type='hidden' name='client' value='" + leClient+"'/>" );
                    %>
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
                    
                    <br>
                     <br>
                      <br>
                       <br> 
                       <br> 
                       <br>
                       
                       
        </div>
    </body>
</html>

<%@include file="../components/footer.jsp" %>
