
package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class InscritosDao extends DaoBase{


    public ArrayList<Inscrito> listarInscritosXevento(String idEvento){

        ArrayList<Inscrito> listaInscritos = new ArrayList<>();

        String sql = "SELECT ins.idEvento, ri.nombre,u.*\n" +
                "FROM usuarios u\n" +
                "\tinner join inscripcion ins on (ins.Usuario = u.idUsuario)\n" +
                "    left join rol_inscrito ri on (ri.idRol_Inscrito = ins.idRol)\n" +
                "where ins.idEvento = ? ";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idEvento);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    Inscrito ins = new Inscrito();
                    ins.setIdEvento(rs.getInt(1));
                    ins.setRolEnEvento(rs.getString(2));

                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt(3));
                    u.setIdRol(rs.getString(4));
                    u.setIdEstado(rs.getString(5));
                    u.setNombres(rs.getString(6));
                    u.setApellidos(rs.getString(7));
                    u.setCodigo(rs.getString(8));
                    u.setCorreo(rs.getString(9));

                    ins.setUsuario(u);

                    listaInscritos.add(ins);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaInscritos;
    }







}
