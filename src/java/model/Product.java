/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DAO;
import dal.DAO;
import dal.DBContext;
import dal.DBContext;
import dal.ProductDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maidu
 */
public class Product extends DBContext {

    private int id;
    private String name;
    private String description;
    private Brand brand;
    private Subcategory subcategory;
    private String thumbnail;

    public Product() {
    }

    public Product(int id, String name, String description, Brand brand, Subcategory subcategory, String thumbnail) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.brand = brand;
        this.subcategory = subcategory;
        this.thumbnail = thumbnail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Subcategory getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(Subcategory subcategory) {
        this.subcategory = subcategory;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getOriginPriceTag() {
        String sql = "DECLARE @minOrigin FLOAT, @maxOrigin FLOAT\n"
                + "SET @minOrigin = (SELECT MIN(origin_price) from ProductModel where product_id = ?)\n"
                + "SET @maxOrigin = (SELECT MAX(origin_price) from ProductModel where product_id = ?)\n"
                + "SELECT IIF(@minOrigin = @maxOrigin, CONCAT(@minOrigin, '.000'), CONCAT(CONCAT(CONCAT(@minOrigin, '.000 - '), @maxOrigin), '.000'))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.id);
            st.setInt(2, this.id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "Not available";
    }
    
    public String getSalePriceTag() {
        String sql = "DECLARE @minSale FLOAT, @maxSale FLOAT\n"
                + "SET @minSale = (SELECT MIN(sale_price) from ProductModel where product_id = ?)\n"
                + "SET @maxSale = (SELECT MAX(sale_price) from ProductModel where product_id = ?)\n"
                + "SELECT IIF(@minSale = @maxSale, CONCAT(@minSale, '.000'), CONCAT(CONCAT(CONCAT(@minSale, '.000 - '), @maxSale), '.000'))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.id);
            st.setInt(2, this.id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "Not available";
    }

    public List<ProductModel> getProductModel(){
        List<ProductModel> list = new ArrayList<>();
        String sql = "select *\n" +
            "from ProductModel pm\n" +
            "where pm.product_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                 list.add(new ProductModel(rs.getInt(1), this.id ,rs.getString(3), rs.getString(4), rs.getInt(5),rs.getInt(6),rs.getInt(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getRelated() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 *\n" +
            "from Product\n" +
            "where subcategory_id=? and id not in (?)";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, this.subcategory.getId());
            ps.setInt(2, this.id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public int getQuantity() {
        String sql = "select SUM(pm.quantity)\n" +
            "from Product p join ProductModel pm on pm.product_id = p.id\n" +
            "where p.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", brand=" + brand + ", subcategory=" + subcategory + ", thumbnail=" + thumbnail + '}';
    }

}
