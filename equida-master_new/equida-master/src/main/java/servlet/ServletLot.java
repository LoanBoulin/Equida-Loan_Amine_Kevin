/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Database.LotDAO;
import Database.ChevalDAO;
import Database.TypeChevalDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Lot;
import model.TypeCheval;

/**
 *
 * @author loanb
 */
public class ServletLot extends HttpServlet {
    
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLot</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLot at " + request.getContextPath() + "</h1>");
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
        if(url.equals("/equida/ServletLot/listerLesLotsByVente"))
        {  
            String venId = (String)request.getParameter("venId");
            
            //Récupération des lots
            ArrayList<Lot> lesLots = LotDAO.getLesLotsByVente(connection, venId);
            
            //Boucle Pour ajouter les chevaux et le type à chaque lot
            for(int i = 0; i < lesLots.size();i++)
                {
                    Lot unLot = lesLots.get(i);
                    
                    unLot.setLeCheval(ChevalDAO.getChevalByLotId(connection, unLot.getId() ));
                }
            
            //Récupération de tous les Types de chevaux
            ArrayList<TypeCheval> lesTypes = TypeChevalDAO.getTypesCheval(connection);
            
            //Mise en paramètres des arrayList
            request.setAttribute("pLesLots", lesLots);
            request.setAttribute("pLesTypes", lesTypes);
            
            getServletContext().getRequestDispatcher("/vues/lot/listerLesLotsByVente.jsp").forward(request, response);
      
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
        processRequest(request, response);
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
