/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author maidu
 */
public class Subcategory {
    private int id;
    private String subcategory_name;
    private Category category;
    private String image;

    public Subcategory() {
    }

    public Subcategory(int id, String subcategory_name, Category category, String image) {
        this.id = id;
        this.subcategory_name = subcategory_name;
        this.category = category;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubcategory_name() {
        return subcategory_name;
    }

    public void setSubcategory_name(String subcategory_name) {
        this.subcategory_name = subcategory_name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Subcategory{" + "id=" + id + ", subcategory_name=" + subcategory_name + ", category=" + category + ", image=" + image + '}';
    }
    
    

    
    
    
    
}
