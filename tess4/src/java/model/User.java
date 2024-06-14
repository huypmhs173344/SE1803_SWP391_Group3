



package model;



import java.util.*;
import java.lang.*;

public class User {
    int id;
    String u_name;
    String pass;
    String f_name;
    String phone;
    String addr;
    int role;
    String mail;
    int status;

    public User() {
    }

    public User(int id, String u_name, String pass, String f_name, String phone, String addr, int role, String mail, int status) {
        this.id = id;
        this.u_name = u_name;
        this.pass = pass;
        this.f_name = f_name;
        this.phone = phone;
        this.addr = addr;
        this.role = role;
        this.mail = mail;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getF_name() {
        return f_name;
    }

    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public int getRole() {
        return role;
    }
    public void setRole(int role) {
        this.role = role;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
