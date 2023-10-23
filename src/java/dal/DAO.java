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
import model.Category;
import model.Subcategory;

/**
 *
 * @author maidu
 */
public class DAO extends DBContext {
    public Subcategory getSubcategoryById(int id) {
        String sql = "select * from subcategory where id=?";  
        DAO d = new DAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  
            if (rs.next()) {  
                Subcategory c = new Subcategory(rs.getInt(1), rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public Category getCategoryById(int id) {
        String sql = "select * from category where id=?";  
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  
            if (rs.next()) { 
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public Brand getBrandById(int id) {
        String sql = "select b.id, b.brand_name, count(b.id) \n" +
            "            from brand b full join Product p on p.brand_id = b.id\n" +
            "            where b.id=?\n" +
            "            group by b.id, b.brand_name";  
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  
            if (rs.next()) { 
                Brand b = new Brand(rs.getInt(1), rs.getString(2), rs.getInt(3));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public List<Integer> getCateByMonth(int month, int year) {
        List<Integer> list = new ArrayList<>();
        String sql = "with t as (\n" +
            "select c.id, SUM(od.quantity) as quantity\n" +
            "            from  [Order] o join OrderDetail od on o.id = od.order_id \n" +
            "            join ProductModel pm on od.product_model_id = pm.id join Product p on pm.product_id = p.id\n" +
            "            join SubCategory sb on p.subcategory_id = sb.id join Category c on sb.category_id = c.id\n" +
            "            where YEAR(order_date) = ? and MONTH(order_date) = ?\n" +
            "            group by c.id)\n" +
            "select c.category_name, t.quantity\n" +
            "from Category c left join t on t.id = c.id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(2));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Integer> getMoneyByMonth(int month, int year) {
        List<Integer> list = new ArrayList<>();
        String sql = "select SUM(o.total)\n" +
            "from  [Order] o \n" +
            "where YEAR(order_date) = ? and MONTH(order_date)=? and DAY(order_date)=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            int size;
            if(month==1||month==3||month==5||month==7||month==8||month==10||month==12)
                size=31;
            else if (month==2)
                size=28;
            else 
                size=30;
            for (int i = 1; i <= size; i++) {
                ps.setInt(3, i);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    list.add(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    

}
