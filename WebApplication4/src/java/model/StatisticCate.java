



package model;



import java.util.*;
import java.lang.*;

public class StatisticCate {
    String cname;
    int quanity;

    public StatisticCate() {
    }

    public StatisticCate(String cname, int quanity) {
        this.cname = cname;
        this.quanity = quanity;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }
    
    
}
