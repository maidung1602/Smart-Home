/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import ulti.MD5Hash;

/**
 *
 * @author maidu
 */
public class ChangePasswordServlet extends HttpServlet {
   
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
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
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
        String id_raw = request.getParameter("id");
        String curr = request.getParameter("curr");
        String newpass = request.getParameter("new");
        String renew = request.getParameter("renew");
        try {
            int id =Integer.parseInt(id_raw);
            HttpSession session=request.getSession();
            User a= (User) session.getAttribute("account");
            UserDAO udb = new UserDAO();
            if (MD5Hash.hash(curr).equalsIgnoreCase(a.getPassword()) && newpass.equals(renew)){
                
                udb.updatePass(id, MD5Hash.hash(newpass));
                a.setPassword(newpass);
                request.setAttribute("ms", "Cập nhật mật khẩu thành công");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            } else if (!MD5Hash.hash(curr).equalsIgnoreCase(a.getPassword())){
                request.setAttribute("ms", "Nhập sai mật khẩu hiện tại");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            } else if (!newpass.equals(renew)){
                request.setAttribute("ms", "Mật khẩu mới không khớp");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            } 
        } catch (NumberFormatException e) {
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
