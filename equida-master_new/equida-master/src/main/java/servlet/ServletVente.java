/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Database.CategVenteDAO;
import Database.LieuDAO;
import Database.VenteDAO;
import forms.FormVente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategVente;
import model.Lieu;
import model.Vente;

/**
 *
 * @author Zakina
 */
public class ServletVente extends HttpServlet {
    
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
            out.println("<title>Servlet ServletVente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletVente at " + request.getContextPath() + "</h1>");
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
        // R??cup et affichage par date d??croissante de toutes les ventes    
        if(url.equals("/equida/ServletVente/listerLesVentes"))
        {  
            ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
            request.setAttribute("pLesVentes", lesVentes);
            getServletContext().getRequestDispatcher("/vues/vente/listerLesVentes.jsp").forward(request, response);
      
        }else
            
        if(url.equals("/equida/ServletVente/venteDetail"))
        {  
            String venId = (String)request.getParameter("venId");
            Vente laVente = VenteDAO.getlaVente(venId, connection);
            
            request.setAttribute("vente", laVente);
            getServletContext().getRequestDispatcher("/vues/vente/venteDetail.jsp").forward(request, response);
      
        }else
            
        if(url.equals("/equida/ServletVente/listerCategVente"))
        {  
            ArrayList<CategVente> lesCategVente = CategVenteDAO.getLesCategVentes(connection);
            request.setAttribute("pLesCategVente", lesCategVente);
            
            this.getServletContext().getRequestDispatcher("/vues/vente/listerCategVente.jsp").forward(request, response);
        }else
        
         if(url.equals("/equida/ServletVente/ajouterVente"))
        {  
            ArrayList<Lieu> lesLieux = LieuDAO.getLesLieu(connection);
            ArrayList<CategVente> lesCategs = CategVenteDAO.getLesCategVentes(connection);
            
            request.setAttribute("lieux", lesLieux);
            request.setAttribute("categs", lesCategs);
            
            getServletContext().getRequestDispatcher("/vues/vente/ajouterVente.jsp").forward(request, response);
      
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
             /* Pr??paration de l'objet formulaire */
       
             FormVente form = new FormVente();
		
        /* Appel au traitement et ?? la validation de la requ??te, et r??cup??ration du bean en r??sultant */
        Vente uneVente = form.ajouterVente(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pVente", uneVente );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos 
            Vente venteInsere =  VenteDAO.ajouterVente(connection, uneVente);
            if (venteInsere != null ){
                                           
                    String redirectURL = "../ServletVente/venteDetail?venId=" + venteInsere.getId();
                    response.sendRedirect(redirectURL);
            }
            else 
            {
                // Cas o??l'insertion en bdd a ??chou??
                //renvoyer vers une page d'erreur 
            }
        }
        else
        { 
		// il y a des erreurs. On r??affiche le formulaire avec des messages d'erreurs
            request.setAttribute("pVente", uneVente);
            getServletContext().getRequestDispatcher("/vues/vente/ajouterVente.jsp").forward(request, response);
            
           
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
