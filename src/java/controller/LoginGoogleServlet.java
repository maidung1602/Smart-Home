/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import ulti.GooglePojo;
import ulti.GoogleUtils;
import ulti.MD5Hash;


/**
 *
 * @author maidu
 */
public class LoginGoogleServlet extends HttpServlet {
   
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
        UserDAO d=new UserDAO();
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
          RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
          dis.forward(request, response);
        } else {
        String accessToken = GoogleUtils.getToken(code);
        GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
        String username = googlePojo.getEmail();
        String name = username.replace("@gmail.com", "");
        name = name.replace("@fpt.edu.vn", "");
        String password = googlePojo.getId();
        try {
            User a = d.checkAccount(username, MD5Hash.hash(password));
            if(a==null) {
                User newUser = new User(0, name , username, MD5Hash.hash(password), username, null, googlePojo.getPicture(), 1);
                d.insert(newUser);
                User newa = d.checkAccount(username, MD5Hash.hash(password));
                HttpSession session=request.getSession();
                session.setAttribute("account", newa);
                response.sendRedirect("home");
            } else{
                HttpSession session=request.getSession();
                session.setAttribute("account", a);
                response.sendRedirect("home");
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginGoogleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
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
        doGet(request, response);
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
