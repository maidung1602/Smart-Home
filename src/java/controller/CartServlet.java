/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDetailDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.OrderDetail;

/**
 *
 * @author maidu
 */
public class CartServlet extends HttpServlet {
   
    
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
        List<OrderDetail> cart = deserializeCart(request);
        int sum=0;
        for (OrderDetail o : cart) {
            sum+=o.getDetailTotal();
        }
       // System.out.println(cart.stream().map(OrderDetail::getDetailTotal).map(id -> id + "").collect(Collectors.joining("\n")));
        request.setAttribute("sizeOfCart", cart.size());
        request.setAttribute("total", sum);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        //define how to deal with Cookie {"cart": "{1_10}_{2_20}"}
        //Use POST to add/remove from cart
        String id = request.getParameter("model_id");
        String quantityParam = request.getParameter("quantity");
        String action = request.getParameter("action");
        int quantity = quantityParam == null? 0: Integer.parseInt(quantityParam);
        Cookie cart = Arrays.stream(request.getCookies())
                .filter(c -> c.getName().equals("cart"))
                .findFirst().orElse(new Cookie("cart", ""));
        Cookie csize = Arrays.stream(request.getCookies())
                .filter(c -> c.getName().equals("csize"))
                .findFirst().orElse(new Cookie("csize", "0"));
        if (action != null && action.equals("add")) {
            addToCart(cart, id, quantity);
            int s = Integer.parseInt(csize.getValue());
            csize.setValue(""+(s+1));
            csize.setMaxAge(60*60*24*7);
            response.addCookie(csize);
            cart.setMaxAge(60*60*24*7);
            response.addCookie(cart);
            response.sendRedirect("detail?id="+request.getParameter("product-id"));
        } else {
            removeFromCart(cart, id);
            int s = Integer.parseInt(csize.getValue());
            csize.setValue(""+(s-1));
            csize.setMaxAge(60*60*24*7);
            response.addCookie(csize);
            cart.setMaxAge(60*60*24*7);
            response.addCookie(cart);
            response.sendRedirect("cart");
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

    private void addToCart(Cookie cart, String id, int quantity) {
        removeFromCart(cart, id);
        String cartValue = cart.getValue();
        cartValue += (cartValue.isEmpty() 
                ? "{" 
                : "_{") 
                + id + "_" + quantity + "}";
        cart.setValue(cartValue);
    }

    private void removeFromCart(Cookie cart, String id) {
        String cartValue = cart.getValue();
        String regex = "\\{" + id + "_\\d+\\}_*";
        cartValue = cartValue.replaceAll(regex, "");
        cart.setValue(cartValue);        
    }

    private List<OrderDetail> deserializeCart(HttpServletRequest request) {
        Map<Integer, Integer> raw = new HashMap<>();
        Cookie cartCookie = Arrays.stream(request.getCookies())
                .filter(c -> c.getName().equals("cart"))
                .findFirst().orElse(new Cookie("cart", ""));
        String cartValue = cartCookie.getValue();
        while(cartValue.contains("{")) {
            int id = Integer.parseInt(
                    cartValue.substring(
                            cartValue.indexOf("{") + 1
                            , cartValue.indexOf("_")));
            int quantity = Integer.parseInt(
                    cartValue.substring(
                            cartValue.indexOf("_") + 1
                            , cartValue.indexOf("}")));
            raw.put(id, quantity);
            String regex = "\\{" + id + "_\\d+\\}_*";
            cartValue = cartValue.replaceAll(regex, "");
        }
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        List<OrderDetail> result = orderDetailDAO.getByProductModelIds(raw.keySet());
        for (OrderDetail orderDetail : result) {
            orderDetail.setQuantity(raw.get(orderDetail.getProductModelId()));
        }
        for (OrderDetail orderDetail : result) {
            orderDetail.setDetailTotal(orderDetail.getSalePrice()*orderDetail.getQuantity());
        }
        return result;
    }

}
