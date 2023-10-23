/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author maidu
 */
public class OrderDetail {
    private int id;
    private int orderId;
    private int productModelId;
    private int productId;
    private String productName;
    private String variantName;
    private String thumbnail;
    private String image;
    private int salePrice;
    private int quantity;
    private int detailTotal;

    public OrderDetail() {
    }

    public OrderDetail(int id, int orderId, int productModelId, int productId, String productName, String variantName, String thumbnail, String image, int salePrice, int quantity, int detailTotal) {
        this.id = id;
        this.orderId = orderId;
        this.productModelId = productModelId;
        this.productId = productId;
        this.productName = productName;
        this.variantName = variantName;
        this.thumbnail = thumbnail;
        this.image = image;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.detailTotal = detailTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductModelId() {
        return productModelId;
    }

    public void setProductModelId(int productModelId) {
        this.productModelId = productModelId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getVariantName() {
        return variantName;
    }

    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDetailTotal() {
        return detailTotal;
    }

    public void setDetailTotal(int detailTotal) {
        this.detailTotal = detailTotal;
    }

    
    

}
