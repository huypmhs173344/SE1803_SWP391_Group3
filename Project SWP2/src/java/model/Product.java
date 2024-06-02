package model;

import java.util.*;
import java.lang.*;

public class Product {

    int pid;
    String pname;
    int cid;
    int price;
    String pdes;
    String image;

    public Product() {
    }

    public Product(int pid, String pname, int cid, int price, String pdes, String image) {
        this.pid = pid;
        this.pname = pname;
        this.cid = cid;
        this.price = price;
        this.pdes = pdes;
        this.image = image;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPdes() {
        return pdes;
    }

    public void setPdes(String pdes) {
        this.pdes = pdes;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
