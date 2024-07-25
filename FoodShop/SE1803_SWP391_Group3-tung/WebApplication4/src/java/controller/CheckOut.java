/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBCart;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.User;


/**
 *
 * @author nitro5
 */
public class CheckOut extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOut</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               DBCart db = new DBCart();
        List<Cart> listCart = new ArrayList<>();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        listCart = db.getCart(u.getId());
        if(listCart.isEmpty()){
            request.setAttribute("mess", "Cart is empty");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        int subtotal = 0;
        for (Cart cart : listCart) {
            subtotal = subtotal +cart.gettotal();
        }
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("cart", listCart);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        boolean check_empty = false;

        if (name.equals("")) {
            request.setAttribute("message", "Please fill this field");
            check_empty = true;
        } else {
            request.setAttribute("name", name);
        }

        if (mobile.equals("")) {
            request.setAttribute("message1", "Please fill this field");
            check_empty = true;
        } else {
            request.setAttribute("mobile", mobile);
        }

        if (address.equals("")) {
            request.setAttribute("message2", "Please fill this field");
            check_empty = true;
        } else {
            request.setAttribute("addr", address);
        }

        if (check_empty == true) {
            doGet(request, response);
        }
        String note = request.getParameter("note");
        
        DBCart db = new DBCart();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
          // Lấy ngày giờ hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();
        
        // Định dạng ngày giờ theo mong muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        
        List<Cart> listCart = new ArrayList<>();
        listCart = db.getCart(u.getId());
        int subtotal = 0;
        for (Cart cart : listCart) {
            subtotal = subtotal +cart.gettotal();
        }
        
        db.createOrder(u.getId(), subtotal, 0, formattedDateTime, note, 0);
        
        int orderID;
        orderID = db.findMaxOrderID();
        
        db.createShipping(orderID, name, mobile, address);
        
        for (Cart cart : listCart) {
            db.createOrderDetails(orderID, cart.getProduct_id(), cart.getQuantity(), cart.gettotal());
        }
        db.deleteCartByUserId(u.getId());
        request.setAttribute("mess2", "Checkout Succesfull");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
