/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dto;

import java.util.Objects;

/**
 *
 * @author admin
 */
public class UserDTO {
    private int id;
    private String email;
    private String name;
    private String avatar;
    private String address;
    private String phoneNum;
    private String roleName;

    public UserDTO() {
    }
    
    

    public UserDTO(int id, String email, String name, String avatar, String address, String phoneNum, String roleName) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.avatar = avatar;
        this.address = address;
        this.phoneNum = phoneNum;
        this.roleName = roleName;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
    public void nameValidation() {
        if (this.name.isEmpty()) {
            throw new RuntimeException("Username must not be emptied");
        }
    }
    
    public void phoneValidation() {
        if (this.phoneNum.isEmpty()) {
            throw new RuntimeException("Phone must not be emptied");
        }
    }
    
    public void emailValidation() {
        if (this.email.isEmpty()) {
            throw new RuntimeException("Email must not be emptied");
        }
    }
    
    public void addressValidation() {
        if (this.address.isEmpty()) {
            throw new RuntimeException("Address must not be emptied");
        }
    }
    

    @Override
    public String toString() {
        return "UserDTO{" + "id=" + id + ", email=" + email + ", name=" + name + ", avatar=" + avatar + ", address=" + address + ", phoneNum=" + phoneNum + ", roleName=" + roleName + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final UserDTO other = (UserDTO) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.avatar, other.avatar)) {
            return false;
        }
        if (!Objects.equals(this.address, other.address)) {
            return false;
        }
        if (!Objects.equals(this.phoneNum, other.phoneNum)) {
            return false;
        }
        if (!Objects.equals(this.roleName, other.roleName)) {
            return false;
        }
        return true;
    }
    
    
    
}
