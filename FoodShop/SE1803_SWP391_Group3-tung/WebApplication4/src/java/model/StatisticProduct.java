



package model;



import java.util.*;
import java.lang.*;

public class StatisticProduct {
    String pname;
    int revenue;

    public StatisticProduct() {
    }

    public StatisticProduct(String pname, int revenue) {
        this.pname = pname;
        this.revenue = revenue;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    
    
    
}
