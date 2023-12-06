package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.DonacionesDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

@WebServlet(name = "AdminGenServlet", value = "/admin_gen")
public class AdminGenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");
        if (user.getIdRolSistema().equals("DELGEN")){

            UsuariosDao userDao = new UsuariosDao();
            String action = request.getParameter("action") == null? "home" : request.getParameter("action");
            ArrayList<Usuario> listaUsuarios = userDao.listarTodosUsuarios();

            switch (action){
                case "home":
                    String pagina = request.getParameter("pagina") == null? "1" : request.getParameter("pagina");
                    System.out.println(pagina);

                    request.setAttribute("listaUsuarios",listaUsuarios);
                    request.getRequestDispatcher("pages/super_admin/tabla_inscritos.jsp").forward(request,response);
                    break;

                case "editar":
                    String codigo = request.getParameter("id");
                    Usuario usuario = userDao.buscarXcodigo(codigo);

                    if(usuario != null){
                        request.setAttribute("usuario", usuario);
                        request.getRequestDispatcher("pages/super_admin/editar_estado.jsp").forward(request,response);
                    }
                    else{
                        response.sendRedirect(request.getContextPath()+"/admin_gen");
                    }
                    break;

                case "activities":

                    String ac = request.getParameter("ac") == null? "list" : request.getParameter("ac");

                    ActividadesDao actividadesDao = new ActividadesDao();
                    ArrayList<Actividad> listarActividadesConDelegado = actividadesDao.listarActividadesConDelegado();

                    switch (ac){
                        case "list":
                            request.setAttribute("listaActividades",listarActividadesConDelegado);
                            request.getRequestDispatcher("pages/super_admin/lista_actividades.jsp").forward(request,response);
                            break;

                        case "crear":
                            ArrayList<Usuario> listaDelegadosDisponibles = userDao.listarDelegadosActDisponibles();

                            ArrayList<Actividad> listaActividades = actividadesDao.getListaActividades();
                            request.setAttribute("listaActividades",listaActividades);
                            request.setAttribute("listaUsuarios",listaDelegadosDisponibles);

                            request.getRequestDispatcher("/pages/super_admin/new_activity.jsp").forward(request,response);
                            break;

                        case "edit":
                            Actividad actividad = actividadesDao.buscarPorTitulo(request.getParameter("id"));
                            String idDelActual = request.getParameter("idDelActual");
                            ArrayList<Usuario> listaUsuarios2 = userDao.listarTodosUsuarios();
                            ArrayList<Actividad> listaActividades2 = actividadesDao.getListaActividades();

                            if (actividad != null){
                                request.setAttribute("idDelActual", idDelActual);
                                request.setAttribute("listaActividades",listaActividades2);
                                request.setAttribute("actividad",actividad);
                                request.setAttribute("listaUsuarios",listaUsuarios2);
                                request.getRequestDispatcher("/pages/super_admin/edit_activity.jsp").forward(request, response);
                            }
                            else{
                                response.sendRedirect(request.getContextPath()+"/admin_gen?action=activities");
                            }
                            break;

                        case "delete":
                            try {
                                String idActividad = request.getParameter("id");
                                String idDelegado = request.getParameter("idDelegado");
                                String nuevoRol = "USER";
                                System.out.println("id a eliminar: "+ idActividad);
                                System.out.println("idDelegado a eliminar: " + idDelegado);

                                userDao.actualizarRolSistema(idDelegado, nuevoRol);
                                actividadesDao.eliminarActividad(idActividad);
                                response.sendRedirect(request.getContextPath() + "/admin_gen?action=activities");
                            } catch (SQLIntegrityConstraintViolationException e) {
                                e.printStackTrace();  // o loguea el error
                                HttpSession httpSession = request.getSession();
                                httpSession.setAttribute("msgError", "No se pudo eliminar, ya que existen eventos relacionados a esta actividad");
                                response.sendRedirect(request.getContextPath() + "/admin_gen?action=activities");
                            }

                            break;
                    }

                    break;

                case "statistics":
                    request.getRequestDispatcher("pages/super_admin/statistics.jsp").forward(request,response);
                    break;


                case "donations":
                    DonacionesDao donacionesDao = new DonacionesDao();

                    String ac2 = request.getParameter("ac") == null? "list" : request.getParameter("ac");
                    ArrayList<Donaciones> listaDonaciones = donacionesDao.listar();

                    switch (ac2){
                        case "list":
                            request.setAttribute("listaDonaciones", listaDonaciones);
                            request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);
                            break;


                        case "ver": //Editar
                            String idDonante = request.getParameter("idDonante");
                            Donaciones donanteBuscado = donacionesDao.buscarPorIdDonante(idDonante);

                            request.setAttribute("Donante", donanteBuscado);
                            request.getRequestDispatcher("/pages/super_admin/ver_donacion.jsp").forward(request,response);

                    }
                    break;
            }

        } else {
            session.invalidate();
            request.getRequestDispatcher("login?action=unvalid_session").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");
        if (user.getIdRolSistema().equals("DELGEN")){

            UsuariosDao userDao = new UsuariosDao();
            ActividadesDao actividadesDao = new ActividadesDao();
            String action = request.getParameter("action") == null? "home" : request.getParameter("action");
            String ac = request.getParameter("ac") == null? "busqueda" : request.getParameter("ac");

            switch(action){
                case "home":

                    switch (ac){
                        case "busqueda":
                            String usuarioBuscado = request.getParameter("busquedaNombreCodigo");
                            ArrayList<Usuario> listaBusqueda = userDao.buscarXnombreYcodigo(usuarioBuscado);

                            request.setAttribute("listaUsuarios",listaBusqueda);
                            request.getRequestDispatcher("pages/super_admin/tabla_inscritos.jsp").forward(request,response);
                            break;

                        case "busquedaPorEstado":
                            String filtroEstado = request.getParameter("id");
                            ArrayList<Usuario> listaPorEstado = userDao.listarPorEstado(filtroEstado);

                            request.setAttribute("listaUsuarios", listaPorEstado);
                            request.getRequestDispatcher("pages/super_admin/tabla_inscritos.jsp").forward(request,response);
                            break;

                        case "editarEstadoUsuario":

                            String nuevoEstadoUsuario = request.getParameter("estado");
                            String idUsuario = request.getParameter("idUsuario");

                            System.out.println("nuevo estado: " + nuevoEstadoUsuario);
                            System.out.println("idusaurio: " + idUsuario);




                            if(nuevoEstadoUsuario.equals("eliminarUsuario")){
                                userDao.eliminarUsuario(idUsuario);
                            }
                            else {
                                userDao.editarEstadoUsuario(idUsuario, nuevoEstadoUsuario);
                            }

                            response.sendRedirect(request.getContextPath() + "/admin_gen");
                            break;

                    }
                    break;

                case "activities":

                    switch (ac){
                        case "busqueda":

                            String actividadBuscada = request.getParameter("busquedaTituloActividad");
                            ArrayList<Actividad> listaActividadFiltrada = actividadesDao.filtrarXTitulo(actividadBuscada);

                            request.setAttribute("listarActividadesConDelegado",listaActividadFiltrada);
                            request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);
                            break;


                        case "crear":
                            String tituloActividad = request.getParameter("nombreActividad");
                            String idActividad = tituloActividad.toUpperCase();
                            String idDelegado = request.getParameter("idDelegado");
                            String nuevoRol = "DELACT";

                            userDao.actualizarRolSistema(idDelegado, nuevoRol);
                            actividadesDao.crearActividad(idActividad,tituloActividad,Integer.parseInt(idDelegado));
                            response.sendRedirect(request.getContextPath() + "/admin_gen?action=activities");

                            break;

                        case "editar":
                            String idDelActual = request.getParameter("idDelActual");
                            String tituloActividad2 = request.getParameter("tituloActividad");
                            String idActividad2 = tituloActividad2.toUpperCase();
                            String idDelegado2 = request.getParameter("idDelegado");

                            userDao.actualizarRolSistema(idDelActual, "USER");
                            userDao.actualizarRolSistema(idDelegado2, "DELACT");
                            actividadesDao.actualizarActividad(idActividad2, Integer.parseInt(idDelegado2));
                            response.sendRedirect(request.getContextPath() + "/admin_gen?action=activities");

                            break;
                    }

                    break;

                case "donations":
                    DonacionesDao donacionesDao = new DonacionesDao();

                    switch (ac){
                        case "busqueda":
                            String nombreBuscado = request.getParameter("nombreDonante");
                            ArrayList<Donaciones> listaDonacionesFiltrada = donacionesDao.buscarPorNombre(nombreBuscado);

                            request.setAttribute("listaDonaciones",listaDonacionesFiltrada);
                            request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);

                            break;

                        case "filtrarComprobados":
                            String comprobacionId = request.getParameter("id");
                            ArrayList<Donaciones> listaDonacionesPorComprobacion = donacionesDao.listarComprobados(comprobacionId);

                            request.setAttribute("listaDonaciones",listaDonacionesPorComprobacion);
                            request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);

                            break;
                        case "editarDonacion":

                            String donacionId = request.getParameter("idDonacion");
                            String montoStr = request.getParameter("monto");
                            String fechaDonacion = request.getParameter("fecha-donacion");
                            String horaDonacion = request.getParameter("hora-donacion");
                            String estadoDonacion = request.getParameter("estado");

                            String montoStr1 = montoStr.substring(3);

                            double montoInt = Double.parseDouble(montoStr1);

                            int estadoDonacionInt = Integer.parseInt(estadoDonacion);

                            donacionesDao.actualizarDonacion(Integer.parseInt(donacionId), montoInt, fechaDonacion, horaDonacion, estadoDonacionInt);
                            response.sendRedirect(request.getContextPath() + "/admin_gen?action=donations");

                            break;
                    }
                    break;
            }

        } else {
            session.invalidate();
            request.getRequestDispatcher("login?action=unvalid_session").forward(request, response);
        }

    }

}
