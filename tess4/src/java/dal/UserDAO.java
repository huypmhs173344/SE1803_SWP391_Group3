/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author LAPTOP
 */
public class UserDAO {
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    public List<User> getAllUser(){
        List<User> list = new ArrayList<>();
        String query ="SElect * from Users";
        try{
           conn= new DBContext().connection;
           ps= conn.prepareStatement(query);
           rs=ps.executeQuery();
            while(rs.next()){
               list.add(new User(rs.getInt(1)
                       , rs.getString(2)
                       , rs.getString(3)
                       , rs.getString(4)
                       , rs.getString(5)
                       , rs.getString(6)
                       , rs.getInt(7)
                       , rs.getString(8)
                       , rs.getInt(9)));
            }
        }catch(Exception e){        
        }    
        return list;
    }
}
