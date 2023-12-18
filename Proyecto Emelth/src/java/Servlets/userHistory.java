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
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "userHistory", urlPatterns = {"/userHistory"})
public class userHistory extends HttpServlet {
      conection con= new conection();
        private List<JSONObject> User;
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
            out.println("<title>Servlet userHistory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userHistory at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if("getUser".equals(action)){
            try {
                 response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

            // Obtener el flujo de salida de la respuesta
                    PrintWriter out = response.getWriter();
                     User= new ArrayList<>();
                      getHistoryUsers();
                      out.print(User);
                    out.flush();
               
            } catch (Exception ex) {
                Logger.getLogger(userHistory.class.getName()).log(Level.SEVERE, null, ex);
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
       private void getHistoryUsers() throws Exception {
           
         // Configura la conexión a la base de datos
               Connection conect=con.Conection();
                
            String sql = "SELECT * FROM Operadores";

            try (PreparedStatement preparedStatement = conect.prepareStatement(sql)) {
                // Ejecutar la consulta
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    
                    // Procesar los resultados
                    while (resultSet.next()) {
                    
                      
                        int usId = resultSet.getInt("id");
                        String usName = resultSet.getString("nombre");
                        String usLastName1 = resultSet.getString("apellido_paterno");
                        String usLastName2 = resultSet.getString("apellido_materno");
                        String  usCorreo= resultSet.getString("correo");
                         JSONObject jsonRowUser = new JSONObject();
                          jsonRowUser.put("id",usId);
                         jsonRowUser.put("Name",usName);
                         
                          jsonRowUser.put("lastName1",usLastName1);
                          jsonRowUser.put("lastName2", usLastName2);
                          jsonRowUser.put("email",usCorreo);
                          User.add(jsonRowUser);
                       
                        
                    }
                 
                    
                }
            }
         catch (SQLException e) {
            e.printStackTrace();
        }
    

    }
}
