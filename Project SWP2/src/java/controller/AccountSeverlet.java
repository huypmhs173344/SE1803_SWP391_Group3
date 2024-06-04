/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="AccountSeverlet", urlPatterns={"/account"})
public class AccountSeverlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AccountSeverlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountSeverlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DBContext db = new DBContext();
        String action = request.getParameter("action") == null ? "none" : request.getParameter("action");
        int idAcc = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));

        switch (action) {
            case "update" -> {
                User user = db.getUserById(idAcc);
                request.setAttribute("u", user);
                request.getRequestDispatcher("UpdateAccount.jsp").forward(request, response);
            }
            case "delete" -> {
                db.deleteAnAccountById(idAcc);
                response.sendRedirect("account");
            }
            default -> {
                List<User> list = db.getAllUser();
                request.setAttribute("listA", list);
                request.getRequestDispatcher("listAccount.jsp").forward(request, response);
            }
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DBContext db = new DBContext();
        int id = Integer.parseInt(request.getParameter("id"));

        User user = db.getUserById(id);

        int role = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));

        db.updateAccount(new User(id, user.getU_name(),
                 user.getPass(), user.getF_name(),
                user.getPhone(), user.getAddr(), role,
                user.getMail(), status));

        response.sendRedirect("account");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
