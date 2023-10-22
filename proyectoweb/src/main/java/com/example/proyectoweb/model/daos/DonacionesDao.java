package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class DonacionesDao {
    public ArrayList<Donaciones> getListaDonaciones(){
        ArrayList<Donaciones> listaDonaciones = new ArrayList<>();

        try {

            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/proyectoweb";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM registro_donaciones");

            while (rs.next()){
                Donaciones donaciones = new Donaciones(rs.getInt(1),rs.getInt(2), rs.getBlob(3), rs.getDouble(4), rs.getBoolean(5));
                listaDonaciones.add(donaciones);
            }


        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaDonaciones;
    }
}
