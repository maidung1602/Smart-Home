/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author maidu
 */
public class OrderDTO {
    private int id;
    private int userId;
    private String username;
    private String name;
    private String phone;
    private String address;
    private String orderDate;
    private int status;
    private int total;

    public OrderDTO() {
    }

    public OrderDTO(int id, int userId, String username, String name, String phone, String address, String orderDate, int status, int total) {
        this.id = id;
        this.userId = userId;
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
        return "OrderDTO{" + "id=" + id + ", userId=" + userId + ", username=" + username + ", name=" + name + ", phone=" + phone + ", address=" + address + ", orderDate=" + orderDate + ", status=" + status + ", total=" + total + '}';
    }

    
    
    
}
