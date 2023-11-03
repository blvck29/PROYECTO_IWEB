package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class EventosDao extends DaoBase{


    public ArrayList<Evento> listarEventos (){ //admin

        //Conexión a la DB

        String sql = "select * from evento";

        ArrayList<Evento> listaEventos = new ArrayList();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Evento event = new Evento(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getTime(4), rs.getDate(5), rs.getString(6), rs.getBlob(7), rs.getString(8), rs.getString(9), rs.getString(10));
                listaEventos.add(event);
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaEventos;
    }


}
