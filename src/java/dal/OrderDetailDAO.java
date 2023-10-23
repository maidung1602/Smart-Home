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
import java.util.Set;
import java.util.stream.Collectors;
import model.OrderDetail;

/**
 *
 * @author maidu
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getByProductModelIds(Set<Integer> ids) {
        List<OrderDetail> result = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT [pm].[id] AS [id]\n"
                + "	  ,[p].[id] as [productid]\n"
                + "	  ,[name]\n"
                + "      ,[variant]\n"
                + "      ,[thumbnail]\n"
                + "      ,[image]\n"
                + "      ,[sale_price]\n"
                + "  FROM [dbo].[ProductModel] pm\n"
                + "  JOIN [dbo].[Product] p ON [pm].[product_id] = [p].[id]"
                + "  WHERE [pm].[id] in (");
        if (ids == null || ids.isEmpty()) {
            return result;
        } 
        sql.append(ids.stream().map(id -> "?").collect(Collectors.joining("\n,")));
        sql.append(");");
        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());
            Integer[] idsArr = ids.toArray(new Integer[0]);
            for (int i = 0; i < idsArr.length; i++) {
                Integer id = idsArr[i];
                ps.setInt(i + 1, id);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductModelId(rs.getInt("id"));
                orderDetail.setProductId(rs.getInt("productid"));
                orderDetail.setProductName(rs.getString("name"));
                orderDetail.setVariantName(rs.getString("variant"));
                orderDetail.setThumbnail(rs.getString("thumbnail"));
                orderDetail.setImage(rs.getString("image"));
                orderDetail.setSalePrice(rs.getInt("sale_price"));
                orderDetail.setQuantity(0);
                result.add(orderDetail);
            }
        } catch (SQLException e) {
        }
        return result;
    }
    
    public void insertOrderDetail(int orderId, String productModelId, String quantity, String DetailTotal) {
        String sql = "INSERT INTO [dbo].[OrderDetail]\n" +
"           ([order_id]\n" +
"           ,[product_model_id]\n" +
"           ,[quantity]\n" +
"           ,[detail_total])\n" +
"     VALUES\n" +
"           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setString(2, productModelId);
            st.setString(3, quantity);
            st.setString(4, DetailTotal);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<OrderDetail> getOrderDetails(int id){
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT p.id, pm.image, p.thumbnail, p.name, pm.variant, pm.sale_price, od.quantity, od.detail_total\n" +
            "  FROM [OrderDetail] od join [ProductModel] pm on od.product_model_id=pm.id join Product p on pm.product_id = p.id\n" +
            "  WHERE order_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setProductId(rs.getInt("id"));
                od.setImage(rs.getString("image"));
                od.setThumbnail(rs.getString("thumbnail"));
                od.setProductName(rs.getString("name"));
                od.setVariantName(rs.getString("variant"));
                od.setSalePrice(rs.getInt("sale_price"));
                od.setQuantity(rs.getInt("quantity"));
                od.setDetailTotal(rs.getInt("detail_total"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
   
}
