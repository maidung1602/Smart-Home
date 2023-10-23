/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Subcategory;

/**
 *
 * @author maidu
 */
public class SubcategoryDAO extends DBContext {
//    public List<Subcategory> getSubByCid(int id) {
//        List<Subcategory> list = new ArrayList<>();
//        String sql = "select * from subcategory where category_id=?";
//        DAO d = new DAO();
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Subcategory(rs.getInt(1),rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4)));
//            }
//        } catch (SQLException e) {
//        }
//        return list;
//    }
    
    public List<Subcategory> getSubHot() {
        List<Subcategory> list = new ArrayList<>();
        String sql = "select * from SubCategory where image is not null";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subcategory(rs.getInt(1),rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Subcategory> getSubcategories() {
        List<Subcategory> list = new ArrayList<>();
        String sql = "select * from SubCategory";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subcategory(rs.getInt(1),rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public void insert(String subcategory_name, int category_id, String image) {
                String sql = "INSERT INTO [dbo].[SubCategory]\n" +
                    "           ([subcategory_name]\n" +
                    "           ,[category_id]\n" +
                    "           ,[image])\n" +
                    "     VALUES\n" +
                    "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subcategory_name);
            st.setInt(2, category_id);
            st.setString(3, image);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void update(String subcategory_name, int category_id, String image, int id) {
        String sql = "UPDATE [dbo].[SubCategory]\n" +
            "   SET [subcategory_name] = ?\n" +
            "      ,[category_id] = ?\n" +
            "      ,[image] = ?\n" +
            " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subcategory_name);
            st.setInt(2, category_id);
            st.setString(3, image);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteSubategory(int id) {
        String sql = "DELETE FROM [dbo].[SubCategory]\n" +
        "      WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
}
