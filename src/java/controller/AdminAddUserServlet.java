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
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import ulti.MD5Hash;

/**
 *
 * @author maidu
 */
public class AdminAddUserServlet extends HttpServlet {
   
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
        request.getRequestDispatcher("admin-add-user.jsp").forward(request, response);
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
        UserDAO d=new UserDAO();
        String name=request.getParameter("name");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String repassword=request.getParameter("repassword");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        int is_admin = Integer.parseInt(request.getParameter("is_admin"));
        User b = d.checkAccount(username, password);
        if (name ==null || name.equals("") || username ==null || username.equals("") ||
        password ==null || password.equals("") || repassword ==null || repassword.equals("") ||
        phone ==null || phone.equals("") ||email ==null || email.equals("")){
            request.setAttribute("err", "Chưa nhập đủ thông tin");
        }else if (!password.equals(repassword)) {
            request.setAttribute("err", "Mật khẩu không khớp");
        } else if (b!=null){
            request.setAttribute("err", "Username đã tồn tại");
        } else if (password.equals(repassword) && b==null){
            User newUser;
            try {
                newUser = new User(0, name, username, MD5Hash.hash(password), email, phone, "images/home/avatar-doi-ban-than-2021-182-696x696.webp", is_admin);
                d.insert(newUser);
                response.sendRedirect("admin-user");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
