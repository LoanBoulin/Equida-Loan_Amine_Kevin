/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Database.CategVenteDAO;
import Database.ChevalDAO;
import Database.ClientDAO;
import Database.EnchereDAO;
import Database.PaysDAO;
import Database.TypeChevalDAO;
import forms.FormCheval;
import forms.FormClient;
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
import model.Cheval;
import model.Client;
import model.Enchere;
import model.Pays;
import model.TypeCheval;

/**
 *
 * @author adminsio
 */
public class ServletCheval extends HttpServlet {
    
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
            out.println("<title>Servlet ServletCheval</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCheval at " + request.getContextPath() + "</h1>");
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
        // Récup et affichage par date décroissante de toutes les ventes    
        if(url.equals("/equida/ServletCheval/detailCheval"))
        {  
            String venId = (String)request.getParameter("Cheval");
            
            //Récupération du Cheval
            Cheval leCheval = ChevalDAO.getChevalById(connection, Integer.parseInt(venId));  
            
            //Récupération de 7 dernières enchères
            ArrayList<Enchere> lesEncheres = EnchereDAO.getLesEncheresByChevalLimit5(connection, venId);
           
            //Mise en paramètres
            request.setAttribute("plesEncheres", lesEncheres);
            request.setAttribute("pLeCheval", leCheval);
            
            getServletContext().getRequestDispatcher("/vues/cheval/detailCheval.jsp").forward(request, response);
      
        } else  if(url.equals("/equida/ServletCheval/ajouterCheval")){
        
            ArrayList<TypeCheval> lesTypes = TypeChevalDAO.getTypesCheval(connection);
            ArrayList<Cheval> lesChevauxHomme = ChevalDAO.getLesChevauxBySexe(connection, "M");
            ArrayList<Cheval> lesChevauxFemme = ChevalDAO.getLesChevauxBySexe(connection, "F");
            request.setAttribute("pLesChevauxH", lesChevauxHomme); 
            request.setAttribute("pLesChevauxF", lesChevauxFemme); 
            request.setAttribute("pLesTypes", lesTypes); 
            
        
            this.getServletContext().getRequestDispatcher("/vues/cheval/ajouterCheval.jsp" ).forward( request, response );
       
        
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
        FormCheval form = new FormCheval();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Cheval unCheval = form.ajouterUnCheval(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pCheval", unCheval );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos 
            Cheval chevalInsere =  ChevalDAO.ajouterCheval(connection, unCheval);
            if (chevalInsere != null ){
                                           
                    String redirectURL = "../ServletCheval/detailCheval?Cheval=" + chevalInsere.getId();
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
		// il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<Cheval> lesChevaux = ChevalDAO.getLesChevaux(connection);
            request.setAttribute("pLesChevaux", lesChevaux);
            
           
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

