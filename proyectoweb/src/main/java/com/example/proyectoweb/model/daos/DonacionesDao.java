package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.Usuario;
import com.mysql.cj.jdbc.Blob;

import java.sql.*;
import java.util.ArrayList;

public class DonacionesDao extends DaoBase{

    public ArrayList<Donaciones> listar(){

        ArrayList<Donaciones> listaDonacionesAlumno = new ArrayList<>();
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario)";

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                Donaciones donacionAlumno = new Donaciones();
                donacionAlumno.setIdUsuario(rs.getInt(1));
                donacionAlumno.setIdDonaciones(rs.getInt(2));
                donacionAlumno.setNombres(rs.getString(3));
                donacionAlumno.setApellidos(rs.getString(4));
                donacionAlumno.setComprobante((Blob) rs.getBlob(5));
                donacionAlumno.setMonto(rs.getDouble(6));
                donacionAlumno.setComprobado(rs.getBoolean(7));
                donacionAlumno.setFechaDonacion(rs.getString(8));
                donacionAlumno.setIdRolAcademico(rs.getString(9));

                listaDonacionesAlumno.add(donacionAlumno);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaDonacionesAlumno;
    }



    public ArrayList<Donaciones> buscarPorNombre(String nombre){

        ArrayList<Donaciones> listaDonaciones = new ArrayList();

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado \n" +
                "FROM registro_donaciones don \n" +
                "INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) \n" +
                "where lower(nombres) like ? or lower(apellidos) like ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, nombre + "%");
            pstmt.setString(2,nombre + "%");


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Donaciones donacion = new Donaciones();
                    donacion.setIdUsuario(rs.getInt(1));
                    donacion.setIdDonaciones(rs.getInt(2));
                    donacion.setNombres(rs.getString(3));
                    donacion.setApellidos(rs.getString(4));
                    donacion.setComprobante((Blob) rs.getBlob(5));
                    donacion.setMonto(rs.getDouble(6));
                    donacion.setComprobado(rs.getBoolean(7));

                    listaDonaciones.add(donacion);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaDonaciones;
    }


    public ArrayList<Donaciones> listarComprobados(String comprobacion){
        ArrayList<Donaciones> listaDonaciones = new ArrayList();

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado \n" +
                "FROM registro_donaciones don \n" +
                "INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) \n" +
                "where comprobado = ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, comprobacion);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Donaciones donacion = new Donaciones();
                    donacion.setIdUsuario(rs.getInt(1));
                    donacion.setIdDonaciones(rs.getInt(2));
                    donacion.setNombres(rs.getString(3));
                    donacion.setApellidos(rs.getString(4));
                    donacion.setComprobante((Blob) rs.getBlob(5));
                    donacion.setMonto(rs.getDouble(6));
                    donacion.setComprobado(rs.getBoolean(7));

                    listaDonaciones.add(donacion);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaDonaciones;

    }
}

