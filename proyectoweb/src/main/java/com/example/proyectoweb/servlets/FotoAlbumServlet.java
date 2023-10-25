package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.FotoAlbum;
import com.example.proyectoweb.model.daos.DonacionesDao;
import com.example.proyectoweb.model.daos.FotoAlbumDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "FotoAlbumServlet", value = "/FotoAlbumServlet")
public class FotoAlbumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        FotoAlbumDao fotoAlbumDao = new FotoAlbumDao();
        ArrayList<FotoAlbum> listaAlbums = fotoAlbumDao.listar();

        String vista = "pages/super_admin/lista_donaciones.jsp";
        request.setAttribute("lista", listaAlbums);
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
