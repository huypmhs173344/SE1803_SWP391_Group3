package dal;

import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.StatisticProduct;

public class DBStatistic extends DBContext {

    public List<StatisticProduct> StatisticProduct(String date) {
        List<StatisticProduct> list = new ArrayList<>();
        String sql = "select top(3) p.product_name, SUM(ood.money) as ren  from Products as p \n"
                + "join (select od.product_id, od.quantity*od.price as money from Orders as o\n"
                + "		join OrderDetails as od on o.order_id = od.order_id \n"
                + "		where o.date > '"+date+" 00:00:00' and o.date < '"+date+" 23:59:59') as ood on p.product_id = ood.product_id \n"
                + "group by p.product_name\n"
                + "order by ren desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StatisticProduct stc = new StatisticProduct(rs.getString(1),
                        rs.getInt(2));
                list.add(stc);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        DBStatistic db = new DBStatistic();
        List<StatisticProduct> list = db.StatisticProduct("2024-07-10");
        for (StatisticProduct statisticCate : list) {
            System.out.println(statisticCate.getPname());
        }
    }

}
