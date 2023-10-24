package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.daos.ActividadesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ActividadServlet", value = "/ActividadServlet")
public class ActividadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ActividadesDao actividadesDaoDao = new ActividadesDao();
       ArrayList<Actividad> listaActividades = actividadesDaoDao.getListaActividades();

       request.setAttribute("lista", listaActividades);

       RequestDispatcher view = request.getRequestDispatcher("home.jsp");
       view.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
