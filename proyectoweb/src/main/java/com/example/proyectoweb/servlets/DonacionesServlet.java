package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Donaciones;

import com.example.proyectoweb.model.daos.DonacionesDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DonacionesServlet", value = "/DonacionesServlet")
public class DonacionesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DonacionesDao donacionesDao = new DonacionesDao();
        ArrayList<Donaciones> listaDonaciones = donacionesDao.getListaDonaciones();

        request.setAttribute("lista", listaDonaciones);

        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
