/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DBContext;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maidu
 */
public class Order extends DBContext {
    private int id;
    private int userId;
    private String name;
    private String phone;
    private String address;
    private String orderDate;
    private int status;
    private int total;

    public Order() {
    }

    public Order(int id, int userId, String name, String phone, String address, String orderDate, int status, int total) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.status = status;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", userId=" + userId + ", name=" + name + ", phone=" + phone + ", address=" + address + ", orderDate=" + orderDate + ", status=" + status + ", total=" + total + '}';
    }
    
    public List<OrderDetail> getOrderDetails(){
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT p.id, pm.image, p.thumbnail, p.name, pm.variant, pm.sale_price, od.quantity, od.detail_total\n" +
            "  FROM [OrderDetail] od join [ProductModel] pm on od.product_model_id=pm.id join Product p on pm.product_id = p.id\n" +
            "  WHERE order_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setProductId(rs.getInt("id"));
                od.setImage(rs.getString("image"));
                od.setThumbnail(rs.getString("thumbnail"));
                od.setProductName(rs.getString("name"));
                od.setVariantName(rs.getString("variant"));
                od.setSalePrice(rs.getInt("sale_price"));
                od.setQuantity(rs.getInt("quantity"));
                od.setDetailTotal(rs.getInt("detail_total"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
}
