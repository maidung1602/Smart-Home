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
import model.Product;
import model.ProductDTO;

/**
 *
 * @author maidu
 */
public class ProductDAO extends DBContext {
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Product> getHotSaleProduct(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select top "+id+" p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail, (SUM(pm.sale_price)/SUM(pm.origin_price)) as discount\n" +
            "from Product p join ProductModel pm on p.id = pm.product_id\n" +
            "group by p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail\n" +
            "order by discount asc";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Product> getHotProduct(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select top "+id+" p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail, SUM(pm.quantity) as totalQuantity\n" +
            "from Product p join ProductModel pm on p.id = pm.product_id\n" +
            "group by p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail\n" +
            "order by totalQuantity desc";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
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
    
    public List<Product> getNewProduct(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select top "+id+" *\n" +
            "from Product p\n" +
            "order by p.id desc";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Product> getProductByCid(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select distinct p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail\n" +
            "from Product p join ProductModel pm on p.id = pm.product_id join SubCategory s on p.subcategory_id = s.id\n" +
            "where s.category_id= ?";
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
    
    public List<Product> getProductBySid(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select *\n" +
            "from Product\n" +
            "where subcategory_id=?";
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
    
    public List<Product> getProductByBid(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select *\n" +
            "from Product\n" +
            "where brand_id=?";
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
    
    public List<Product> getSearchFilter(String key, int from, int to, String[] brands, String order) {
        //System.out.println("data: " + key + "\n" + from + "\n" + to + "\n" + Arrays.stream(brands==null? new String[0] : brands).collect(Collectors.joining(" - ")) + "\n" + order);
        List<Product> list = new ArrayList<>();       
        String add="";
        if (brands != null && !brands[0].equals("0")){
            add="and p.brand_id in (0";
            for (int i = 0; i < brands.length; i++) {
                add+=","+brands[i];
            }
            add+=")";
        }
        String sql = "select p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail, MIN(pm.sale_price)\n" +
            "from Product p join ProductModel pm on pm.product_id = p.id\n" +
            "where (name like '%"+key+"%' or description like '%"+key+"%')\n" +add+
            "group by p.id, p.name, p.description, p.brand_id, p.subcategory_id, p.thumbnail\n"+
            "having MIN(pm.sale_price) between "+from+" and "+to;
        
        if (order !=null && !order.equals("0"))
            sql += "\norder by " + order;
        DAO d = new DAO();
        try {
            System.out.println(sql);
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6)));
            }
        } catch (SQLException e) {
//            e.printStackTrace();
        }
        return list;
    }
    
    public Product getProduct(int id) {
        String sql = "select *\n" +
            "from Product\n" +
            "where id=?";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt(1),rs.getString(2),rs.getString(3), d.getBrandById(rs.getInt(4)), d.getSubcategoryById(rs.getInt(5)),rs.getString(6));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public int addProduct(Product product) {
        String sql = "insert into Product(name, description, brand_id, subcategory_id, thumbnail) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setInt(3, product.getBrand().getId());
            ps.setInt(4, product.getSubcategory().getId());
            ps.setString(5, product.getThumbnail());
            ps.executeUpdate();
            ps.close();
            sql = "select max(id) from Product";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }
    
    public void updateProduct(int id, String name, String description, int brand_id, int subcategory_id, String thumbnail) {
        String sql = "UPDATE [dbo].[Product]\n" +
            "   SET [name] = ?\n" +
            "      ,[description] = ?\n" +
            "      ,[brand_id] = ?\n" +
            "      ,[subcategory_id] = ?\n" +
            "      ,[thumbnail] = ?\n" +
            " WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, brand_id);
            ps.setInt(4, subcategory_id);
            ps.setString(5, thumbnail);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteProductModelByProductID(int id) {
        String sql = "DELETE FROM [dbo].[ProductModel]\n" +
            "      WHERE product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n" +
            "      WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<ProductDTO> getHotProductByMonth(int month, int year) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select top 5 p.thumbnail, p.name, SUM(od.quantity)\n" +
            "from  [Order] o join OrderDetail od on o.id = od.order_id \n" +
            "join ProductModel pm on od.product_model_id = pm.id join Product p on pm.product_id = p.id\n" +
            "where YEAR(order_date) = ? and MONTH(order_date) = ?\n" +
            "group by p.thumbnail, p.name\n" +
            "order by SUM(od.quantity) desc";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1),rs.getString(2),rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Product> getListByPage(List<Product> list, int start,int end){
        return list.subList(start, end);
    }

    
    public static void main(String[] args) {
//        ProductDAO p = new ProductDAO();
//        p.deleteProduct(141);
    }
    
}
