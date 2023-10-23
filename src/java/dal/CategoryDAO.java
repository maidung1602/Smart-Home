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
import model.Category;


/**
 *
 * @author maidu
 */
public class CategoryDAO extends DBContext{
    public List<Category> getCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public void insert(Category a) {
                String sql = "INSERT INTO [dbo].[Category]\n" +
        "           ([category_name])\n" +
        "     VALUES\n" +
        "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getCategory_name());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void update(Category a) {
        String sql = "UPDATE [dbo].[Category]\n" +
        "   SET [category_name] = ?\n" +
        " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getCategory_name());
            st.setInt(2, a.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteSubcategory(int id) {
        String sql = "DELETE FROM [dbo].[SubCategory]\n" +
        "      WHERE category_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteCategory(int id) {
        String sql = "DELETE FROM [dbo].[Category]\n" +
        "      WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
