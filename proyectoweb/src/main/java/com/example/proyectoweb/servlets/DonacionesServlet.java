package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.daos.DonacionesDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "lista_donaciones", value = "/admin_gen_donaciones")
public class DonacionesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        DonacionesDao donacionesDao = new DonacionesDao();
        ArrayList<Donaciones> listaDonaciones = donacionesDao.listar();

        request.setAttribute("listaDonaciones", listaDonaciones);
        request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
