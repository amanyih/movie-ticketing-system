package com.movietickets.model;

public class Role {

    private int roleId;
    private RoleType name;

    //constructors

    public Role() {
    }

    public Role(int roleId, RoleType name) {
        this.roleId = roleId;
        this.name = name;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public RoleType getName() {
        return name;
    }

    public void setName(RoleType name) {
        if (name != null) {
            this.name = name;
        }
    }



}
