package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.EstadoUsuario;
import com.example.proyectoweb.model.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class EstadoUsuariosDao {
    public ArrayList<EstadoUsuario> getListaEstadoUsuarios(){
        ArrayList<EstadoUsuario> listaEstadoUsuarios = new ArrayList<>();

        try {

            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/proyectoweb";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM estado_usuario");

            while (rs.next()){
                EstadoUsuario estadoUsuario = new EstadoUsuario(rs.getString(1),rs.getString(2));
                listaEstadoUsuarios.add(estadoUsuario);
            }


        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaEstadoUsuarios;
    }
}
