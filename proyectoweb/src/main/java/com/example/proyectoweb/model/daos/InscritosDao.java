
package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;

import java.sql.*;
import java.util.ArrayList;

public class InscritosDao {


    public ArrayList<Inscrito> getListaInscritos(){
        ArrayList<Inscrito> listaInscritos = new ArrayList<>();

        try {
            // hacemos la conexion
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/proyectoweb";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,user,pass);

            // hacemos el statement

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM inscripcion");

            while (rs.next()) {
                Inscrito inscrito = new Inscrito();
                inscrito.setIdUsuario(rs.getInt(1));
                inscrito.setIdEvento(rs.getInt(2));
                inscrito.setIdRol(rs.getString(3));
                inscrito.setAceptado(rs.getBoolean(4));
                listaInscritos.add(inscrito);
            }


        } catch (ClassNotFoundException | SQLException e){
            throw new RuntimeException(e);
        }

        return listaInscritos;
    }






}
