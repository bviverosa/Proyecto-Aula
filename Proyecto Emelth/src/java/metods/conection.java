/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package metods;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author bryda
 */
public class conection {
    public Connection Conection() throws Exception{
                String jdbcUrl = "jdbc:mysql://localhost:3306/bd_vv";
                String usuarioDB = "root";
                String claveDB = "Heatens123-";

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexion = DriverManager.getConnection(jdbcUrl, usuarioDB, claveDB);
                return conexion;
    
    }
}
