/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ManaCateController", urlPatterns = {"/manacate"})
public class ManaCateController extends HttpServlet {

    private CategoryDAO categoriesDAO;

    public void init() {
        categoriesDAO = new CategoryDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "";
        try {
            switch (action) {
                case "insert":
                    insertCategory(request, response);
                    break;
                case "update":
                    updateCategory(request, response);
                    break;
                default:
                    listCategory(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "";
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        request.setAttribute("name", u.getU_name());
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "delete":
                    deleteCategory(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                default:
                    listCategory(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listCategory(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException, ServletException {
        List<Categories> listCategory = categoriesDAO.getCategories();
        request.setAttribute("listCategory", listCategory);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("category-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception, ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        Categories existingCategory = categoriesDAO.selectCategory(cid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category-form.jsp");
        request.setAttribute("category", existingCategory);
        dispatcher.forward(request, response);
    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException, ServletException {
        String cname = request.getParameter("cname");

        Categories newCategory = new Categories(0, cname);
        HttpSession session = request.getSession();
        try {
            if (categoriesDAO.isCategory(0, cname) != null) {
                session.setAttribute("message", "Category is exist!");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("manacate?action=list");
                return;
            }
            categoriesDAO.insertCategory(newCategory);
            session.setAttribute("message", "Category added successfully!");
            session.setAttribute("messageType", "success");
            response.sendRedirect("manacate?action=list");
        } catch (Exception e) {
            session.setAttribute("message", "Failed to add category. Please try again.");
            session.setAttribute("messageType", "danger");
            showNewForm(request, response);
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException, ServletException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        String cname = request.getParameter("cname");

        Categories category = new Categories(cid, cname);
        HttpSession session = request.getSession();
        try {
            if (categoriesDAO.isCategory(cid, cname) != null) {
                session.setAttribute("message", "Category is exist!");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("manacate?action=list");
                return;
            }
            categoriesDAO.updateCategory(category);
            session.setAttribute("message", "Category updated successfully!");
            session.setAttribute("messageType", "success");
            response.sendRedirect("manacate?action=list");
        } catch (Exception e) {
            session.setAttribute("message", "Failed to update category. Please try again.");
            session.setAttribute("messageType", "danger");
            showEditForm(request, response);
        }
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        HttpSession session = request.getSession();
        if (categoriesDAO.deleteCategory(cid)) {
            session.setAttribute("message", "Category deleted successfully!");
            session.setAttribute("messageType", "success");
        } else {
            session.setAttribute("message", "Failed to delete category. Please try again.");
            session.setAttribute("messageType", "danger");
        }
        response.sendRedirect("manacate?action=list");
    }

}
