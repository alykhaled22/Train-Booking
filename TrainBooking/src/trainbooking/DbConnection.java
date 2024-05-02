/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package trainbooking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author O
 */
public class DbConnection {
    
    

    private static final String URL="jdbc:sqlserver://192.168.1.6:1433;database=TrainBooking;encrypt=true;trustservercertificate=true";
    private static final String UserName="yousuf";
    private static final String Password="1234";
    
    private  Connection connection = null;
    
    public  Connection getConnection(){
        
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        
        try
        {
            Class.forName(driver);
            connection = DriverManager.getConnection(URL,UserName,Password);
            if(connection == null){
                System.out.println("The connection is null");
            }else{
                System.out.println("The connection is not null");
            }
            
           
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("com.Models.Dbconnection.getConnection()"+e.getMessage());
        }
        return connection;

    }
    
    
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.out.println("Error.");

        }
    }
    
}
