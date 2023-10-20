package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.BeanEvento;

import java.sql.*;
import java.util.ArrayList;

public class EventosDao {
    ArrayList<BeanEvento> ListaEventos = new ArrayList<>();



    try {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/proyectoweb";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url,user,pass);
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT * FROM evento");

    } catch {

    }
    
}
