/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author maidu
 */
public class Brand {
    private int id;
    private String brand_name;
    private int quantity;

    public Brand() {
    }

    public Brand(int id, String brand_name, int quantity) {
        this.id = id;
        this.brand_name = brand_name;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Brand{" + "id=" + id + ", brand_name=" + brand_name + ", quantity=" + quantity + '}';
    }

    
    

}
