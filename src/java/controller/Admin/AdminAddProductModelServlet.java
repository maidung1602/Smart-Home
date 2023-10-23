/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Admin;

import dal.ProductModelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductModel;

/**
 *
 * @author maidu
 */
public class AdminAddProductModelServlet extends HttpServlet {
   
    
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
        int id = Integer.parseInt(request.getParameter("product-id"));
        request.setAttribute("product_id", id);
        request.getRequestDispatcher("admin-add-productmodel.jsp").forward(request, response);
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
        int product_id = Integer.parseInt(request.getParameter("product-id"));
        String variant = request.getParameter("variant");
        int originPrice = Integer.parseInt(request.getParameter("origin-price"));
        int salePrice = Integer.parseInt(request.getParameter("sale-price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");
        
        ProductModel pm = new ProductModel(0, product_id, variant, image, originPrice, salePrice, quantity);
        ProductModelDAO pmdb = new ProductModelDAO();
        pmdb.addProductModel(pm);
        response.sendRedirect("admin-edit-product?id="+product_id);
        
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
