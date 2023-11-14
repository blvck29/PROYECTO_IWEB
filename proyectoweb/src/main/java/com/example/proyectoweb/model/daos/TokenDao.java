package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.RandomTokenGenerator;
import com.example.proyectoweb.model.beans.Token;
import com.example.proyectoweb.model.beans.Usuario;

import javax.naming.AuthenticationNotSupportedException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TokenDao extends DaoBase{

    public void generateToken(String correo){

        Usuario usuario = userTokenByEmail(correo);
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

    public Usuario userTokenByEmail(String correo){

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

    public Usuario UserTokenById(String id){

        Usuario usuario = new Usuario();

        String sql = "SELECT * FROM proyectoweb.usuarios WHERE idUsuario = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, id);
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


    public boolean findToken(String enteredToken){

        String token = null;

        String sql = "SELECT token FROM proyectoweb.token_generado WHERE token = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, enteredToken);
            try(ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    token = rs.getString(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return (token!=null);
    }

    public ArrayList<Token> listarTokens(){
        ArrayList<Token> tokenList = new ArrayList<>();

        String sql = "select * from token_generado";


        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql) ) {

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    Token token = new Token();

                    token.setIdToken(rs.getInt(1));

                    String id = rs.getString(2);
                    Usuario user = UserTokenById(id);
                    token.setUsuario(user);

                    token.setToken(rs.getString(3));

                    tokenList.add(token);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return tokenList;
    }

    public String getUserByToken(String token){

        String idUsuario = null;

        String sql = "SELECT idUsuario FROM proyectoweb.token_generado WHERE token = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, token);
            try(ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    idUsuario = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idUsuario;
    }

    public boolean verificarUsuario(String token){

        String idUsuario = getUserByToken(token);

        String sql = "UPDATE `proyectoweb`.`usuarios` SET `idEstado` = 'VER' WHERE (`idUsuario` = ?);";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return (token!=null);
    }


}
