package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Usuario;

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

    public ArrayList<DelegadoAct> listarNombresEncargadosAct(){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }


        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        //Conexión a la DB

        String sql = "SELECT ac.titulo, idEncargado, u.nombres, u.apellidos, u.codigo\n" +
                "FROM actividad ac\n" +
                "\n" +
                "\tINNER JOIN usuarios u on (u.idUsuario = ac.idEncargado);";

        ArrayList<DelegadoAct> listaEncargados = new ArrayList();

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){

                DelegadoAct delegadoAct = new DelegadoAct();

                delegadoAct.setTituloActividad(rs.getString(1));
                delegadoAct.setNombre(rs.getString(3));
                delegadoAct.setApellido(rs.getString(4));
                delegadoAct.setCodigo(rs.getString(5));

                listaEncargados.add(delegadoAct);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaEncargados;

    }

}
