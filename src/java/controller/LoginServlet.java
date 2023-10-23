/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class LoginServlet extends HttpServlet {
   
    
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String u=request.getParameter("username");
        String p=request.getParameter("password");
        String r= request.getParameter("rem");
        Cookie cu= new Cookie("cuser", u);
        Cookie cp= new Cookie("cpass", p);
        Cookie cr= new Cookie("crem", r);
        if(r!=null){
            cu.setMaxAge(60*60*24*7);
            cp.setMaxAge(60*60*24*7);
            cr.setMaxAge(60*60*24*7);
        } else {
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);
        UserDAO d=new UserDAO();
        try {
            User a=d.checkAccount(u, MD5Hash.hash(p));
            if(a==null){
                request.setAttribute("error", "Thông tin đăng nhập không chính xác");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (a.getIs_admin()<0) {
                request.setAttribute("error", "Tài khoản của bạn đã bị khóa");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else{
                //tao session
                HttpSession session=request.getSession();
                session.setAttribute("account", a);
                if(a.getIs_admin()==3)
                    response.sendRedirect("admin-user");
                else if (a.getIs_admin()==2)
                    response.sendRedirect("admin");
                else 
                    response.sendRedirect("home");
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
