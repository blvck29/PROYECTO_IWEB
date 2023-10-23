package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Donaciones;

import java.sql.*;
import java.util.ArrayList;

public class DonacionesDao {
    public ArrayList<Donaciones> listar(){
        ArrayList<Donaciones> listaDonaciones = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String user = "root";
        String pass = "root";
        String sql = "select * from registro_donaciones";

        try(Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                Donaciones donaciones = new Donaciones();
                donaciones.setIdRegistro_Donaciones(rs.getInt(1));
                donaciones.setIdUsuario(rs.getInt(2));
                donaciones.setComprobante(rs.getBlob(3));
                donaciones.setMonto(rs.getDouble(4));
                donaciones.setComprobado(rs.getBoolean(5));
                listaDonaciones.add(donaciones);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return listaDonaciones;
    }
}
