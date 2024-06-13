/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    

    public static void main(String[] args) {
        DBCart db = new DBCart();
        List<Cart> list = new ArrayList<>();
        list = db.getCart(8);
        for (Cart cart : list) {
            System.out.println(cart.gettotal());
        }
        db.moreQuantity(8, 5);
db.AddToCart(8,7 );
    }

}
