package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.User;


public class DBContext {

    protected Connection connection;

    public DBContext() {        
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=FoodShop2";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserById(int idAcc) {
        String sql = "SELECT * FROM [dbo].[Users]"
                + "      WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idAcc);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getInt(9));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void deleteAnAccountById(int idAcc) {
        String sql = "DELETE FROM [dbo].[Users]"
                + "      WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idAcc);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateAccount(User user) {
        String sql = "UPDATE [dbo].[Users]"
                + "   SET [username] = ?"
                + "      ,[password] = ?"
                + "      ,[full_name] = ?"
                + "      ,[phone_number] = ?"
                + "      ,[address] = ?"
                + "      ,[Role] = ?"
                + "      ,[gmail] = ?"
                + "      ,[status] = ?"
                + " WHERE [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getU_name());
            ps.setString(2, user.getPass());
            ps.setString(3, user.getF_name());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddr());
            ps.setInt(6, user.getRole());
            ps.setString(7, user.getMail());
            ps.setInt(8, user.getStatus());
            ps.setInt(9, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM USERS";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getInt(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    
    public int findMaxId() throws SQLException {
        String sql = "select MAX(user_id) from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }
        return 0;
    }
    
    public int findUser(String user) throws SQLException {
        String sql = "select * from Users where Users.username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return 0;
            }
        } catch (SQLException e) {

        }
        return 1;
    }
    
    public void Signup(String name, String pass, String phone, String email) throws SQLException {
        String sql = "insert into Users(user_id, username, password, phone_number, gmail, Role, status) "
                + "values(?,?,?,?,?,2,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, findMaxId() + 1);
            st.setString(2, name);
            st.setString(3, pass);
            st.setString(4, phone);
            st.setString(5, email);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }
    
    public List<Feedback> getFeedbackByPid(int pid) {
        List<Feedback> list = new ArrayList<>();
        String sql = """
                     SELECT [feedback_id],
                     Feedback.user_id,
                     Users.full_name
                           ,[product_id]
                           ,[description]
                           ,[feedback_date]
                       FROM [dbo].[Feedback] JOIN Users ON Feedback.user_id = Users.user_id WHERE Feedback.product_id = ? """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getString(3), pid, rs.getString(5), rs.getDate(6)));
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public void createFeedback(int u_id, int p_id, String des) {
        String sql = """
                     INSERT INTO [dbo].[Feedback]
                                ([user_id]
                                ,[product_id]
                                ,[description]
                                ,[feedback_date])
                          VALUES
                                (?           ,?           ,?           ,GETDATE())""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, u_id);
            ps.setInt(2, p_id);
            ps.setString(3, des);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
}
