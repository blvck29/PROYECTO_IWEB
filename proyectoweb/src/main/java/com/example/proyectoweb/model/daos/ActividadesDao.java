package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class ActividadesDao {
    public ArrayList<Actividad> getListaActividades(){
        ArrayList<Actividad> listaActividades = new ArrayList<>();

        try {

            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/proyectoweb";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM actividad");

            while (rs.next()){
                Actividad actividad = new Actividad(rs.getString(1),rs.getString(2), rs.getBlob(3), rs.getBlob(4), rs.getInt(5));
                listaActividades.add(actividad);
            }


        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaActividades;
    }
}
