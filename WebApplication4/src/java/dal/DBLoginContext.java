



package dal;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class DBLoginContext extends DBContext{
    
    
    public User login(String user, String pass) throws SQLException {
        String sql = "select * from Users where Users.username = ? and Users.password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
            }

        } catch (SQLException e) {

        }
        return null;
    }
    
    public static void main(String[] args) throws SQLException {
        DBLoginContext db = new DBLoginContext();
        User u = new User();
        u = db.login("admin", "huy123");
        System.out.println(u.getU_name());
    }
}
