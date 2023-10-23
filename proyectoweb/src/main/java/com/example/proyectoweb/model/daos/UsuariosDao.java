package com.example.proyectoweb.model.daos;

import java.sql.*;

public class UsuariosDao {

    public void buscarUsuarioXNombre(String palabraintroducida){ //admin

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where lower(nombres) like ? order by nombres desc";

        try (Connection conn = DriverManager.getConnection(url,username,password);
             PreparedStatement pstmt = conn.prepareStatement(sql)){
             pstmt.setString(1, palabraintroducida + "%"); //sql

            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){

                    int idUser = rs.getInt(1);
                    String idRol = rs.getString(2);
                    String idEstado = rs.getString(3);
                    String nombre = rs.getString(4);
                    String apellido = rs.getString(5);
                    String codigo = rs.getString(6);
                    String correo = rs.getString(7);
                    int cantidadActividadesInscrito = rs.getInt(11);
                    System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void listarTodosUsuarios (){ //admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios";

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }


    }

    public void listarUsuariosNoBaneados(){ //admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idEstado = 'ACC' order by nombres desc";

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void listarUsuariosBaneados(){ //admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idEstado = 'BAN' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void listarUsuariosPendientes(){ //admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idEstado = 'PEN' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void listarUsuariosVerificados(){ //admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idEstado = 'VER' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void listarDelegadoActividad(){ //Visualizacion de delegado de actividad para el usuario admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idRol = 'ADMINSEC' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void listarUsuariosNoDelegados(){ //Sirve para poder escoger el delegado de actividad y ver los usuarios que no son delegados
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idRol = 'GRADUAT' or idRol = 'STUDENT' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public void mostrarEgresados(){ //admin cantidad de egresados
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idRol = 'GRADUAT' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }


    }

    public void mostrarAlumnos(){ //admin cantidad de alumnos
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String username = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        //Conexión a la DB

        String sql = "select * from usuarios where idRol = 'STUDENT' order by nombres desc";  //sql

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                int idUser = rs.getInt(1);
                String idRol = rs.getString(2);
                String idEstado = rs.getString(3);
                String nombre = rs.getString(4);
                String apellido = rs.getString(5);
                String codigo = rs.getString(6);
                String correo = rs.getString(7);
                int cantidadActividadesInscrito = rs.getInt(11);
                System.out.println("id Usuario: " + idUser + "| id Rol: " + idRol + "| id Estado: " + idEstado + "| Nombre: " + nombre + "| Apellido: " + apellido + "| Código: " + codigo + "| Correo: " + correo + "| cantidad de actividades inscritas: " + cantidadActividadesInscrito);

            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }




    // INSERTAR EL CAMBIO DE CONTRASEÑA (CON INSERT)
    // INSERTAR EL CAMBIO A DELEGADO DE ACTIVIDAD DE UN USUARIO NO DELEGADO




}