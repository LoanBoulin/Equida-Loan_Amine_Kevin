/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;


import static Database.CourseDAO.requete;
import static Database.CourseDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Course;


/**
 *
 * @author adminsio
 */
public class CourseDAO {
    
    
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    public static ArrayList<Course>  getLesCourses(Connection connection){    
    ArrayList<Course> lesCourses = new  ArrayList<Course>();
        try
        {
            
          //preparation de la requete     
            requete=connection.prepareStatement("select * from course");
            
            //executer la requete
            rs=requete.executeQuery();
            
             while ( rs.next() ) {  
                Course uneCourse = new Course();
              
                uneCourse.setId(rs.getInt("cou_id"));
                uneCourse.setNom(rs.getString("cou_nom"));
                uneCourse.setLieu(rs.getString("cou_lieu"));
                uneCourse.setDate(rs.getString("cou_date"));
            
                
                lesCourses.add(uneCourse);
    
                }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesCourses ;    
    } 


 public static Course ajouterCourse(Connection connection , Course uneCourse){
        
        int idGenere = -1;
        try 
        {
            
            requete = connection.prepareStatement("INSERT INTO COURSE(COU_NOM,COU_LIEU,COU_DATE)\n"+
                    "VALUES (?,?,?)" , requete.RETURN_GENERATED_KEYS);
            requete.setString(1,uneCourse.getNom());
            requete.setString(2,uneCourse.getLieu());
            requete.setString(3,uneCourse.getDate());
            

    
            requete.executeUpdate();
            
            rs=requete.getGeneratedKeys();
            while(rs.next() ){
                idGenere=rs.getInt(1);
                uneCourse.setId(idGenere);
            }
        }
    
        catch (SQLException e )
                {
                e.printStackTrace();
                }
            
                return uneCourse;
                
     
 }
 

 
    public static Course  getLaCourseById(Connection connection , String cou_id ){    
       Course laCourse = new  Course ();
     
        try
        {
            
          //preparation de la requete     
            requete=connection.prepareStatement("select * from course where cou_id = ? ");
            requete.setInt(1, Integer.parseInt(cou_id));
            //executer la requete
            rs=requete.executeQuery();
            
             while ( rs.next() ) {  
               
              
                laCourse.setId(rs.getInt("cou_id"));
                laCourse.setNom(rs.getString("cou_nom"));
                laCourse.setLieu(rs.getString("cou_lieu"));
                laCourse.setDate(rs.getString("cou_date"));
    
                }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return laCourse ;    
    } 

 
 
}

