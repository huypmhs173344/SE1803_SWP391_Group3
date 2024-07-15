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
    
    public Categories selectCategory(int category_id) {
        Categories category = null;
        try {
            String sql = "SELECT category_id, category_name FROM Categories WHERE category_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, category_id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String category_name = rs.getString("category_name");
                category = new Categories(category_id, category_name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    public void insertCategory(Categories category) {
        try {
            String sql = "INSERT INTO Categories (category_name) VALUES (?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category.getCname());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Add category: " + e);
        }
    }

    public boolean updateCategory(Categories category) {
        boolean rowUpdated = false;
        try {
            String sql = "UPDATE Categories SET category_name = ? WHERE category_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category.getCname());
            preparedStatement.setInt(2, category.getCid());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public boolean deleteCategory(int category_id) {
        boolean rowDeleted = false;
        try {
            String sql = "DELETE FROM Categories WHERE category_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, category_id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowDeleted;
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
