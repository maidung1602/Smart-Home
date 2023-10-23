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
import model.Order;
import model.OrderDTO;

/**
 *
 * @author maidu
 */
public class OrderDAO extends DBContext {
    
    public void insertOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Order]\n" +
            "           ([user_id]\n" +
            "           ,[name]\n" +
            "           ,[phone]\n" +
            "           ,[address]\n" +
            "           ,[order_date]\n" +
            "           ,[status]\n" +
            "           ,[total])\n" +
            "     VALUES\n" +
            "           (?,?,?,?,GETDATE(),1,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getUserId());
            st.setString(2, o.getName());
            st.setString(3, o.getPhone());
            st.setString(4, o.getAddress());
            st.setInt(5, o.getTotal());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public int getLastOrderId(){
        String sql="SELECT MAX( [id])\n" +
            "  FROM [Order]";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch(SQLException e){
        }
        return 0;
    }
    
    public List<Order> getOrdersByUserId(int id) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT*\n" +
            "  FROM [dbo].[Order]\n" +
            "  WHERE [user_id]=?\n" + 
            "  order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt("status"), rs.getInt("total")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> list = new ArrayList<>();
        String sql = "SELECT o.id, o.user_id, u.username, o.name, o.phone, o.address, o.order_date, o.total, o.status\n" +
"            FROM [Order] o join [User] u on o.user_id = u.id\n" +
"            order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDTO(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt("status"), rs.getInt("total")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public void updateStatus(int id, int status) {
        String sql = "UPDATE [dbo].[Order]\n" +
        "   SET [status] = ?\n" +
        " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
}
