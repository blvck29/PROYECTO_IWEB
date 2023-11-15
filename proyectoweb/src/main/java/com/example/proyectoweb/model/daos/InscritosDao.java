
package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
                    u.setIdRolSistema(rs.getString(4));
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


    public ArrayList<Inscrito>  inscritosPorEvento() {
        ArrayList<Inscrito> listaInscritos = new ArrayList<>();

        String sql = "SELECT idEvento, COUNT(*) as cantidad FROM inscripcion GROUP BY idEvento;";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Inscrito ins = new Inscrito();
                ins.setIdEvento(rs.getInt(1));
                ins.setCantidad(rs.getInt(2));
                listaInscritos.add(ins);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaInscritos;
    }

    public Inscrito buscarInscritoXid(String idUsuario){

        Inscrito ins = null;

        String sql = "SELECT ins.idEvento, ri.nombre,u.*\n" +
                "FROM usuarios u\n" +
                "\tinner join inscripcion ins on (ins.Usuario = u.idUsuario)\n" +
                "    left join rol_inscrito ri on (ri.idRol_Inscrito = ins.idRol)\n" +
                "where u.idUsuario = ? ";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idUsuario);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    ins = new Inscrito();
                    ins.setIdEvento(rs.getInt(1));
                    ins.setRolEnEvento(rs.getString(2));

                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt(3));
                    u.setIdRolSistema(rs.getString(4));
                    u.setIdEstado(rs.getString(5));
                    u.setNombres(rs.getString(6));
                    u.setApellidos(rs.getString(7));
                    u.setCodigo(rs.getString(8));
                    u.setCorreo(rs.getString(9));

                    ins.setUsuario(u);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return ins;
    }

public void actualizarRolInscrito(String nuevoRol, String idUsuario){

    String sql = "update inscripcion set idRol= ? where Usuario= ? ";

    try(Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setString(1,nuevoRol);
        pstmt.setString(2, idUsuario);
        pstmt.executeUpdate();

    } catch (SQLException e) {
        throw new RuntimeException(e);
    }


}


    public ArrayList<Inscrito> filtrarXrolInscritoEnEvento(String idEvento, String rol){

        ArrayList<Inscrito> lista = new ArrayList<>();

        String sql = "SELECT ins.idEvento, ri.nombre,u.*\n" +
                "FROM usuarios u\n" +
                "inner join inscripcion ins on (ins.Usuario = u.idUsuario) left join rol_inscrito ri on (ri.idRol_Inscrito = ins.idRol)\n" +
                "where ins.idEvento = ? and ri.idRol_Inscrito = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idEvento);
            pstmt.setString(2, rol);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    Inscrito ins = new Inscrito();
                    ins.setIdEvento(rs.getInt(1));
                    ins.setRolEnEvento(rs.getString(2));

                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt(3));
                    u.setIdRolSistema(rs.getString(4));
                    u.setIdEstado(rs.getString(5));
                    u.setNombres(rs.getString(6));
                    u.setApellidos(rs.getString(7));
                    u.setCodigo(rs.getString(8));
                    u.setCorreo(rs.getString(9));

                    ins.setUsuario(u);

                    lista.add(ins);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return lista;
    }


    public ArrayList<Inscrito> buscarInscritosXnombreCodigo(String idEvento, String palabraIngresada){

        ArrayList<Inscrito> lista = new ArrayList<>();

        String sql = "SELECT ins.idEvento, ri.nombre,u.*\n" +
                "FROM usuarios u\n" +
                "inner join inscripcion ins on (ins.Usuario = u.idUsuario) left join rol_inscrito ri on (ri.idRol_Inscrito = ins.idRol)\n" +
                "where ins.idEvento = ? and (u.nombres like ? or u.codigo like ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idEvento);
            pstmt.setString(2, palabraIngresada + "%");
            pstmt.setString(3, palabraIngresada + "%");


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    Inscrito ins = new Inscrito();
                    ins.setIdEvento(rs.getInt(1));
                    ins.setRolEnEvento(rs.getString(2));

                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt(3));
                    u.setIdRolSistema(rs.getString(4));
                    u.setIdEstado(rs.getString(5));
                    u.setNombres(rs.getString(6));
                    u.setApellidos(rs.getString(7));
                    u.setCodigo(rs.getString(8));
                    u.setCorreo(rs.getString(9));

                    ins.setUsuario(u);

                    lista.add(ins);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return lista;
    }





}
