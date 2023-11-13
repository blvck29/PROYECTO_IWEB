package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.RandomTokenGenerator;
import com.example.proyectoweb.model.beans.Usuario;

import javax.naming.AuthenticationNotSupportedException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TokenDao extends DaoBase{

    public void generateToken(String correo){

        Usuario usuario = userToken(correo);
        String idUsuario = String.valueOf(usuario.getIdUsuario());
        String token = RandomTokenGenerator.generator();

        String sql = "INSERT INTO `proyectoweb`.`token_generado` (`idUsuario`, `token`) VALUES (?, ?);";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idUsuario);
            pstmt.setString(2, token);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Usuario userToken(String correo){

        Usuario usuario = new Usuario();

        String sql = "SELECT * FROM proyectoweb.usuarios WHERE correo_pucp = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, correo);
            try(ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {

                    usuario.setIdUsuario(rs.getInt(1));
                    usuario.setIdRolSistema(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setCorreo(rs.getString(7));
                    // Sin contraseña por seguridad.
                    usuario.setFechaCreacion(rs.getString(9));
                    usuario.setCantEventsInscrito(rs.getString(10));
                    usuario.setIdRolAcademico(rs.getString(11));
                    usuario.setKitTeleco(rs.getInt(12));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }


}
