
package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.beans.UsuarioInscritoXevento;

import java.sql.*;
import java.util.ArrayList;

public class InscritosDao {


    public ArrayList<UsuarioInscritoXevento> listarInscritosXevento(String idEvento){

        ArrayList<UsuarioInscritoXevento> listaInscritosXEvento = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        String sql = "SELECT u.idUsuario, u.codigo, u.nombres, u.apellidos, ins.idEvento, ev.titulo\n" +
                "FROM inscripcion ins\n" +
                "\tINNER JOIN usuarios u on (ins.Usuario = u.idUsuario)\n" +
                "    INNER JOIN evento ev on (ins.idEvento = ev.idEvento)\n" +
                " where ev.idEvento = ? ";

        try (Connection conn = DriverManager.getConnection(url,username,password);
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idEvento);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    UsuarioInscritoXevento usuario = new UsuarioInscritoXevento();
                    usuario.setNombres(rs.getString(3));
                    usuario.setApellidos(rs.getString(4));
                    usuario.setCodigo(rs.getString(2));
                    usuario.setIdUsuario(rs.getString(1));
                    usuario.setIdEvento(rs.getString(5));
                    usuario.setTituloEventoInscrito(rs.getString(6));

                    listaInscritosXEvento.add(usuario);
                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaInscritosXEvento;

    }







}
