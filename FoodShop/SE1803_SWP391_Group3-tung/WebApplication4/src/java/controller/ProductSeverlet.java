/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.DBHomeContext;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Categories;
import model.Product;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="ProductSeverlet", urlPatterns={"/product"})
public class ProductSeverlet extends HttpServlet {
   
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
            out.println("<title>Servlet ProductSeverlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductSeverlet at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");  
        request.setAttribute("name", u.getU_name());
        String action = request.getParameter("action");
        action = action != null ? action : "";
        switch (action) {
            case "add":
                this.addProductPage(request, response);
                break;
            case "edit":
                this.editProductPage(request, response);
                break;
            case "hidden":
                this.hiddenProduct(request, response);
                break;
            case "delete":
                this.deleteProduct(request, response);
                break;
            default:
                this.showAllProduct(request, response);
                break;
        }
    } 
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            int idProduct = 0;
            try {
                idProduct = Integer.parseInt(request.getParameter("id"));
            }catch(Exception e) {
                System.out.println("Parse id product: " + e);
            }
            ProductDAO productDao = new ProductDAO();
            int result = productDao.delete(idProduct);
            if(result > 0) {
                response.sendRedirect("product?message=Delete product successfully");
            } else {
                response.sendRedirect("product?message=Delete product fail");
            }
        } catch (Exception e) {
            System.out.println("Add product page: " + e);
        }
    }
    
    private void hiddenProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            int idProduct = 0;
            try {
                idProduct = Integer.parseInt(request.getParameter("id"));
            }catch(Exception e) {
                System.out.println("Parse id product: " + e);
            }
            ProductDAO productDao = new ProductDAO();
            String status = request.getParameter("isHidden");
            int result = productDao.updateStatus(status, idProduct);
            if(result > 0) {
                response.sendRedirect("product?message=Change status product successfully");
            } else {
                response.sendRedirect("product?message=Change status product fail");
            }
        } catch (Exception e) {
            System.out.println("Add product page: " + e);
        }
    }
    
    
    private void editProductPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            int idProduct = 0;
            try {
                idProduct = Integer.parseInt(request.getParameter("id"));
            }catch(Exception e) {
                System.out.println("Parse id product: " + e);
            }
            ProductDAO productDao = new ProductDAO();
            Product product = productDao.getProductByID(idProduct);
            DBHomeContext dbh = new DBHomeContext();
            request.setAttribute("listC", dbh.getAllCategory());
            request.setAttribute("product", product);
            request.getRequestDispatcher("/staff/product/edit.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Add product page: " + e);
        }
    }

    private void addProductPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            DBHomeContext dbh = new DBHomeContext();
            request.setAttribute("listC", dbh.getAllCategory());
            request.getRequestDispatcher("/staff/product/add.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Add product page: " + e);
        }
    }

    private void showAllProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO productDao = new ProductDAO();
            List<Product> products = productDao.getAll();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/staff/product/list.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Show product: " + e);
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
        String action = request.getParameter("action");
        action = action != null ? action : "";
        switch (action) {
            case "add":
                this.addNew(request, response);
                break;
            case "edit":
                this.edit(request, response);
                break;
            default:
                response.sendRedirect("product");
        }
    }
    private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            ProductDAO productDao = new ProductDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            String pname = request.getParameter("pname");
            int cid = Integer.parseInt(request.getParameter("category"));
            int price = Integer.parseInt(request.getParameter("price"));
            String pdes = request.getParameter("pdes");
            String image = request.getParameter("image");
            String status = request.getParameter("status");
            Product newProduct = new Product(id, pname, cid, price, pdes, image, status);
            int result = productDao.update(newProduct);
            if (result > 0) {
                response.sendRedirect("product?message=Update successfully");
            } else {
                response.sendRedirect("product?message=Update fail");
            }
        } catch (Exception e) {
            response.sendRedirect("product?message=Update fail");
            System.out.println("Add new product: " + e);
        }

    }

    private void addNew(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            ProductDAO productDao = new ProductDAO();
            String pname = request.getParameter("pname");
            int cid = Integer.parseInt(request.getParameter("category"));
            int price = Integer.parseInt(request.getParameter("price"));
            String pdes = request.getParameter("pdes");
            String image = request.getParameter("image");
            String status = request.getParameter("status");
            Product newProduct = new Product(0, pname, cid, price, pdes, image, status);
            int result = productDao.insert(newProduct);
            if (result > 0) {
                response.sendRedirect("product?message=Add new successfully");
            } else {
                response.sendRedirect("product?message=Add new fail");
            }
        } catch (Exception e) {
            response.sendRedirect("product?message=Add new fail");
            System.out.println("Add new product: " + e);
        }
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
