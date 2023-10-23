/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author maidu
 */
public class ProductDTO {
    private String thumbnail;
    private String name;
    private int quantity;

    public ProductDTO() {
    }

    public ProductDTO(String thumbnail, String name, int quantity) {
        this.thumbnail = thumbnail;
        this.name = name;
        this.quantity = quantity;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "thumbnail=" + thumbnail + ", name=" + name + ", quantity=" + quantity + '}';
    }

    
    
    
}
