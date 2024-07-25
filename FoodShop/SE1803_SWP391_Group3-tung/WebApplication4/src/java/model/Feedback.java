/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author DUNGVT
 */
public class Feedback {
    int f_id;
    int u_id;
    String u_name;
    int p_id;
    String f_des;
    Date f_date;

    public Feedback() {
    }

    public Feedback(int f_id, int u_id, String u_name, int p_id, String f_des, Date f_date) {
        this.f_id = f_id;
        this.u_id = u_id;
        this.u_name = u_name;
        this.p_id = p_id;
        this.f_des = f_des;
        this.f_date = f_date;
    }

    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getF_des() {
        return f_des;
    }

    public void setF_des(String f_des) {
        this.f_des = f_des;
    }

    public Date getF_date() {
        return f_date;
    }

    public void setF_date(Date f_date) {
        this.f_date = f_date;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    @Override
    public String toString() {
        return "Feedback{" + "f_id=" + f_id + ", u_id=" + u_id + ", u_name=" + u_name + ", p_id=" + p_id + ", f_des=" + f_des + ", f_date=" + f_date + '}';
    }

    
   

    
    
}
