/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ProductModel;

/**
 * @author maidu
 */
public class ProductModelDAO extends DBContext {

    public ProductModel getById(String id) {
        String sql = "select *\n" +
                "from ProductModel\n" +
                "where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ProductModel p = new ProductModel(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateQuantity(String ProductMdelId, int Quantity) {
        String sql = "UPDATE [dbo].[ProductModel]\n" +
                "   SET [quantity] = ?\n" +
                " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Quantity);
            ps.setString(2, ProductMdelId);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
    
      public void addProductModel(ProductModel productModel) {
        String sql = "insert into ProductModel (product_id, variant, image, origin_price, sale_price, quantity)\n" +
                "        values (?,?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productModel.getProductId());
            ps.setString(2, productModel.getVariant());
            ps.setString(3, productModel.getImage());
            ps.setInt(4, productModel.getOrigin_price());
            ps.setInt(5, productModel.getSale_price());
            ps.setInt(6, productModel.getQuantity());
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
      
      public void updateProductModel(ProductModel productModel) {
        String sql = "UPDATE [dbo].[ProductModel]\n" +
            "   SET [variant] = ?\n" +
            "      ,[image] = ?\n" +
            "      ,[origin_price] = ?\n" +
            "      ,[sale_price] = ?\n" +
            "      ,[quantity] = ?\n" +
            " WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productModel.getVariant());
            ps.setString(2, productModel.getImage());
            ps.setInt(3, productModel.getOrigin_price());
            ps.setInt(4, productModel.getSale_price());
            ps.setInt(5, productModel.getQuantity());
            ps.setInt(6, productModel.getId());
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
      
    public void deleteProductModel(int id) {
        String sql = "DELETE FROM [dbo].[ProductModel]\n" +
            "      WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
      
      
    public static void main(String[] args){
        ProductModelDAO pmdb = new ProductModelDAO();
        String pid="142";
        ProductModel pm = pmdb.getById(pid);
        System.out.println(pm);
    }
    
}
