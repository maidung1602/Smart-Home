package controller.Admin;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * @author maidu
 */
public class AdminAddProductServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sSelectedBrand = request.getParameter("brand");
        String sSelectedCategory = request.getParameter("category");
        String sSelectedSubcategory = request.getParameter("subcategory");
        BrandDAO bdb = new BrandDAO();
        List<Brand> brands = bdb.getAllBrand();
        request.setAttribute("brands", brands);
        CategoryDAO cdb = new CategoryDAO();
        List<Category> categories = cdb.getCategories();
        request.setAttribute("categories", categories);
        SubcategoryDAO scdb = new SubcategoryDAO();
        List<Subcategory> subcategories = scdb.getSubcategories();

        int selectedBrand = sSelectedBrand == null ? brands.get(0).getId() : Integer.parseInt(sSelectedBrand);
        int selectedCategory = sSelectedCategory == null ? categories.get(0).getId() : Integer.parseInt(sSelectedCategory);
        int selectedSubcategory = sSelectedSubcategory == null ? subcategories.get(0).getId() : Integer.parseInt(sSelectedSubcategory);

        request.setAttribute("subcategories", subcategories);
        request.setAttribute("selectedBrand", selectedBrand);
        request.setAttribute("selectedCategory", selectedCategory);
        request.setAttribute("selectedSubcategory", selectedSubcategory);
        request.getRequestDispatcher("admin-add-product.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("product-name");
        String productDescription = request.getParameter("product-desc");
        int brandId = Integer.parseInt(request.getParameter("brand"));
        int subcategoryId = Integer.parseInt(request.getParameter("subcategory"));
        String thumbnail = request.getParameter("thumbnail");

        String[] variants = request.getParameterValues("variant");
        Integer[] originPrices = Arrays.stream(request.getParameterValues("origin-price")).map(Integer::parseInt).toArray(Integer[]::new);
        Integer[] salePrices = Arrays.stream(request.getParameterValues("sale-price")).map(Integer::parseInt).toArray(Integer[]::new);
        Integer[] quantities = Arrays.stream(request.getParameterValues("quantity")).map(Integer::parseInt).toArray(Integer[]::new);
        String[] images = request.getParameterValues("image");

        ProductDAO pdb = new ProductDAO();
        Product product = new Product();
        product.setName(productName);
        product.setDescription(productDescription);
        DAO dao = new DAO();
        product.setBrand(dao.getBrandById(brandId));
        product.setSubcategory(dao.getSubcategoryById(subcategoryId));
        product.setThumbnail(thumbnail);
        int productId = pdb.addProduct(product);

        if (productId == -1) {
            request.setAttribute("error", "Error adding product");
            request.getRequestDispatcher("admin-add-product.jsp").forward(request, response);
            return;
        }
        for (int i = 0; i < variants.length; i++) {
            String variant = variants[i];
            Integer originPrice = originPrices[i];
            Integer salePrice = salePrices[i];
            Integer quantity = quantities[i];
            String image = images[i];

            variant = "0".equals(variant) || variant.isEmpty() ? null : variant;
            image = "0".equals(image) || image.isEmpty() ? null : image;

            ProductModelDAO pmd = new ProductModelDAO();
            ProductModel productModel = new ProductModel();
            productModel.setVariant(variant);
            productModel.setOrigin_price(originPrice);
            productModel.setSale_price(salePrice);
            productModel.setQuantity(quantity);
            productModel.setImage(image);
            productModel.setProductId(productId);

            pmd.addProductModel(productModel);
        }
        response.sendRedirect("admin-product");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}