package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Rol;

import java.sql.*;
import java.util.ArrayList;

public class RolesDao {
    public ArrayList<Rol> getListaRoles(){
        ArrayList<Rol> listaRoles = new ArrayList<>();

        try {

            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/proyectoweb";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM rol");

            while (rs.next()){
                Rol rol = new Rol(rs.getString(1),rs.getString(2));
                listaRoles.add(rol);
            }


        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaRoles;
    }
}
