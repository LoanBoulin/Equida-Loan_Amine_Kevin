/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Database.ClientDAO;
import Database.EnchereDAO;
import Database.LotDAO;
import Database.VenteDAO;
import forms.FormEnchere;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Client;
import model.Compte;
import model.Enchere;
import model.Lot;
import model.Vente;

/**
 *
 * @author adminsio
 */
@WebServlet(name = "ServletEnchere", urlPatterns = {"/ServletEnchere"})
public class ServletEnchere extends HttpServlet {
    
     Connection connection ;
      
        
    @Override
    public void init()
    {     
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEnchere</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEnchere at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String url = request.getRequestURI();  
        
        // Récup et affichage des clients interessés par une certaine catégorie de ventes
        if(url.equals("/equida/ServletEnchere/listerLesEncheresParCheval"))
        {  
            String codeChe = (String)request.getParameter("codeChe");
                  
            ArrayList<Enchere> lesEncheres = EnchereDAO.getLesEncheresByCheval(connection, codeChe);
            request.setAttribute("plesEncheres", lesEncheres);
            
            getServletContext().getRequestDispatcher("/vues/enchere/listerLesEncheresParCheval.jsp").forward(request, response);
        }else
            
        if(url.equals("/equida/ServletEnchere/listerLesEncheresParClient"))
        {  
            String codeCompte = (String)request.getParameter("client");
                 
            ArrayList<Enchere> lesEncheres = EnchereDAO.getLesEncheresByUser(connection, codeCompte);
            request.setAttribute("plesEncheres", lesEncheres);
            
            getServletContext().getRequestDispatcher("/vues/enchere/listerLesEncheresParClient.jsp").forward(request, response);
        }else
            
        if(url.equals("/equida/ServletEnchere/ajouterEnchere"))
        {                   

            ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
            request.setAttribute("pLesVentes", lesVentes);

            String idClient = (String)request.getParameter("client");
            String idLot = (String)request.getParameter("lot");
            String nomCheval = (String)request.getParameter("chevalNom");
            
            request.setAttribute("leClient", idClient);
            request.setAttribute("leLot", idLot);
            request.setAttribute("leCheval", nomCheval);
            
            this.getServletContext().getRequestDispatcher("/vues/enchere/ajouterEnchere.jsp" ).forward( request, response );
        }
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    
        /* Préparation de l'objet formulaire */
        FormEnchere form = new FormEnchere();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Enchere uneEnchere = form.ajouterEnchere(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pEnchere", uneEnchere );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
            Enchere enchereInsere =  EnchereDAO.ajouterEnchere(connection, uneEnchere);
            if (enchereInsere != null ){
                String redirectURL = "http://localhost:8080/equida/index.jsp" ;
                response.sendRedirect(redirectURL);
            }
            else 
            {
                // Cas oùl'insertion en bdd a échoué
                //renvoyer vers une page d'erreur 
            }
        }
        else
        { 
         
            ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
            request.setAttribute("pLesVentes", lesVentes);

            String idClient = (String)request.getParameter("client");
            String idLot = (String)request.getParameter("lot");
            
            request.setAttribute("leClient", idClient);
            request.setAttribute("leLot", idLot);
            
            this.getServletContext().getRequestDispatcher("/vues/enchere/ajouterEncherae.jsp" ).forward( request, response );
        }
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
