/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nitro5
 */
public class Cart {

    int product_id;
    String product_name;
    int cate_id;
    int product_price;
    String product_des;
    String product_image;
    int quantity;
    

    public Cart() {
    }

    public Cart(int product_id, String product_name, int cate_id, int product_price, String product_des, String product_image, int quantity) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.cate_id = cate_id;
        this.product_price = product_price;
        this.product_des = product_des;
        this.product_image = product_image;
        this.quantity = quantity;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public String getProduct_des() {
        return product_des;
    }

    public void setProduct_des(String product_des) {
        this.product_des = product_des;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int gettotal() {
        return  quantity * product_price;
    }
}
