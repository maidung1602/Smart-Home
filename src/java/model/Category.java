/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DAO;
import dal.DAO;
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
public class Category extends DBContext {
    private int id;
    private String category_name;

    public Category() {
    }

    public Category(int id, String category_name) {
        this.id = id;
        this.category_name = category_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", category_name=" + category_name + '}';
    }
    
    public List<Subcategory> getSubByCid(int id) {
        List<Subcategory> list = new ArrayList<>();
        String sql = "select * from subcategory where category_id=?";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subcategory(rs.getInt(1),rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Product> getCateHotProduct(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "with t as (\n" +
            "select top 8 p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail, SUM(pm.quantity) as totalQuantity\n" +
            "from Product p join ProductModel pm on p.id = pm.product_id join SubCategory s on p.subcategory_id = s.id\n" +
            "where s.category_id= ? \n" +
            "group by p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail\n" +
            "order by totalQuantity desc)\n" +
            "select top 4 t.id, t.name, t.description, t.brand_id, t.subcategory_id, t.thumbnail\n" +
            "from t\n" +
            "order by totalQuantity";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    

}
