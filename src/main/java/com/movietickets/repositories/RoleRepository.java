package com.movietickets.repositories;

import com.movietickets.model.Role;
import com.movietickets.model.RoleType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RoleRepository {

    private Connection connection;

    public RoleRepository(Connection connection) {
        this.connection = connection;
    }

    public int addRole(String role) {

        String sql = "INSERT INTO role (roleName) VALUES (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, role);
            return ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Role> getRoles(){
        String sql = "SELECT * FROM role";
        ArrayList<Role> roles = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int roleId = rs.getInt("roleId");
                String roleName = rs.getString("roleName");
                Role role = new Role(roleId, roleName.equals("ADMIN") ? RoleType.ADMIN : RoleType.USER);
                roles.add(role);
            }
            return roles;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
