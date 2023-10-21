package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class EventosDao {


    public ArrayList<Evento> getListaEventos(){
        ArrayList<Evento> listaEventos = new ArrayList<>();

        try {

            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/proyectoweb";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM evento");

            while (rs.next()){
                Evento event = new Evento(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getTime(4), rs.getDate(5), rs.getString(6), rs.getBlob(7), rs.getString(8), rs.getString(9), rs.getString(10));
                listaEventos.add(event);
            }


        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaEventos;
    }


}
