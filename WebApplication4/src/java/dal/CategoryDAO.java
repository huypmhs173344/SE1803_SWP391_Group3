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
import model.Categories;
import model.Product;

/**
 *
 * @author HP
 */
public class CategoryDAO extends DBContext{

    private Connection conn;

    public CategoryDAO() {
        try {
            this.conn = connection;
        }catch(Exception e) {
            System.out.println("Get connection: " + e);
        }
    }
    
    public List<Categories> getCategories() {
        String sql = "select * from categories";
        List<Categories> categories = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                categories.add(this.getCategory(rs));
            }
        } catch (Exception e) {
            System.out.println("Get categories: " + e);
        }
        return categories;
    }
    
    public Categories getCategory(ResultSet rs) {
        try {
            int pid = rs.getInt("cid");
            String pname = rs.getString("cname");
            return new Categories(pid, pname);
        } catch (Exception e) {
            System.out.println("Get category: " + e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        CategoryDAO db = new CategoryDAO();
        List<Categories> categories = new ArrayList<>();
        categories = db.getCategories();
        for (Categories category : categories) {
            System.out.println(category.getCname());
        }
    }
}
