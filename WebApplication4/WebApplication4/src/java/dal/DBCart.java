/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Cart;

/**
 *
 * @author nitro5
 */
public class DBCart extends DBContext {

    public void AddToCart(int user_id, int product_id) {

        String sql = "INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (?, ?, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, product_id);
            //st.setInt(3, quantity);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Cart> getCart(int id) {
        List<Cart> list = new ArrayList<>();
        String sql = "select p.product_id, p.product_name, p.category_id, p.price, p.description,p.image_url, c.quantity   from Products p "
                + "join Cart c on p.product_id = c.product_id "
                + "where user_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                list.add(c);

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void deleteCart(int uid, int pid) {
        String sql = " DELETE FROM [dbo].[Cart] "
                + " WHERE  user_id = ? and product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void moreQuantity(int uid, int pid) {
        String sql = " UPDATE Cart "
                + "SET quantity = quantity +1 "
                + "where user_id = ? and product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void lessQuantity(int uid, int pid) {
        String sql = " UPDATE Cart "
                + "SET quantity = quantity -1 "
                + "where user_id = ? and product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void createShipping(int order_id, String name, String phone, String address) {

        String sql = "insert[dbo].[Shipping] ([order_id],[name],[phone],[address]) VALUES (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            st.setString(2, name);
            st.setString(3, phone);
            st.setString(4, address);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void createOrder(int user_id, int total_money, int status, String date, String note, int isPay) {

        String sql = "insert into Orders ([user_id],[total_money],[status],[date],[note],[isPay]) "
                + "values (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, total_money);
            st.setInt(3, status);
            st.setString(4, date);
            st.setString(5, note);
            st.setInt(6, isPay);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void createOrderDetails(int order_id, int product_id, int quantity, int price) {

        String sql = "insert into OrderDetails ([order_id],[product_id],[quantity],[price])  values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            st.setInt(2, product_id);
            st.setInt(3, quantity);
            st.setInt(4, price);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int findMaxOrderID() {
        int order = 0;

        String sql = "SELECT MAX(order_id)  FROM Orders ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (Exception e) { System.out.println(order);
        }
        return order;
    }

    public static void main(String[] args) {
        DBCart db = new DBCart();
           
        
        db.findMaxOrderID();
        System.out.println(db.findMaxOrderID());
    }

}
