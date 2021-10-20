/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import Database.CourseDAO;
import forms.FormCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;



/**
 *
 * @author Zakina
 */
public class ServletCourse extends HttpServlet {
    
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
            out.println("<title>Servlet ServletCourse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCourse at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        
        String url = request.getRequestURI();
        // Récup et affichage par date décroissante de toutes les courses  
        if(url.equals("/equida/ServletCourse/listerLesCourses"))
        {  
            ArrayList<Course> lesCourses = CourseDAO.getLesCourses(connection);
            request.setAttribute("pLesCourses", lesCourses);
            getServletContext().getRequestDispatcher("/vues/course/listerLesCourses.jsp").forward(request, response);
      
        }else if (url.equals("/equida/ServletCourse/ajouterCourse")){
            
            ArrayList<Course> lesCourses = CourseDAO.getLesCourses(connection);
            request.setAttribute("pLesCourses", lesCourses);
            this.getServletContext().getRequestDispatcher("/vues/course/ajouterCourse.jsp" ).forward( request, response );
            
            
        }else if (url.equals("/equida/ServletCourse/courseDetail")){
            
             String cou_id = (String)request.getParameter("couId");
            
           Course laCourse = CourseDAO.getLaCourseById(connection , cou_id);
            request.setAttribute("pLaCourse", laCourse);
            this.getServletContext().getRequestDispatcher("/vues/course/courseDetail.jsp" ).forward( request, response );
            
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
        FormCourse form = new FormCourse();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Course uneCourse = form.ajouterUneCourse(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pCourse", uneCourse );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos 
            
            Course courseInsere =  CourseDAO.ajouterCourse(connection, uneCourse);
            if (courseInsere != null ){
                                           
                    String redirectURL = "../ServletCourse/courseDetail?couId=" + courseInsere.getId();
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
            ArrayList<Course> lesCourses = CourseDAO.getLesCourses(connection);
            request.setAttribute("pLesCourses", lesCourses);
            
           
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
