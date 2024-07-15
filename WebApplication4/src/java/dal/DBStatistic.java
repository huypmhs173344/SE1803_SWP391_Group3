package dal;

import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.StatisticCate;

public class DBStatistic extends DBContext {

    public List<StatisticCate> StatisticCate(String date) {
        List<StatisticCate> list = new ArrayList<>();
        String sql = "select pJc.category_name, SUM(ofJo.quantity) \n"
                + "from (select od.product_id,od.quantity from OrderDetails as od \n"
                + "		join Orders as o on od.order_id = o.order_id\n"
                + "		where o.date > '" + date + " 00:00:00' and o.date < '" + date + " 23:59:59') as ofJo\n"
                + "join (select p.product_id, c.category_name from Products as p  \n"
                + "		join Categories as c on p.category_id = c.category_id) as pJc on ofJo.product_id = pJc.product_id \n"
                + " Group by pJc.category_name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StatisticCate stc = new StatisticCate(rs.getString(1),
                        rs.getInt(2));
                list.add(stc);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        DBStatistic db = new DBStatistic();
        List<StatisticCate> list = db.StatisticCate("2024-07-10");
        for (StatisticCate statisticCate : list) {
            System.out.println(statisticCate.getCname());
        }
    }

}
