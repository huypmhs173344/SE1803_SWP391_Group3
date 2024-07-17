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
        String query = "SELECT \n"
                + "    OrderDetails.product_id, \n"
                + "    Products.product_name,\n"
                + "	Products.image_url,\n"
                + "	Products.price,\n"
                + "    SUM(OrderDetails.quantity) AS quantity\n"
                + "    \n"
                + "FROM \n"
                + "    OrderDetails\n"
                + "JOIN \n"
                + "    Products ON OrderDetails.product_id = Products.product_id\n"
                + "JOIN \n"
                + "    Orders ON OrderDetails.order_id = Orders.order_id\n"
                + "WHERE \n"
                + "    OrderDetails.order_id = ?\n"
                + "GROUP BY \n"
                + "    OrderDetails.product_id, \n"
                + "    Products.product_name,\n"
                + "	Products.image_url,\n"
                + "	Products.price";
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

    public int CountAllProductbyOrderDetail(int oid) {
        String query = "SELECT \n"
                + "    COUNT(DISTINCT OrderDetails.product_id) AS distinct_product_count\n"
                + "FROM \n"
                + "    OrderDetails\n"
                + "JOIN \n"
                + "    Products ON OrderDetails.product_id = Products.product_id\n"
                + "JOIN \n"
                + "    Orders ON OrderDetails.order_id = Orders.order_id\n"
                + "WHERE \n"
                + "    OrderDetails.order_id = ? ;";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
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
        int count= o.CountAllProductbyOrderDetail(1);
            int pagesize=5;
            int endpage=count/pagesize;
            if(count%pagesize!=0){
                endpage++;
            }
            System.out.println(endpage);
        }
    }

