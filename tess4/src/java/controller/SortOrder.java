/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.OrderShipping;
import model.User;

/**
 *
 * @author LAPTOP
 */
public class SortOrder extends HttpServlet {

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
            out.println("<title>Servlet SortOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortOrder at " + request.getContextPath() + "</h1>");
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
        dal.OrderDAO odao = new OrderDAO();
        int index=Integer.parseInt(request.getParameter("index"));
        int count = odao.CountOrders();
        int pagesize = 5;
        int endpage = count / pagesize;
        if (count % pagesize != 0) {
            endpage++;
        }
        request.setAttribute("end", endpage);
        List<OrderShipping> i=odao.getAllOrder1(index);
        if (request.getParameter("id").equals("o")){            
            List<OrderShipping> list = odao.getSortedOrdersByDateNewtoOld(i);
            request.setAttribute("id", request.getParameter("id"));
            request.setAttribute("listO", list);
            request.getRequestDispatcher("SortByTime.jsp").forward(request, response);
        } else {
            List<OrderShipping> list = odao.getSortedOrdersByDateOldtoNew(i);
            request.setAttribute("id", request.getParameter("id"));
            request.setAttribute("listO", list);
            request.getRequestDispatcher("SortByTime.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
