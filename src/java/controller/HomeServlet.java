/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import dal.SubcategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;
import model.Subcategory;

/**
 *
 * @author maidu
 */
public class HomeServlet extends HttpServlet {
   
    
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
        ProductDAO pdb = new ProductDAO();
        SubcategoryDAO sdb = new SubcategoryDAO();
        
        List<Subcategory> subhot = sdb.getSubHot();
        
        List<Product> hotSaleProducts = pdb.getHotSaleProduct(12);
        List<Product> hotSaleProducts1 = pdb.getListByPage(hotSaleProducts, 0, 4);
        List<Product> hotSaleProducts2 = pdb.getListByPage(hotSaleProducts, 4, 8);
        List<Product> hotSaleProducts3 = pdb.getListByPage(hotSaleProducts, 8, 12);
        
        List<Product> hotProducts = pdb.getHotProduct(8);
        
        List<Product> newProducts = pdb.getNewProduct(12);
        List<Product> newProducts1 = pdb.getListByPage(newProducts, 0, 4);
        List<Product> newProducts2 = pdb.getListByPage(newProducts, 4, 8);
        List<Product> newProducts3 = pdb.getListByPage(newProducts, 8, 12);
        
        request.setAttribute("subhot", subhot);
        request.setAttribute("hotSaleProducts1", hotSaleProducts1);
        request.setAttribute("hotSaleProducts2", hotSaleProducts2);
        request.setAttribute("hotSaleProducts3", hotSaleProducts3);
        request.setAttribute("hotProducts", hotProducts);
        request.setAttribute("newProducts1", newProducts1);
        request.setAttribute("newProducts2", newProducts2);
        request.setAttribute("newProducts3", newProducts3);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
