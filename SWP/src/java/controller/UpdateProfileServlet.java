/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author DUNGVT
 */
public class UpdateProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String action = request.getParameter("action");
        int id_user = Integer.parseInt(request.getParameter("id"));
        DBContext db = new DBContext();
        User user = db.getUserById(id_user);

        if (action.equals("profile")) {
            String fname = request.getParameter("fname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("mail");
            String address = request.getParameter("addr");

            db.updateAccount(new User(id_user, user.getU_name(), user.getPass(),
                    fname, phone, address, user.getRole(), email, user.getStatus()));
            response.sendRedirect("profile?id=" + id_user);
        } else if (action.equals("pass")) {
            String cpass = request.getParameter("cpass");

            if (cpass.equals(user.getPass())) {
                String npass = request.getParameter("npass");
                if (npass.equals(cpass)) {
                    request.setAttribute("alert_false_npass", "New password cannot be same as old one! Try input again!");
                } else {
                    db.updateAccount(new User(id_user, user.getU_name(), npass,
                            user.getF_name(), user.getPhone(), user.getAddr(), user.getRole(), user.getMail(), user.getStatus()));
                    request.setAttribute("alert_true", "Password change successfully !!");
                }
            } else {
                request.setAttribute("alert_false_cpass", "Password incorrect! Try input again!");
            }
            request.setAttribute("u", user);
            request.setAttribute("active_nav_profile", "");
            request.setAttribute("active_nav_pass", "active");
            
            request.setAttribute("cpass", request.getParameter("cpass"));
            request.setAttribute("npass", request.getParameter("npass"));
            request.setAttribute("cnpass", request.getParameter("cnpass"));
            
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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

}
