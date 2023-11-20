/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bryda
 */
@WebServlet(name = "Ambulances", urlPatterns = {"/Ambulances"})
public class Ambulances extends HttpServlet {

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
            out.println("<title>Servlet Ambulances</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ambulances at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        String action = request.getParameter("action");
                switch(action){
                    case "add":
                        String plateNumber = request.getParameter("plateNumber");
                        if(!CompareValue(plateNumber)){
                            String institution = request.getParameter("institution");
                            String service = request.getParameter("service");
                            int institutionOption=0,serviceOption=0;
                            switch(institution){
                                case "10":
                                    institutionOption=1;

                                    break;
                                case "11":
                                    institutionOption=2;
                                    break;
                                case "12":
                                     institutionOption=3;
                                    break;
                                 case"13":
                                     institutionOption=4;
                                    break;
                            };
                            switch(service){
                                case "90":
                                    serviceOption=1;

                                    break;
                                case "91":
                                    serviceOption=2;
                                    break;
                                case "92":
                                     serviceOption=3;
                                    break;
                                 case"93":
                                     serviceOption=4;
                                    break;
                            };


            // Otros parámetros según tu formulario

            // Luego, realiza la inserción en la base de datos
                            boolean success = insertIntoDatabase(plateNumber, institutionOption, serviceOption);
                             if (success) {
                                response.getWriter().write("Inserción exitosa");
                            } else {
                                response.getWriter().write("Error en la inserción");
                            };
                            break;
                        }else{
                            response.getWriter().write("Registro repetido");
                        }
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

    private boolean insertIntoDatabase(String plateNumber, int institution,int  service) {
           try {
                // Configura la conexión a la base de datos
                String jdbcUrl = "jdbc:mysql://localhost:3306/bd_vv";
                String usuarioDB = "root";
                String claveDB = "Heatens123-";

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexion = DriverManager.getConnection(jdbcUrl, usuarioDB, claveDB);

                // Prepara la declaración SQL para la inserción
                String sql = "INSERT INTO ambulancias (am_placas, Institucion_ins_id,Disponibilidad_dis_id, Servicio_se_id) VALUES (?, ?, ?,?)";
                try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                    declaracion.setString(1, plateNumber);
                    declaracion.setInt(2, institution);
                     declaracion.setInt(3, 1);

                    declaracion.setInt(4, service);

                    // Ejecuta la inserción
                    int filasAfectadas = declaracion.executeUpdate();

                    // Verifica si la inserción fue exitosa
                    return filasAfectadas > 0;
                }
            } catch (ClassNotFoundException | SQLException e) {
                   return false; // Indica fallo
            }
    }
    
    
    private boolean CompareValue(String plateNumber) {
           try {
                // Configura la conexión a la base de datos
                String jdbcUrl = "jdbc:mysql://localhost:3306/bd_vv";
                String usuarioDB = "root";
                String claveDB = "Heatens123-";

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexion = DriverManager.getConnection(jdbcUrl, usuarioDB, claveDB);

                // Prepara la declaración SQL para la inserción
                 String sql = "SELECT * FROM ambulancias WHERE am_placas = ?";
                try (PreparedStatement consult = conexion.prepareStatement(sql)) {
                    consult.setString(1, plateNumber);
                    try (ResultSet resultado = consult.executeQuery()) {
                    if (resultado.next()) {
                        System.out.println("¡El registro está presente en la base de datos!");
                        return true;
                    } else {
                        System.out.println("El registro no se encontró en la base de datos.");
                        return false;
                    }
                    }

                   

                    
                }
            } catch (ClassNotFoundException | SQLException e) {
                   return false; // Indica fallo
            }
    

    }
}
