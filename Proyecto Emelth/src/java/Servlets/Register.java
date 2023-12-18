/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metods.conection;
import org.json.JSONObject;

/**
 *
 * @author bryda
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    conection con= new conection();

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
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
            String action =request.getParameter("action");
            String email,password,name,firstName,secondName,thridName;
            email= request.getParameter("email");
            password = request.getParameter("password");
       
           
            boolean success;
            switch(action){
                case"addUser":
                    try {
                           name= request.getParameter("name");
                         String[] partesNombre = name.split("\\s+");
                          firstName = partesNombre[0];
                         secondName = partesNombre[1];
                            thridName = partesNombre.length > 2 ? partesNombre[2] : "";
                         success = searchUser(email);
                        if(!success){
                            addUser(email, firstName, secondName, thridName, password,1);
                            response.getWriter().write("Inserción exitosa");
                        } else {
                            response.getWriter().write("no se agrego al usuario");
                        }
                    } catch (Exception ex) {
                            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
                    }
                break;
                case "addOper":
                    try {
                             firstName= request.getParameter("name");
                    
                   
                        secondName =request.getParameter("lastname");
                        thridName= request.getParameter("lastname2");
                        System.out.print(thridName);
                         success = searchUser(email);
                         if(!success){
                            addUser(email, firstName, secondName, thridName, password,3);
                            response.getWriter().write("Inserción exitosa");
                        } else {
                            response.getWriter().write("no se agrego al usuario");
                        }
                    } catch (Exception ex) {
                            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
                    }
                break;
            
            
            }

        try {
            
           

        } catch (Exception ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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
    
    private boolean searchUser(String email) throws Exception{
    
        Connection conexion = con.Conection();
         String sql = "SELECT * FROM vistaUsuario WHERE xds = ?";
         try (PreparedStatement consult = conexion.prepareStatement(sql)) {
                    consult.setString(1,email);
                    try (ResultSet resultado = consult.executeQuery()) {
                    if (resultado.next()) {
                      return true;
                    } else {
                        System.out.println("El registro no se encontró en la base de datos.");
                        return false;
                    }
                    }

                   

                    
                }
        

}
private boolean addUser(String email, String firstName, String secondName, String thirdName, String password,int rol) throws Exception {
    Connection conexion = con.Conection();
    String sql = "INSERT INTO Credenciales (cre_correo, cre_contrasena, cre_numero) VALUES (?, ?, ?)";
 
    String sql3 = "INSERT INTO usuario (us_nombre, us_apellido_materno, us_apellido_paterno, Credenciales_cre_id, Roles_ro_id) VALUES (?, ?, ?, ?, ?)";

    try (PreparedStatement consult = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        consult.setString(1, email);
        consult.setString(2, password);
        consult.setString(3, "");

 
        int rowsAffected = consult.executeUpdate();

        if (rowsAffected > 0) {
         
            try (ResultSet generatedKeys = consult.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int id = generatedKeys.getInt(1);

                    try (PreparedStatement consult3 = conexion.prepareStatement(sql3)) {
                        consult3.setString(1, firstName);
                        consult3.setString(2, secondName);
                        consult3.setString(3, thirdName);
                        consult3.setInt(4, id);
                        consult3.setInt(5, rol);
                   
                        int rowsAffected3 = consult3.executeUpdate();

                        conexion.close();

                        return rowsAffected3 > 0; 
                    }
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately (log or rethrow)
    } finally {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return false; // Return false in case of any failure
}

}
