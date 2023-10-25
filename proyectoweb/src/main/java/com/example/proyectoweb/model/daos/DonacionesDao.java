package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.DonacionAlumno;
import com.example.proyectoweb.model.beans.Donaciones;
import com.mysql.cj.jdbc.Blob;

import java.sql.*;
import java.util.ArrayList;

public class DonacionesDao {
    public ArrayList<Donaciones> listar(){
        ArrayList<Donaciones> listaDonaciones = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String user = "root";
        String pass = "root";
        String sql = "select * from registro_donaciones";

        try(Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                Donaciones donaciones = new Donaciones();
                donaciones.setIdRegistro_Donaciones(rs.getInt(1));
                donaciones.setIdUsuario(rs.getInt(2));
                donaciones.setComprobante(rs.getBlob(3));
                donaciones.setMonto(rs.getDouble(4));
                donaciones.setComprobado(rs.getBoolean(5));
                listaDonaciones.add(donaciones);
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaDonaciones;
    }


    public ArrayList<DonacionAlumno> getTablaDonaciones(){
        ArrayList<DonacionAlumno> listaDonacionesAlumno = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String user = "root";
        String pass = "root";
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario)";

        try(Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                DonacionAlumno donacionAlumno = new DonacionAlumno();
                donacionAlumno.setIdUsuario(rs.getInt(1));
                donacionAlumno.setIdDonaciones(rs.getInt(2));
                donacionAlumno.setNombres(rs.getString(3));
                donacionAlumno.setApellidos(rs.getString(4));
                donacionAlumno.setComprobante((Blob) rs.getBlob(5));
                donacionAlumno.setMonto(rs.getDouble(6));
                donacionAlumno.setComprobado(rs.getBoolean(7));

                listaDonacionesAlumno.add(donacionAlumno);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaDonacionesAlumno;
    }
}
