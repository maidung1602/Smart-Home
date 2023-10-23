/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BrandDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Brand;

/**
 *
 * @author maidu
 */
public class BrandServlet extends HttpServlet {
   
    
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
        BrandDAO bdb = new BrandDAO();
        List<Brand> brands = bdb.getAllBrand();
        int totalPage = (int) Math.ceil(brands.size() / (double) NO_PER_PAGE);
        request.setAttribute("brandsList", paginate(brands, totalPage));
        request.getRequestDispatcher("brands.jsp").forward(request, response);
    } 
    
    private static final int NO_PER_PAGE = 4;
    
    private List<List<Brand>> paginate(List<Brand> brands, int totalPage) {
        List<List<Brand>> paginate = new ArrayList<>();
        for (int i = 0; i < totalPage - 1; i++) {
            paginate.add(
                    brands.subList(i * NO_PER_PAGE, (i + 1) * NO_PER_PAGE));
        }
        if ((totalPage - 1) * NO_PER_PAGE < brands.size()) {
            paginate.add(brands.subList((totalPage - 1) * NO_PER_PAGE, brands.size()));
        }
        return paginate;
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
