/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package trainbooking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author O
 */
public class Methods {
    
       
    private String Fname,Lname,email,password,phone;
    private int age;


    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLname(String Lname) {
        this.Lname = Lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
    
    
    
       
    public void insert(){

        DbConnection databaseConnection = new DbConnection();
        Connection connection = databaseConnection.getConnection();


        if (connection != null) {
            String insertQuery = "INSERT INTO CUSTOMER(FIRST_NAME,LAST_NAME,CUSTOMER_EMAIL,CUSTOMER_PASSWORD) VALUES (?,?,?,?)";

            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, "bakr");
                preparedStatement.setString(2, "bakr");
                preparedStatement.setString(3, "bakr");
                preparedStatement.setString(4, "bakr");

             
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Data inserted successfully.");
                } else {
                    System.out.println("No rows were affected.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            databaseConnection.closeConnection();
        }
    }
}
