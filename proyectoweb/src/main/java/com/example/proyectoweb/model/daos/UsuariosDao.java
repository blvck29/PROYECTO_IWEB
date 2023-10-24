package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class UsuariosDao {

    public ArrayList<Usuario> listarTodosUsuarios (){ //admin
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        //Conexión a la DB

        String sql = "select * from usuarios";

        ArrayList<Usuario> listaUsuarios = new ArrayList();

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){

                Usuario usuario = new Usuario();

                usuario.setNombres(rs.getString(4));
                usuario.setApellidos(rs.getString(5));
                usuario.setCodigo(rs.getString(6));
                usuario.setIdRol(rs.getString(2));
                usuario.setIdEstado(rs.getString(3));
                usuario.setUltimoLogin(rs.getString(9));

                listaUsuarios.add(usuario);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaUsuarios;
    }




    public ArrayList<Usuario> buscarXnombreYcodigo(String palabraintroducida){ //admin

        ArrayList<Usuario> listaUsuarios = new ArrayList();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        //Conexión a la DB

        String sql = "select * from usuarios where lower(nombres) like ? or codigo like ?";


        try (Connection conn = DriverManager.getConnection(url,username,password);
             PreparedStatement pstmt = conn.prepareStatement(sql)){

             pstmt.setString(1, palabraintroducida + "%");
             pstmt.setString(2,palabraintroducida + "%");


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Usuario usuario = new Usuario();

                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setIdRol(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setUltimoLogin(rs.getString(9));

                    listaUsuarios.add(usuario);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaUsuarios;

    }


    public Usuario buscarXcodigo(String codigo){ //admin

        Usuario usuario = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        //Conexión a la DB

        String sql = "select * from usuarios where codigo =?";


        try (Connection conn = DriverManager.getConnection(url,username,password);
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, codigo);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    usuario = new Usuario();
                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setIdRol(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setUltimoLogin(rs.getString(9));
                    usuario.setCorreo(rs.getString(7));


                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return usuario;

    }


     public void actualizarEstado(Usuario usuario){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";

        String sql = "update usuarios set idEstado = ?  where codigo = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,usuario.getIdEstado());
            pstmt.setString(2,usuario.getCodigo());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }







    public ArrayList<Usuario> listarUsuariosAceptados (){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        //Parámetros de Conexión
        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String username = "root";
        String password = "root";


        //Conexión a la DB

        String sql = "select * from usuarios where idEstado = 'ACC' ";

        ArrayList<Usuario> listaUsuarios = new ArrayList();

        try(Connection conn = DriverManager.getConnection(url,username,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){

                Usuario usuario = new Usuario();

                usuario.setNombres(rs.getString(4));
                usuario.setApellidos(rs.getString(5));
                usuario.setCodigo(rs.getString(6));
                usuario.setIdRol(rs.getString(2));
                usuario.setIdEstado(rs.getString(3));
                usuario.setUltimoLogin(rs.getString(9));
                usuario.setCorreo(rs.getString(7));

                listaUsuarios.add(usuario);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaUsuarios;
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
