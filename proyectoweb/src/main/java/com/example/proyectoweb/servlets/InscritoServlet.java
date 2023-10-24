package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.InscritosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InscritoServlet", value = "/InscripcionServlet")
public class InscritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InscritosDao inscritoDao = new InscritosDao();

        ArrayList<Inscrito> listaInscritos = inscritoDao.getListaInscritos();

        request.setAttribute("listaInscritos", listaInscritos);

        RequestDispatcher view = request.getRequestDispatcher("pages/delegado/tablaInscritosxevento.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

