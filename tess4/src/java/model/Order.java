/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Order {
    private String order_id;
    private String user_id;
    private int total_money;
    private int status_id;
    private String date;
    private String address;
    private String note;

    public Order(String order_id, String user_id, int total_money, int status_id, String date, String address, String note) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.total_money = total_money;
        this.status_id = status_id;
        this.date = date;
        this.address = address;
        this.note = note;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", total_money=" + total_money + ", status_id=" + status_id + ", date=" + date + ", address=" + address + ", note=" + note + '}';
    }
    }
