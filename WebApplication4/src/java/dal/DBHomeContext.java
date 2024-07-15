package dal;

import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Categories;
import model.Product;

public class DBHomeContext extends DBContext {

    public List<Product> top2Seller() {
        List<Product> list = new ArrayList<>();
        String sql = "select TOP(2) p.product_id,p.product_name,p.category_id,p.price,p.description,p.image_url,p.status from(select product_id,SUM(quantity) as sumquantiny from OrderDetails "
                + "Group by product_id\n"
                + ") as sq\n"
                + "join Products as p on sq.product_id = p.product_id\n where status = 'True'"
                + "order by sq.sumquantiny desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> top8Seller() {
        List<Product> list = new ArrayList<>();
        String sql = "select TOP(8) p.product_id,p.product_name,p.category_id,p.price,p.description,p.image_url,p.status from(select product_id,SUM(quantity) as sumquantiny from OrderDetails "
                + "Group by product_id\n"
                + ") as sq\n"
                + "join Products as p on sq.product_id = p.product_id\n where status = 'True'"
                + "order by sq.sumquantiny desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
        public List<Categories> getAllCategory() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from Categories ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getInt(1), rs.getString(2)) {
                };
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
        
        public List<Product> getProductByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where category_id = ? and status = 'True'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
        
        public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where status = 'True'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        DBHomeContext db = new DBHomeContext();
        List<Product> list = new ArrayList<>();
        list = db.top8Seller();
        int i = 0;
        for (Product product : list) {
            i++;
            System.out.println(product.getImage()+i);
        }
        
    }
    
}
