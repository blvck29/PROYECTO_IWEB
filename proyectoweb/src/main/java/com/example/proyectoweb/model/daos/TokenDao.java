package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.RandomTokenGenerator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TokenDao extends DaoBase{

    public void generate(String idUsuario){

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


}
