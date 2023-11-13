package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.RandomTokenGenerator;
import com.example.proyectoweb.model.beans.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TokenDao extends DaoBase{

    public void generateToken(String idUsuario){

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

    public void userToken(String correo){


        String sql = "SELECT * FROM proyectoweb.usuarios WHERE correo_pucp = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, correo);
            try(ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Usuario user = new Usuario();

                    user.setIdUsuario(rs.getInt(1));
                    user.setStreetAddress(rs.getString(2));
                    user.setPostalCode(rs.getString(3));
                    user.setCity(rs.getString(4));
                    user.setStateProvince(rs.getString(5));

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}
