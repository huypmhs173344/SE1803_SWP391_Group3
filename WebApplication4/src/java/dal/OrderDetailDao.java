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
import model.Product;
import model.ProductDetail;

public class OrderDetailDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext db = new DBContext();

    public List<ProductDetail> getAllProductbyOrderDetail(int oid) {
        List<ProductDetail> list = new ArrayList<>();
        String query = "Select Products.product_id,product_name,image_url,Products.price, OrderDetails.quantity\n"
                + "from Orders join OrderDetails\n"
                + "on Orders.order_id= OrderDetails.order_id\n"
                + "join Products on OrderDetails.product_id=Products.product_id\n"
                + "where Orders.order_id= ? ";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(this.getProduct(rs));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ProductDetail getProduct(ResultSet rs) {
        try {
            int pid = rs.getInt("product_id");
            String pname = rs.getString("product_name");
            String image = rs.getString("image_url");
            int price = rs.getInt("price");
            int quantity = rs.getInt("quantity");
            return new ProductDetail(pid, pname, image, price, quantity);
        } catch (Exception e) {
            System.out.println("Get product: " + e);
        }
        return null;
    }
    public static void main(String[] args) {
        OrderDetailDao o = new OrderDetailDao();
        List<ProductDetail> h=o.getAllProductbyOrderDetail(1);
        for (ProductDetail productDetail : h) {
            System.out.println(productDetail.getImage());
        }
    }
}
