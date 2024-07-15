/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
/**
 *
 * @author PC
 */
public class Order {
    private int order_id;
    private int user_id;
    private int total_money;
    private int status_id;
    private LocalDateTime date;
    private String note;
    private int iPay;

    public Order(int order_id, int user_id, int total_money, int status_id, String date, String note, int iPay) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.total_money = total_money;
        this.status_id = status_id;
        this.date = parseDateTime(date);
        this.note = note;
        this.iPay = iPay;
    }
    private LocalDateTime parseDateTime(String date) {
        DateTimeFormatter isoFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        DateTimeFormatter fallbackFormatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        DateTimeFormatter fallbackFormatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");

        try {
            return LocalDateTime.parse(date, isoFormatter);
        } catch (DateTimeParseException e) {
            try {
                return LocalDateTime.parse(date, fallbackFormatter1);
            } catch (DateTimeParseException ex) {
                return LocalDateTime.parse(date, fallbackFormatter2);
            }
        }
    }
    public LocalDateTime getDate() {
        return date;
    }
    

    public int getiPay() {
        return iPay;
    }

    public void setiPay(int iPay) {
        this.iPay = iPay;
    }
    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
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
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", total_money=" + total_money + ", status_id=" + status_id + ", date=" + date + ", note=" + note + ", iPay=" + iPay + '}';
    }

    
    }
