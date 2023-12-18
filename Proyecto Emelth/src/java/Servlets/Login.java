package Servlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import metods.conection;

/**
 *
 * @author bryda
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
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
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        /*String action = request.getParameter("action");
        System.out.println("si realizo la asignacion:"+ action);
        switch(action){
            case "add":
                System.out.println("Si realizo el switch");
                String password= request.getParameter("password");
                String email= request.getParameter("email");
                System.out.println("Asignaciones: "+password+" " +email);
                int success;
            try {
                success = validateCredentials(email,password);
                System.out.println(success);
                
               
                                 try {  PrintWriter out = response.getWriter();
                     response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");     
                  
                   JSONObject sucessObject = new JSONObject();
                    sucessObject.put("success",success); 
                              System.out.println(sucessObject);
                    out.print(sucessObject);
                    out.flush();                    
                } catch(IOException | JSONException e){
                
                    System.out.println(e);
                    
                }
            } catch (Exception ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
                   

            break;
            
            
            
            
        };*/
       
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
          try {
        // Lee los parámetros del cuerpo de la solicitud
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Realiza la validación y gestión de sesiones
        int success = validateCredentials(email, password);
        System.out.println(success);
        if (success > 0) {
            int id= getInt(email);
            // Sesión válida, puedes establecer atributos de sesión aquí
            request.getSession().setAttribute("userId", success);
            request.getSession().setAttribute("ID",id);
     
            
            // Enviar una respuesta JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            JSONObject successObject = new JSONObject();
            successObject.put("success", success);

            try (PrintWriter out = response.getWriter()) {
                out.print(successObject);
            }
        } else {
            // Envía una respuesta JSON indicando el fallo de autenticación
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            JSONObject errorObject = new JSONObject();
            errorObject.put("error", "Usuario o contraseña incorrectos");

            try (PrintWriter out = response.getWriter()) {
                out.print(errorObject);
            }
        }
    } catch (Exception ex) {
        Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);

        // Envía una respuesta JSON indicando un error en el servidor
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject errorObject = new JSONObject();
        errorObject.put("error", "Error en el servidor");

        try (PrintWriter out = response.getWriter()) {
            out.print(errorObject);
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

    private int validateCredentials(String email, String password) throws Exception {
         // Configura la conexión a la base de datos
         try{
             Connection conexion = con.Conection();
                
                String sql = "SELECT * FROM vistaUsuario WHERE xds = ?";
                  try (PreparedStatement consult = conexion.prepareStatement(sql)) {
                    consult.setString(1,email);
                    try (ResultSet resultado = consult.executeQuery()) {
                    if (resultado.next()) {
                        String passwordDatabase = resultado.getString("nhd");
                     
                        if (password.equals(passwordDatabase)){
                            int rol= resultado.getInt("Rol");
                            return rol;
                        }else{
                            return 0;
                        }
                        
                    } else {
                        System.out.println("El registro no se encontró en la base de datos.");
                        return 0;
                    }
                    }

                   

                    
                }
         }catch (ClassNotFoundException | SQLException e) {
                 
                   return 0; // Indica fallo
            }
    }
    private int getInt(String email) throws Exception{
        try{
            Connection conexion = con.Conection();
               String sql = "SELECT id FROM vistaUsuario WHERE xds = ?";
               try (PreparedStatement consult = conexion.prepareStatement(sql)) {
                    consult.setString(1,email);
                    try (ResultSet resultado = consult.executeQuery()) {
                    if (resultado.next()) {
                        int id = resultado.getInt("id");
                     
                       return id;
                        
                    } else {
                        System.out.println("El registro no se encontró en la base de datos.");
                        return 0;
                    }
                    }

                   

                    
                }
        
        }catch (ClassNotFoundException | SQLException e) {
                 
                   return 0; // Indica fallo
            }
  
    
    };
    

}
