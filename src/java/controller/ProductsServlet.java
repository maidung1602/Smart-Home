/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;


import dal.DAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author maidu
 */
@WebServlet(name="ProductsServlet", urlPatterns={"/products"})
public class ProductsServlet extends HttpServlet {
   
   
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
        DAO d = new DAO();
        ProductDAO pdb = new ProductDAO();
        String cid_raw = request.getParameter("cid");
        List<Product> products;
        try {
            int cid = Integer.parseInt(cid_raw);
            switch (cid) {
                case -1:
                    products = pdb.getHotSaleProduct(50);
                    break;
                case -2:
                    products = pdb.getHotProduct(50);
                    break;
                case -3:
                    products = pdb.getNewProduct(50);
                    break;
                default:
                    products = pdb.getProductByCid(cid);
                    request.setAttribute("num", products.size());
                    break;
            }
            if (products.isEmpty())
                request.getRequestDispatcher("searcherror.jsp").forward(request, response);
            int totalPage = (int) Math.ceil (products.size() / (double) NO_PER_PAGE);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("productsList", paginate(products, totalPage));
        } catch (Exception e) {
        }
        request.getRequestDispatcher("list.jsp").forward(request, response);
    } 
    private static final int NO_PER_PAGE = 12;

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
    
    private List<List<Product>> paginate(List<Product> products, int totalPage) {
        List<List<Product>> paginate = new ArrayList<>();
        for (int i = 0; i < totalPage - 1; i++) {
            paginate.add(
                    products.subList(i * NO_PER_PAGE, (i + 1) * NO_PER_PAGE));
        }
        if ((totalPage - 1) * NO_PER_PAGE < products.size()) {
            paginate.add(products.subList((totalPage - 1) * NO_PER_PAGE, products.size()));
        }
        return paginate;
    }

}
