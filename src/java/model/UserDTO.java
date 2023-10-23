/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author maidu
 */
public class UserDTO {
    private String avatar;
    private String name;
    private int total;

    public UserDTO() {
    }

    public UserDTO(String avatar, String name, int total) {
        this.avatar = avatar;
        this.name = name;
        this.total = total;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "avatar=" + avatar + ", name=" + name + ", total=" + total + '}';
    }

    
    
    
    
}
