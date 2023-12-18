/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package websocket;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.json.JSONObject;
 

/**
 *
 * @author bryda
 */
@ServerEndpoint("/endpoint")
public class websocketO {
     private static Map<String, Session> sessions = new HashMap<>();
      private static List<JSONObject> peticionesPendientes = new ArrayList<>();
    public void onOpen(Session session) throws IOException {
        
        System.out.println("Nueva conexión: " + session.getId());
        String sessionId =session.getId().toString();
       
        // Agregar la sesión a la lista de sesiones
        sessions.put(session.getId(), session);
        // Imprimir la lista de sesiones7
        JSONObject mensaje = new JSONObject();
        mensaje.put("sessionId", sessionId);

// Enviar el mensaje a través del WebSocket
    session.getBasicRemote().sendText(mensaje.toString());
 
    }

    @OnMessage
   public void onMessage(String message, Session session) throws IOException, SQLException  {
         System.out.println("Mensaje recibido: " + message);

        // Convertir el mensaje en objeto JSON
        JSONObject jsonMessage = new JSONObject(message);
         String tipo = jsonMessage.getString("tipo");
       
         
         if (tipo.equals("peticion")){  
             float lat= jsonMessage.getInt("lat");
         float lon= jsonMessage.getInt("lon");
         int id= jsonMessage.getInt("id");
           JSONObject jsonPeticion = new JSONObject();
                jsonPeticion.put("tipo", "peticion");
                jsonPeticion.put("lat", lat);
                jsonPeticion.put("lon", lon);
                jsonPeticion.put("id", id);
                 peticionesPendientes.add(jsonPeticion);
             System.out.println(peticionesPendientes);
                for (Session s : sessions.values()) {
            if (!s.getId().equals(session.getId())) {
                s.getBasicRemote().sendText(jsonPeticion.toString());
            }
            
             
            
            
        }
            
         
         }if (tipo.equals("obtener")){ 
            for (JSONObject peticion : peticionesPendientes) {
            session.getBasicRemote().sendText(peticion.toString());          
          }
         
         }
         
      
    }
    
}

