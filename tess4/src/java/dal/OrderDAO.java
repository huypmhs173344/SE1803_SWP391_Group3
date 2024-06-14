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
/**
 *
 * @author PC
 */
public class OrderDAO {
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public List<Order> getAllOrder(){
        List<Order> list = new ArrayList<>();
        String query ="Select * from [Orders]";
        try{
           conn= new DBContext().connection;
           ps= conn.prepareStatement(query);
           rs=ps.executeQuery();
            while(rs.next()){
               list.add(new Order(rs.getString(1)
                       , rs.getString(2)
                       , rs.getInt(3)
                       , rs.getInt(4)
                       , rs.getString(5)
                       , rs.getString(6)
                       , rs.getString(7)));
            }
        }catch(Exception e){        
        }    
        return list;
    }
}
