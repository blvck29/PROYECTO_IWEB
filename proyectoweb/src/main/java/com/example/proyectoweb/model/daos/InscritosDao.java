
package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class InscritosDao {


    public ArrayList<Usuario> listarInscritosXevento(int idEvento){
        ArrayList<Usuario> listaInscritosxEvento = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        String sql = "select * from usuarios where idEvento = ?";

        try (Connection conn = DriverManager.getConnection(url,username,password);
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idEvento);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Usuario usuario = new Usuario();
                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setIdRol(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setUltimoLogin(rs.getString(9));
                    usuario.setCorreo(rs.getString(7));

                    listaInscritosxEvento.add(usuario);
                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaInscritosxEvento;

    }







}
