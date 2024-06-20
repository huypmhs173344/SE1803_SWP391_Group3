package model;


public class Product {

    int pid;
    String pname;
    int cid;
    int price;
    String pdes;
    String image;
    String status;

    public Product() {
    }

    public Product(int pid, String pname, int cid, int price, String pdes, String image, String status) {
        this.pid = pid;
        this.pname = pname;
        this.cid = cid;
        this.price = price;
        this.pdes = pdes;
        this.image = image;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
