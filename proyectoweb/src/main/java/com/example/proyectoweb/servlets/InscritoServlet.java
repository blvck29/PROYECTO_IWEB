package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscrito;
import com.example.proyectoweb.model.beans.Usuario;
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

        InscritosDao inscritoDao = new InscritosDao();
        UsuariosDao userDao = new UsuariosDao();

        ArrayList<Inscrito> listaInscritos = inscritoDao.getListaInscritos();
        ArrayList<Usuario> listaUsuarios=new ArrayList<>();



        for(Inscrito inscrito: listaInscritos ){
            Usuario usuario=userDao.buscarXid(inscrito.getIdUsuario());
            listaUsuarios.add(usuario);
        }




        request.setAttribute("listaInscritos", listaInscritos);
        request.setAttribute("listaUsuarios", listaUsuarios);

        RequestDispatcher view = request.getRequestDispatcher("pages/admin_act/administrar_apoyosxevento.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

