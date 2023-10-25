package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.daos.ActividadesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ActividadServlet", value = "/adm_actividades")
public class ActividadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "listarAct" : request.getParameter("action");

        switch(action){
            case "listarAct":
                ActividadesDao actividadesDao = new ActividadesDao();
                ArrayList<DelegadoAct> listaDelegadosAct = actividadesDao.listarNombresEncargadosAct();
                request.setAttribute("listaDelegadosAct", listaDelegadosAct);
                request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);
                break;


        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
