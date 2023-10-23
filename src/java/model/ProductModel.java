/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author maidu
 */
public class ProductModel {
    private int id;
    private int productId;
    private String variant;
    private String image;
    private int origin_price;
    private int sale_price;
    private int quantity;

    public ProductModel() {
    }

    public ProductModel(int id, int productId, String variant, String image, int origin_price, int sale_price, int quantity) {
        this.id = id;
        this.productId = productId;
        this.variant = variant;
        this.image = image;
        this.origin_price = origin_price;
        this.sale_price = sale_price;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getVariant() {
        return variant;
    }

    public void setVariant(String variant) {
        this.variant = variant;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getOrigin_price() {
        return origin_price;
    }

    public void setOrigin_price(int origin_price) {
        this.origin_price = origin_price;
    }

    public int getSale_price() {
        return sale_price;
    }

    public void setSale_price(int sale_price) {
        this.sale_price = sale_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductModel{" + "id=" + id + ", productId=" + productId + ", variant=" + variant + ", image=" + image + ", origin_price=" + origin_price + ", sale_price=" + sale_price + ", quantity=" + quantity + '}';
    }

    
}
