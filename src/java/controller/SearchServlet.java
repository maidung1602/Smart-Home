/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import model.Brand;
import model.Product;

/**
 *
 * @author maidu
 */
public class SearchServlet extends HttpServlet {

   
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
        BrandDAO bdb = new BrandDAO();
        ProductDAO pdb = new ProductDAO();
        String key = request.getParameter("key");
        String from_raw = request.getParameter("from_raw");
        String to_raw = request.getParameter("to_raw");
        String[] brand = request.getParameterValues("brand");
        String order = request.getParameter("order");
        List<Brand> brands = bdb.getBrandSearch(key);
        List<Product> products;
        int from, to;
        try {
            from = (from_raw == null || from_raw.equals(""))
                    ? 0 
                    : Integer.parseInt(from_raw);
            to = (to_raw == null || to_raw.equals(""))
                    ? 10000 
                    : Integer.parseInt(to_raw);
            products = pdb.getSearchFilter(key, from, to, brand, order);
            if (products.isEmpty())
                request.getRequestDispatcher("searcherror.jsp").forward(request, response);
            request.setAttribute("key", key);
            request.setAttribute("from_raw", from_raw);
            request.setAttribute("to_raw", to_raw);
            request.setAttribute("brandOptions", Arrays.stream(brand == null? new String[0] : brand).map(Integer::parseInt).collect(Collectors.toList()));
            request.setAttribute("order", order);
            request.setAttribute("brands", brands);
            int totalPage = (int) Math.ceil (products.size() / (double) NO_PER_PAGE);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("productsList", paginate(products, totalPage));
            request.setAttribute("num", products.size());
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
        }
    }
    private static final int NO_PER_PAGE = 12;

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
