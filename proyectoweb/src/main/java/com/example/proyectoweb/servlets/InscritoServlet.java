package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.beans.UsuarioInscritoXevento;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.InscritosDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "InscritoServlet", value = "/InscritoServlet")
public class InscritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "listarInscritos" : request.getParameter("action");

        InscritosDao insDao = new InscritosDao();

        switch (action){
            case "listarInscritos":
                String id = request.getParameter("id");
                ArrayList<UsuarioInscritoXevento> listaUsuariosXevento = insDao.listarInscritosXevento(id);

                String nombreEvento = request.getParameter("id2");

                request.setAttribute("nombreEvento",nombreEvento);
                request.setAttribute("listaInscritosXevento",listaUsuariosXevento);
                request.getRequestDispatcher("/pages/admin_act/administrar_apoyos.jsp").forward(request,response);


                break;


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

