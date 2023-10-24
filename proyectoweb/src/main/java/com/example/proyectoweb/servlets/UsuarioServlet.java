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
        String action = request.getParameter("action") == null? "listar" : request.getParameter("action");

        UsuariosDao userDao = new UsuariosDao();

        switch (action){
            case "listar":
                //Listar:
                ArrayList<Usuario> listaUsuarios = userDao.listarTodosUsuarios();
                request.setAttribute("listaUsuarios",listaUsuarios);
                request.getRequestDispatcher("pages/super_admin/tablaInscritos.jsp").forward(request,response);

            case "editarEstado":
                String codigo = request.getParameter("id");
                Usuario usuario = userDao.buscarPorCodigo(codigo);

                if(usuario != null){
                    request.setAttribute("usuario",usuario);
                    request.getRequestDispatcher("pages/super_admin/editarEstado.jsp").forward(request,response);
                }
                else{
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
                }



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
