/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author HP
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends DBContext {

    private Connection conn;

    public ProductDAO() {
        try {
            this.conn = connection;
        } catch (Exception e) {
            System.out.println("Get connection: " + e);
        }
    }

    public List<Product> searchProduct(String key, int pageNumber, int pageSize) {
        List<Product> products = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM Products WHERE product_name LIKE ? and status = 'True' ORDER BY product_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            st.setInt(2, offset);
            st.setInt(3, pageSize);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(this.getProduct(rs));
            }
        } catch (Exception e) {
            System.out.println("Get product: " + e);
        }
        return products;
    }

    public List<Product> searchAllProduct(String key) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE product_name LIKE ? and status = 'True'";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(this.getProduct(rs));
            }
        } catch (Exception e) {
            System.out.println("Get product: " + e);
        }
        return products;
    }

    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Products ORDER BY product_id DESC";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(this.getProduct(rs));
            }
        } catch (Exception e) {
            System.out.println("Get product: " + e);
        }
        return products;
    }

    public Product getProductByID(int id) {
        String sql = "SELECT * FROM Products WHERE product_id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet result = st.executeQuery();
            if (result.next()) {
                return this.getProduct(result);
            }
        } catch (SQLException e) {
            System.out.println("Get product by id: " + e);
        }
        return null;
    }

    public Product getProduct(ResultSet rs) {
        try {
            int pid = rs.getInt("product_id");
            String pname = rs.getString("product_name");
            int cid = rs.getInt("category_id");
            int price = rs.getInt("price");
            String pdes = rs.getString("description");
            String image = rs.getString("image_url");
            String status = rs.getString("status");
            return new Product(pid, pname, cid, price, pdes, image, status);
        } catch (Exception e) {
            System.out.println("Get product: " + e);
        }
        return null;
    }

    public int insert(Product p) {
        int result = 0;
        String sql = "INSERT INTO Products (product_name, category_id, price, description, image_url, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            int i = 1;
            st.setString(i++, p.getPname());
            st.setInt(i++, p.getCid());
            st.setInt(i++, p.getPrice());
            st.setString(i++, p.getPdes());
            st.setString(i++, p.getImage());
            st.setString(i++, p.getStatus());
            result = st.executeUpdate();
            if (result > 0) {
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                } catch (SQLException e) {
                    System.out.println("Get generated keys: " + e);
                }
            }
        } catch (SQLException e) {
            System.out.println("Add product: " + e);
        }
        return 0;
    }

    public int update(Product p) {
        int result = 0;
        String sql = "UPDATE Products SET product_name=?, category_id=?, price=?, description=?, image_url=?, status=? "
                + "WHERE product_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setString(i++, p.getPname());
            st.setInt(i++, p.getCid());
            st.setInt(i++, p.getPrice());
            st.setString(i++, p.getPdes());
            st.setString(i++, p.getImage());
            st.setString(i++, p.getStatus());
            st.setInt(i++, p.getPid());

            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Update product: " + e);
        }
        return result;
    }

    public int updateStatus(String status, int id) {
        int result = 0;
        String sql = "UPDATE Products SET status=? "
                + "WHERE product_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setString(i++, status);
            st.setInt(i++, id);

            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Update product: " + e);
        }
        return result;
    }

    public int delete(int id) {
        int result = 0;
        String sql = "DELETE FROM Products WHERE product_id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Delete product: " + e);
        }
        return result;
    }

    public List<Product> getProductbyCateSort(int category_id, String product_name, String sort) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Products "
                + "where category_id = ? and product_name like '%"+product_name+"%' "
                + "order by price ";
        if(sort.equalsIgnoreCase("desc")){
            sql += sort;
        }

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, category_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(this.getProduct(rs));
            }
        } catch (SQLException e) {

        }
        return products;
    }

    public static void main(String[] args) {
        ProductDAO db = new ProductDAO();
        List<Product> products = new ArrayList<>();
        products = db.getProductbyCateSort(1, "c", "desc");
        for (Product product : products) {
            System.out.println(product.getPname());
        }
    }
}
