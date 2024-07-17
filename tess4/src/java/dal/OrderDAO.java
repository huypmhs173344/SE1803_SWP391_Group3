/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import model.Order;
import model.OrderShipping;

/**
 *
 * @author PC
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext db = new DBContext();

    public List<OrderShipping> getAllOrder() {
        List<OrderShipping> list = new ArrayList<>();
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "                from Orders join Shipping\n"
                + "                on Orders.order_id=Shipping.order_id";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int CountOrders() {
        String query = "with x as(\n"
                + "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address,ROW_NUMBER() over(order by Orders.order_id) as r\n"
                + "from Orders join Shipping\n"
                + "on Orders.order_id=Shipping.order_id)\n"
                + "select COUNT(*) as count from x";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<OrderShipping> getAllOrder1(int index) {
        List<OrderShipping> list = new ArrayList<>();
        String query = "with x as(\n"
                + "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address,ROW_NUMBER() over(order by Orders.order_id) as r\n"
                + "from Orders join Shipping\n"
                + "on Orders.order_id=Shipping.order_id)\n"
                + "select * from x where r between ?*5-4 and ?*5";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, index);
            st.setInt(2, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderShipping> GetOrdersbyUserID(int key) {
        List<OrderShipping> list = new ArrayList<>();
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "  from Orders join Shipping\n"
                + "  on Orders.order_id=Shipping.order_id\n"
                + "  where Orders.user_id= ?";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, key);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderShipping> GetOrdersbyUserID2(int key, int index, int size) {
        List<OrderShipping> list = new ArrayList<>();
        String query = "with x as(Select  Orders.*,Shipping.name,Shipping.phone,Shipping.address,ROW_NUMBER() over(order by Orders.order_id) as r \n"
                + "from Orders join Shipping\n"
                + "on Orders.order_id=Shipping.order_id\n"
                + "where Orders.user_id= ?)\n"
                + "select * from x where r between ?*5-4 and ?*5";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, key);
            st.setInt(2, index);
            st.setInt(3, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int CountOrdersbyUserID(int key) {
        String query = "Select count(*) as count\n"
                + "from Orders join Shipping\n"
                + "on Orders.order_id=Shipping.order_id\n"
                + "where Orders.user_id= ?";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, key);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<OrderShipping> GetOrdersbyName(String key) {
        List<OrderShipping> list = new ArrayList<>();
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "  from Orders join Shipping\n"
                + "  on Orders.order_id=Shipping.order_id\n"
                + "  where Shipping.name like ?";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteOrder(int oid) {
        String sql = " DELETE FROM [dbo].[Orders] "
                + " WHERE order_id = ?";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateOrder(int oid, int status) {
        String query = "update Orders\n"
                + "set status = ?\n"
                + "where order_id=?";
        try {
            PreparedStatement ps = db.connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, oid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public OrderShipping getOrderbyID(int oid) {
        String query = "Select Orders.*,Shipping.name,Shipping.phone,Shipping.address\n"
                + "from Orders join Shipping\n"
                + "on Orders.order_id=Shipping.order_id\n"
                + "where Orders.order_id= ?";
        try {
            PreparedStatement st = db.connection.prepareStatement(query);
            st.setInt(1, oid);
            rs = st.executeQuery();
            while (rs.next()) {
                return new OrderShipping(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<OrderShipping> getSortedOrdersByDateOldtoNew(List<OrderShipping> orders) {

        orders.sort(new Comparator<OrderShipping>() {
            @Override
            public int compare(OrderShipping o1, OrderShipping o2) {
                return o2.getDate().compareTo(o1.getDate()); // Sắp xếp từ mới nhất đến cũ nhất
            }
        });

        return orders;

    }

    public List<OrderShipping> getSortedOrdersByDateNewtoOld(List<OrderShipping> orders) {

        orders.sort(new Comparator<OrderShipping>() {
            @Override
            public int compare(OrderShipping o1, OrderShipping o2) {
                return o1.getDate().compareTo(o2.getDate()); // Sắp xếp từ mới nhất đến cũ nhất
            }
        });

        return orders;
    }

    public List<OrderShipping> getSortedOrdersByPrice1(List<OrderShipping> orders) {

        orders.sort((o1, o2) -> Integer.compare(o2.getTotal_money(), o1.getTotal_money())); // Sắp xếp từ giá cao nhất đến thấp nhất

        return orders;
    }

    public List<OrderShipping> getSortedOrdersByPrice2(List<OrderShipping> orders) {

        orders.sort(Comparator.comparingInt(Order::getTotal_money)); // Sắp xếp từ giá thấp nhất đến cao nhất

        return orders;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        o.updateOrder(6, 1);
        OrderShipping order = o.getOrderbyID(6);
        System.out.println(order);
    }
}
