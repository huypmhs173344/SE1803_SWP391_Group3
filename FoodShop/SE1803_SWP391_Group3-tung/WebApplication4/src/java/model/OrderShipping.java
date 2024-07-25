/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LAPTOP
 */
public class OrderShipping extends Order{
    private String name;
    private String phone;
    private String address;
    private int row;

    public OrderShipping(int order_id, int user_id, int total_money, int status_id, String date, String note, int iPay,String name, String phone, String address, int row) {
        super(order_id, user_id, total_money, status_id, date, note, iPay);
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.row = row;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }
    public OrderShipping(int order_id, int user_id, int total_money, int status_id, String date, String note, int iPay,String name,String phone,String address) {
        super(order_id, user_id, total_money, status_id, date, note, iPay);
        this.name = name;
        this.phone = phone;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    @Override
    public String toString() {
        return "Order{" + "order_id=" + super.getOrder_id() + ", user_id=" + super.getUser_id() + ", total_money=" + super.getTotal_money() + ", status_id=" + super.getStatus_id() + ", date=" + super.getDate() + ", note=" + super.getNote() + ", iPay=" + super.getiPay() + '}';
    }
}
