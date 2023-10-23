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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.UserDTO;

/**
 *
 * @author maidu
 */
public class UserDAO extends DBContext {
    public User checkAccount(String username,String password){
        String sql="SELECT *\n" +
            "  FROM [User] where username=? and password=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8));
            }
        }catch(SQLException e){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    
    public int getLastUserId(){
        String sql="SELECT MAX( [id])\n" +
            "  FROM [User]";
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
    
    public void updateInfo(int id, String name, String phone, String email) {
        String sql = "UPDATE [dbo].[User]\n" +
            "   SET [name] = ?\n" +
            "      ,[email] = ?\n" +
            "      ,[phone_number] = ?\n" +
            " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, phone);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void updatePass(int id, String newpass) {
        String sql = "UPDATE [dbo].[User]\n" +
                "   SET [password] = ?\n" +
                " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    //insert mot ban ghi
    public void insert(User a) {
        String sql = "INSERT INTO [dbo].[User]\n" +
            "           ([name]\n" +
            "           ,[username]\n" +
            "           ,[password]\n" +
            "           ,[email]\n" +
            "           ,[phone_number]\n" +
            "           ,[avatar]\n" +
            "           ,[is_admin])\n" +
            "     VALUES\n" +
            "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getName());
            st.setString(2, a.getUsername());
            st.setString(3, a.getPassword());
            st.setString(4, a.getEmail());
            st.setString(5, a.getPhone());
            st.setString(6, a.getAvatar());
            st.setInt(7, a.getIs_admin());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<User> getAllUser(int id) {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]\n" +
            "where id not in (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), 
                        rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public int getIsAdmin(String id){
        String sql="select is_admin\n" +
            "from [User]\n" +
            "where id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch(SQLException e){
        }
        return 0;
    }
    
    
    public void disable(String id) {
        String sql = "UPDATE [dbo].[User]\n" +
                "   SET [is_admin] = ?\n" +
                " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, getIsAdmin(id)-4);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void enable(String id) {
        String sql = "UPDATE [dbo].[User]\n" +
                "   SET [is_admin] = ?\n" +
                " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, getIsAdmin(id)+4);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<UserDTO> getActiveUser(int month, int year) {
        List<UserDTO> list = new ArrayList<>();
        String sql = "select top 5 u.avatar, u.name, SUM(total)\n" +
            "from  [Order] o join [User] u on o.user_id = u.id\n" +
            "where YEAR(order_date) = ? and MONTH(order_date) = ?\n" +
            "group by u.avatar, u.name\n" +
            "order by SUM(total) desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new UserDTO(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    
    public static void main(String[] args){
        String s1 = "xyz";
        String s2 = new String(s1);
        if (s1 == s2)
        System.out.println("Line 4");
        if (s1.equals(s2))
        System.out.println("Line 6");

        
    }
    
}
