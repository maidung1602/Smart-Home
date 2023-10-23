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
import model.Brand;


/**
 *
 * @author maidu
 */
public class BrandDAO extends DBContext {
    
    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "select b.id, b.brand_name, COUNT (p.brand_id)\n" +
        "            from Product p full join Brand b on p.brand_id= b.id\n" +
        "            group by b.id, b.brand_name\n" +
        "			order by b.brand_name";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1),rs.getString(2),rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Brand> getBrandSearch(String key) {
        List<Brand> list = new ArrayList<>();
        String sql = "select p.brand_id, b.brand_name, COUNT (p.brand_id)\n" +
            "from Product p join Brand b on p.brand_id= b.id\n" +
            "where name like '%"+key+"%' or description like '%"+key+"%'\n" +
            "group by p.brand_id, b.brand_name";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public void insert(Brand a) {
        String sql = "INSERT INTO [dbo].[Brand]\n" +
            "           ([brand_name])\n" +
            "     VALUES\n" +
            "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getBrand_name());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void update(Brand a) {
        String sql = "UPDATE [dbo].[Brand]\n" +
            "   SET [brand_name] = ?\n" +
            " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getBrand_name());
            st.setInt(2, a.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
     public void deleteBrand(int id) {
        String sql = "DELETE FROM [dbo].[Brand]\n" +
        "      WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
    
    
}
