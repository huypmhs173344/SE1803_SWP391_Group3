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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SignupSeverlet", urlPatterns = {"/signup"})
public class SignupSeverlet extends HttpServlet {

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
            out.println("<title>Servlet SignupSeverlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupSeverlet at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("signup.jsp");
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
        DBContext db = new DBContext();
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        if (pass.isEmpty() || repass.isEmpty() || user.isEmpty() || phone.isEmpty() || email.isEmpty()) {
            request.setAttribute("f", "Nhap day du vao");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        try {
            if (db.findUser(user) == 0) {
                request.setAttribute("f", "Ton tai roi");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (checkacc(user, pass, repass)) {
            try {
                db.Signup(user, pass, phone, email);
            } catch (SQLException ex) {
                Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("login");
        } else {
            request.setAttribute("f", "Nhap sai roi nhap lai di");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
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

    private boolean checkacc(String user, String pass, String repass) {
        int t = 0;
        if (user.length() > 2 || user.length() < 30 || pass.length() > 2 || pass.length() < 30) {
            for (int i = 0; i < user.length(); i++) {
                if (user.charAt(i) > 32 && user.charAt(i) < 126) {
                    t = 1;
                    break;
                }
            }
            if (t == 0) {
                return false;
            }
            t = 0;
            for (int i = 0; i < pass.length(); i++) {
                if (user.charAt(i) > 32 && user.charAt(i) < 126) {
                    t = 1;
                    break;
                }
            }
            if (t == 0) {
                return false;
            }
        }
        if (pass.equals(repass)) {
            return true;
        }
        return false;
    }

}
