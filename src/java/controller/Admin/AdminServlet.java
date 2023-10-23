/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Admin;

import dal.CategoryDAO;
import dal.DAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;
import model.Category;
import model.ProductDTO;
import model.UserDTO;

/**
 *
 * @author maidu
 */
public class AdminServlet extends HttpServlet {
   
   
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
        LocalDate localDate = LocalDate.now();
        int curryear = localDate.getYear();
        int currmonth = localDate.getMonthValue();
         DAO d = new DAO();
        //money
        List<Integer> money = d.getMoneyByMonth(currmonth, curryear);
        request.setAttribute("money", money);
        //theo cate
        CategoryDAO cdb = new CategoryDAO();
        List<Category> cates = cdb.getCategories();
        request.setAttribute("cates", cates);
        
        List<Integer> cate = d.getCateByMonth(currmonth, curryear);
        request.setAttribute("cate", cate);
        // top user
        UserDAO udb = new UserDAO();
        List<UserDTO> hotusers = udb.getActiveUser(currmonth, curryear);
        request.setAttribute("hotusers", hotusers);
        // top product
        ProductDAO pdb = new ProductDAO();
        List<ProductDTO> hotpro = pdb.getHotProductByMonth(currmonth, curryear);
        request.setAttribute("hotpro", hotpro);
        
        request.setAttribute("month", currmonth);
        request.setAttribute("year", curryear);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
        DAO d = new DAO();
        int month = Integer.parseInt(request.getParameter("month")) ;
        int year = Integer.parseInt(request.getParameter("year")) ;
        //money
        List<Integer> money = d.getMoneyByMonth(month, year);
        request.setAttribute("money", money);
        
        //cate
        CategoryDAO cdb = new CategoryDAO();
        List<Category> cates = cdb.getCategories();
        request.setAttribute("cates", cates);
        List<Integer> cate = d.getCateByMonth(month, year);
        request.setAttribute("cate", cate);
        
        //top 5 user
        UserDAO udb = new UserDAO();
        List<UserDTO> hotusers = udb.getActiveUser(month, year);
        request.setAttribute("hotusers", hotusers);
        
        //top 5 product
        ProductDAO pdb = new ProductDAO();
        List<ProductDTO> hotpro = pdb.getHotProductByMonth(month, year);
        request.setAttribute("hotpro", hotpro);
        
        request.setAttribute("month", month);
        request.setAttribute("year", year);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
