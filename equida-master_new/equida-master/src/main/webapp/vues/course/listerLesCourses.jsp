<%-- 
    Document   : listerLesVentes
    Created on : 18 août 2021, 16:52:29
    Author     : Zakina
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>
  
  
  
  
  <%
     ArrayList<Course> lesCourses= (ArrayList)request.getAttribute("pLesCourses");
  %>
  
  
  
  
  
  <!-- ======= Encheres Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row no-gutters">
            
             <% 
      
       

                for(int i = 0; i < lesCourses.size();i++)
                {
                    
                    Course uneCourse = lesCourses.get(i);
                        out.println("<div class='col-lg-4 col-md-6 content-item'><div class='divEnchere'><span>");
                            out.println(uneCourse.getNom());
                        out.println("</span><p>");
                            out.println(uneCourse.getLieu());
                        out.println("</p><h4 class='enchereDiv'>");
                            out.println(uneCourse.getDate());
                        out.println("</h4>");
                                              
                   
                        out.println("<a href ='../ServletCourse/courseDetail?couId="+ uneCourse.getId() + "'>");
                        out.println("Voir plus");
                        out.println("</a>");
                        
                        out.println("</div></div>");
                       
             }
             %>

          
        </div>

      </div>
    </section><!-- End Encheres Section -->
  
<%@include file="../components/footer.jsp" %>
