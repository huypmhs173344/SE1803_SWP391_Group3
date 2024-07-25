/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LAPTOP
 */
public class ProductDetail extends Product{
    private int quantity;
    private int totalprice;

    public ProductDetail() {
    }

    public ProductDetail(int pid, String pname, String image, int price,int quantity) {
        super(pid, pname, image, price);
        this.quantity = quantity;
    }

    
    public int getQuantity() {
        return quantity;
    }

    public int getTotalprice() {
        return quantity*super.getPrice();
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    @Override
    public String toString() {
        return "Product{" + "pid=" + super.getPid() + ", pname=" + super.getPname() + ", cid=" + super.getCid() + ", price=" + super.getPrice() + ", pdes=" + super.getPdes() + ", image=" + super.getImage() + ", status=" + super.getStatus() + '}';
    }
}
