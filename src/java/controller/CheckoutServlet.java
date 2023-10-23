/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductModelDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import model.Order;
import model.ProductModel;
import model.User;

/**
 *
 * @author maidu
 */
public class CheckoutServlet extends HttpServlet {
   
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
        // add vao order va orderdetail
        OrderDAO odb = new OrderDAO();
        OrderDetailDAO oddb = new OrderDetailDAO();
        ProductModelDAO pmdb = new ProductModelDAO();
        
        HttpSession session=request.getSession();
        User a = (User) session.getAttribute("account");
        int userId = a.getId();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String total_raw = request.getParameter("total");
        int total = Integer.parseInt(total_raw);
        if (name ==null || name.equals("") ||
        phone ==null || phone.equals("") ||address ==null || address.equals("")){
            request.setAttribute("err", "Chưa nhập đủ thông tin");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
         } 
        Order o = new Order(0, userId, name, phone, address, null, 0, total);
        odb.insertOrder(o);
        
        String size_raw = request.getParameter("sizeOfCart");
        int size = Integer.parseInt(size_raw);
        int orderID = odb.getLastOrderId();
        String[] productModelId = request.getParameterValues("productModelId");
        String[] quantity = request.getParameterValues("quantity");
        String[] detailTotal = request.getParameterValues("detailTotal");
        for (int i = 0; i < size; i++) {
            oddb.insertOrderDetail(orderID, productModelId[i], quantity[i], detailTotal[i]);
            ProductModel pm = pmdb.getById(productModelId[i]);
            int soldQuantity = Integer.parseInt(quantity[i]);
            pmdb.updateQuantity(productModelId[i], pm.getQuantity()-soldQuantity);
        }
        Cookie cart = Arrays.stream(request.getCookies())
                .filter(c -> c.getName().equals("cart"))
                .findFirst().orElse(new Cookie("cart", ""));
        cart.setMaxAge(0);
        response.addCookie(cart);
        Cookie csize = Arrays.stream(request.getCookies())
                .filter(c -> c.getName().equals("csize"))
                .findFirst().orElse(new Cookie("csize", "0"));
        csize.setValue("0");
        response.addCookie(csize);
        request.getRequestDispatcher("thankyou.jsp").forward(request, response);
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
