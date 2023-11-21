
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
                donacionAlumno.setComprobado(rs.getInt(7)); // Ahora devuelve un INT
                donacionAlumno.setFechaDonacion(rs.getString(8));
                donacionAlumno.setIdRolAcademico(rs.getString(9));

                listaDonacionesAlumno.add(donacionAlumno);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaDonacionesAlumno;
    }

    public double sumarDonacionesEstudiantes() {
        double totalDonacionesEstudiantes = 0.0;
        String sql = "SELECT SUM(don.monto) FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) WHERE u.idRolAcademico = 'STUDENT'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                totalDonacionesEstudiantes = rs.getDouble(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalDonacionesEstudiantes;
    }


    public double sumarDonacionesEgresados() {
        double totalDonacionesEgresados = 0.0;
        String sql = "SELECT SUM(don.monto) FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) WHERE u.idRolAcademico = 'GRADUAT'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                totalDonacionesEgresados = rs.getDouble(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalDonacionesEgresados;
    }




    public ArrayList<Donaciones> buscarPorNombre(String nombre){

        ArrayList<Donaciones> listaDonaciones = new ArrayList();

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico \n" +
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
                    donacion.setComprobado(rs.getInt(7)); // Devuelve int
                    donacion.setFechaDonacion(rs.getString(8));
                    donacion.setIdRolAcademico(rs.getString(9));

                    listaDonaciones.add(donacion);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaDonaciones;
    }


    public Donaciones buscarPorIdDonante(String id){

        Donaciones donacion = null;

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico \n" +
                "FROM registro_donaciones don \n" +
                "INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) \n" +
                "where don.idUsuario = ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, id );


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    donacion = new Donaciones();
                    donacion.setIdUsuario(rs.getInt(1));
                    donacion.setIdDonaciones(rs.getInt(2));
                    donacion.setNombres(rs.getString(3));
                    donacion.setApellidos(rs.getString(4));
                    donacion.setComprobante((Blob) rs.getBlob(5));
                    donacion.setMonto(rs.getDouble(6));
                    donacion.setComprobado(rs.getInt(7)); // Devuelve int
                    donacion.setFechaDonacion(rs.getString(8));
                    donacion.setIdRolAcademico(rs.getString(9));
                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return donacion;
    }


    public ArrayList<Donaciones> listarComprobados(String comprobacionId){
        ArrayList<Donaciones> listaDonaciones = new ArrayList();

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico  \n" +
                "FROM registro_donaciones don \n" +
                "INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) \n" +
                "where comprobado = ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, comprobacionId);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Donaciones donacion = new Donaciones();
                    donacion.setIdUsuario(rs.getInt(1));
                    donacion.setIdDonaciones(rs.getInt(2));
                    donacion.setNombres(rs.getString(3));
                    donacion.setApellidos(rs.getString(4));
                    donacion.setComprobante((Blob) rs.getBlob(5));
                    donacion.setMonto(rs.getDouble(6));
                    donacion.setComprobado(rs.getInt(7)); // devuelve int
                    donacion.setFechaDonacion(rs.getString(8));
                    donacion.setIdRolAcademico(rs.getString(9));

                    listaDonaciones.add(donacion);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaDonaciones;

    }

    public void actualizarDonacion(int donacionId, double monto, String fecha, String hora, int estadoDonacion){

        String sql ="update registro_donaciones set monto= ? , fecha = ? , comprobado = ? where idRegistro_Donaciones = ? ";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDouble(1,monto);

            String fechaHora = fecha + " " + hora; //Se coloca asi para poder tener compatibilidad con la db
            pstmt.setString(2,fechaHora);
            pstmt.setInt(3,estadoDonacion);
            pstmt.setInt(4,donacionId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }


    public ArrayList<Donaciones> listarDonacionesPaginacion(Integer offset){

        ArrayList<Donaciones> listaDonacionesPaginacion = new ArrayList<>();
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) limit 10 offset ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){

            pstmt.setInt(1,  (int) offset);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    Donaciones donacionAlumno = new Donaciones();
                    donacionAlumno.setIdUsuario(rs.getInt(1));
                    donacionAlumno.setIdDonaciones(rs.getInt(2));
                    donacionAlumno.setNombres(rs.getString(3));
                    donacionAlumno.setApellidos(rs.getString(4));
                    donacionAlumno.setComprobante((Blob) rs.getBlob(5));
                    donacionAlumno.setMonto(rs.getDouble(6));
                    donacionAlumno.setComprobado(rs.getInt(7)); // Ahora devuelve un INT
                    donacionAlumno.setFechaDonacion(rs.getString(8));
                    donacionAlumno.setIdRolAcademico(rs.getString(9));

                    listaDonacionesPaginacion.add(donacionAlumno);
                }

            }


        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaDonacionesPaginacion;
    }








}

