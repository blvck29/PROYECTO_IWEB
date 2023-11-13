package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.RandomTokenGenerator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TokenDao {

    public void generate(String idUsuario){

        String token = RandomTokenGenerator.generator();


        String sql = "INSERT INTO `proyectoweb`.`token_generado` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (?, ?, ?, ?, ?, ?);";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, locationId);
            pstmt.setString(2, streetAddress);
            pstmt.setString(3, postalCode);
            pstmt.setString(4, city);
            pstmt.setString(5, stateProvince);
            pstmt.setString(6, countryId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}
