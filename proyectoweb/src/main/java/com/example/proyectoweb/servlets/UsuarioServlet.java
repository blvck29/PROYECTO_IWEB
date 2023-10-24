package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuariosDao userDao = new UsuariosDao();

        String action = request.getParameter("action") == null? "lista" : request.getParameter("action");

        switch (action){
            case "lista":
                //Listar:
                ArrayList<Usuario> listaUsuarios = userDao.listarTodosUsuarios();
                request.setAttribute("listaUsuarios",listaUsuarios);
                request.getRequestDispatcher("pages/super_admin/tablaInscritos.jsp").forward(request,response);
                break;

            case "editar":
                String codigo = request.getParameter("id");
                Usuario usuario = userDao.buscarXcodigo(codigo);

                if(usuario != null){
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("pages/super_admin/editarEstado.jsp").forward(request,response);
                }
                else{
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
                }
                break;





        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuariosDao userDao = new UsuariosDao();
        String action = request.getParameter("action") == null? "buscar" : request.getParameter("action");

        switch(action){
            case "busqueda":
                String usuarioBuscado = request.getParameter("busquedaNombreCodigo");
                ArrayList<Usuario> listaBusqueda = userDao.buscarXnombreYcodigo(usuarioBuscado);

                request.setAttribute("listaUsuarios",listaBusqueda);
                request.getRequestDispatcher("pages/super_admin/tablaInscritos.jsp").forward(request,response);






        }

    }

}
