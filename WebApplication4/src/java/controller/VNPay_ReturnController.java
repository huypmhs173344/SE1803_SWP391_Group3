package controller;


import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import API.VNPayConfig;

@WebServlet(name = "VNPay_ReturnController", urlPatterns = {"/VNPay_ReturnController"})
public class VNPay_ReturnController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        

        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        if ("00".equals(vnp_ResponseCode)) {
                       
            request.setAttribute("message", "Payment success");
        } else {
            request.setAttribute("message", "Payment failed");
        }

        request.getRequestDispatcher("PaymentResult.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "VNPay Return Controller";
    }
}