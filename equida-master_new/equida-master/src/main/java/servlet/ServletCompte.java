/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Database.CategVenteDAO;
import Database.ClientDAO;
import Database.CompteDAO;
import Database.PaysDAO;
import Database.RoleDAO;
import Database.VenteDAO;
import forms.FormCompteClient;
import forms.FormComptePro;
import forms.FormConnexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CategVente;
import model.Client;
import model.Compte;
import model.Pays;
import model.Role;
import model.Vente;

/**
 *
 * @author adminsio
 */
public class ServletCompte extends HttpServlet {
    
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
            out.println("<title>Servlet ServletCompte</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCompte at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException{
            
             String url = request.getRequestURI();
        // Récup et affichage par date décroissante 
       
         
        if(url.equals("/equida/ServletCompte/profil"))
        {  
            
            String comId = request.getParameter("comId");
            Compte unCompte = CompteDAO.getCompte(connection, comId);
            
            request.setAttribute("pUnCompte" , unCompte);
                     
            getServletContext().getRequestDispatcher("/vues/compte/profil.jsp").forward(request, response);
      
        }else
        
        
        if(url.equals("/equida/ServletCompte/connexion"))
        {  
           
            getServletContext().getRequestDispatcher("/vues/compte/connexion.jsp").forward(request, response);
            
      
        }else
        if(url.equals("/equida/ServletClient/ajouterClient"))
        {                   
            ArrayList<Pays> lesPays = PaysDAO.getLesPays(connection);
            ArrayList<Role> lesRoles = RoleDAO.getLesRoles(connection);
            request.setAttribute("pLesPays", lesPays);
            request.setAttribute("pLesRoles", lesRoles);
            
            //ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            //request.setAttribute("pLesCategVente", lesCategVentes);
            this.getServletContext().getRequestDispatcher("/vues/client/ajouterClient.jsp" ).forward( request, response );
        }else
        
        if(url.equals("/equida/ServletCompte/ajouterCompteClient"))
        {                   
            ArrayList<Pays> lesPays = PaysDAO.getLesPays(connection);
            request.setAttribute("pLesPays", lesPays);
            
            //ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            //request.setAttribute("pLesCategVente", lesCategVentes);
            this.getServletContext().getRequestDispatcher("/vues/compte/ajouterCompteClient.jsp" ).forward( request, response );
        }else
        
        
        if(url.equals("/equida/ServletCompte/ajouterComptePro"))
        {                   
            ArrayList<Role> lesRoles = RoleDAO.getLesRoles(connection);
            request.setAttribute("pLesRoles", lesRoles);
            
            //ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            //request.setAttribute("pLesCategVente", lesCategVentes);
            this.getServletContext().getRequestDispatcher("/vues/compte/ajouterComptePro.jsp" ).forward( request, response );
        }else
        
        if(url.equals("/equida/ServletCompte/deconnexion"))
        {                   
            
            HttpSession session = request.getSession(true);
            session.setAttribute("login", false);   
            String redirectURL = "http://localhost:8080/equida/ServletCompte/connexion";
            response.sendRedirect(redirectURL);
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
        
            String url = request.getRequestURI();
            if(url.equals("/equida/ServletCompte/ajouterCompteClient"))
            {  
        
                /* Préparation de l'objet formulaire */
                FormCompteClient form = new FormCompteClient();

                /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
                Compte unCompte = form.ajouterCompteClient(request);

                /* Stockage du formulaire et de l'objet dans l'objet request */
                request.setAttribute( "form", form );
                request.setAttribute( "pClient", unCompte );

                if (form.getErreurs().isEmpty()){
                    // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
                    Compte compteInsere =  CompteDAO.ajouterCompteClient(connection, unCompte.getLeClient(), unCompte);
                    if (compteInsere != null ){
                        response.sendRedirect("../ServletAccueil/accueil?compte=1");
                    }
                    else 
                    {
                        response.sendRedirect("../ServletAccueil/accueil?compte=0");
                    }
                }
                else
                { 
                    // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
                    ArrayList<Pays> lesPays = PaysDAO.getLesPays(connection);
                    ArrayList<Role> lesRoles = RoleDAO.getLesRoles(connection);
                    request.setAttribute("pLesPays", lesPays);
                    request.setAttribute("pLesRoles", lesRoles);


                   this.getServletContext().getRequestDispatcher("/vues/compte/ajouterCompteClient.jsp" ).forward( request, response );
                   
                }
                
                
                
                
                
                
        }else if(url.equals("/equida/ServletCompte/ajouterComptePro")){
            
            
            
             /* Préparation de l'objet formulaire */
                FormComptePro form = new FormComptePro();

                /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
                Compte unCompte = form.ajouterComptePro(request);

                /* Stockage du formulaire et de l'objet dans l'objet request */
                request.setAttribute( "form", form );
                request.setAttribute( "pClient", unCompte );

                if (form.getErreurs().isEmpty()){
                    // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
                    Compte compteInsere =  CompteDAO.ajouterComptePro(connection, unCompte);
                    if (compteInsere != null ){
                         response.sendRedirect("../ServletAccueil/accueil?compte=1");
                    }
                    else 
                    {
                        response.sendRedirect("../ServletAccueil/accueil?compte=0");
                    }
                }
                else
                { 
                    // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
                    ArrayList<Role> lesRoles = RoleDAO.getLesRoles(connection);
                    request.setAttribute("pLesRoles", lesRoles);
                   
                   this.getServletContext().getRequestDispatcher("/vues/compte/ajouterComptePro.jsp" ).forward( request, response );
                   
                }
                
            
            
            
        }else if(url.equals("/equida/ServletCompte/connexion"))
            { 
                
                             
                
                /* Préparation de l'objet formulaire */
                FormConnexion form = new FormConnexion();

                /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
                Compte unCompte = form.recupererCompte(request);

                /* Stockage du formulaire et de l'objet dans l'objet request */
                request.setAttribute( "form", form );
                request.setAttribute( "pClient", unCompte );

                if (form.getErreurs().isEmpty()){
                    // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
                    unCompte = CompteDAO.verifCompte(connection, unCompte);  

                    if (unCompte == null){
                        
                        
                        HttpSession session = request.getSession(true);
                        session.setAttribute("login", false);                    

                        this.getServletContext().getRequestDispatcher("/vues/compte/connexion.jsp" ).forward( request, response );
                        
                    }
                    else 
                    {      
                        //Obtain the session object, create a new session if doesn't exist
                        HttpSession session = request.getSession(true);
                        session.setAttribute("login", true);       
                        session.setAttribute("compte", unCompte);

                        response.sendRedirect("../ServletAccueil/accueil");
                    }   
                                                                 
                }
                else
                { 
                    // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
                   this.getServletContext().getRequestDispatcher("/vues/connexion.jsp" ).forward( request, response );
                   
                }
                
                
                
                
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
