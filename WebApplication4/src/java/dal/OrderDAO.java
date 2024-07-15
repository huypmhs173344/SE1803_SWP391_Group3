/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import model.Order;
import model.OrderShipping;

/**
 *
 * @author PC
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext db = new DBContext();

    public List<OrderShipping> getAllOrder() {
        List<OrderShipping> list = new ArrayList<>();
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "                from Orders join Shipping\n"
                + "                on Orders.order_id=Shipping.order_id";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderShipping> GetOrdersbyUserID(int key) {
        List<OrderShipping> list = new ArrayList<>();
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "  from Orders join Shipping\n"
                + "  on Orders.order_id=Shipping.order_id\n"
                + "  where Orders.user_id= ?";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, key);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public List<OrderShipping> GetOrdersbyName(String key) {
        List<OrderShipping> list = new ArrayList<>();
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "  from Orders join Shipping\n"
                + "  on Orders.order_id=Shipping.order_id\n"
                + "  where Shipping.name like ?";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setString(1,"%"+key+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteOrder(int oid) {
        String sql = " DELETE FROM [dbo].[Orders] "
                + " WHERE order_id = ?";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateOrder(int oid, int status, String note) {
        String query = "update Orders\n"
                + "set status = ?,\n"
                + "[note] = ?\n"
                + "where order_id = ?";
        try {
            PreparedStatement ps = db.connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setString(2, note);
            ps.setInt(3, oid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Order getOrderbyID(int oid) {
        String query = "select * from Orders where order_id = ? ";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, oid);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<OrderShipping> getSortedOrdersByDateOldtoNew() {
         List<OrderShipping> orders = getAllOrder();

        orders.sort(new Comparator<OrderShipping>() {
            @Override
            public int compare(OrderShipping o1, OrderShipping o2) {
                return o2.getDate().compareTo(o1.getDate()); // Sắp xếp từ mới nhất đến cũ nhất
            }
        });

        return orders;
        
    }

    public List<OrderShipping> getSortedOrdersByDateNewtoOld() {
       List<OrderShipping> orders = getAllOrder();

        orders.sort(new Comparator<OrderShipping>() {
            @Override
            public int compare(OrderShipping o1, OrderShipping o2) {
                return o1.getDate().compareTo(o2.getDate()); // Sắp xếp từ mới nhất đến cũ nhất
            }
        });

        return orders; 
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        List<OrderShipping> db= o.GetOrdersbyName("J");
       for(OrderShipping o1: db){
           System.out.println(o1);
       }   
       
    }
}
