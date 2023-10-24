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

@WebServlet(name = "DonacionesServlet", value = "/DonacionesServlet")
public class DonacionesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        DonacionesDao donacionesDao = new DonacionesDao();
        ArrayList<Donaciones> listaDonaciones = donacionesDao.listar();

        String vista = "pages/super_admin/lista_donaciones.jsp";
        request.setAttribute("lista", listaDonaciones);
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request,response);

        /*request.setAttribute("lista", listaDonaciones);
        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
        view.forward(request,response);*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
