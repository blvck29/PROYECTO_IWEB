package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.Dtos.DonacionUserDto;
import com.example.proyectoweb.model.beans.*;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.DonacionesDao;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "AdminGenServlet", value = "/admin_gen")
public class AdminGenServlet extends HttpServlet {

    UsuariosDao userDao = new UsuariosDao();
    ActividadesDao actividadesDao = new ActividadesDao();
    DonacionesDao donacionesDao = new DonacionesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("usuario");

            String action = request.getParameter("action") == null? "home" : request.getParameter("action");
            ArrayList<Usuario> listaUsuarios = userDao.listarTodosUsuarios();

            switch (action){
                case "home":
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

                    String ac2 = request.getParameter("ac") == null? "list" : request.getParameter("ac");

                    ArrayList<Actividad> listarActividadesConDelegado = actividadesDao.listarActividadesConDelegado();

                    switch (ac2){
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
                    ArrayList<Actividad> listaActividades= actividadesDao.listarActividadesConDelegado();

                    ArrayList<Usuario> listaUsuario= userDao.listarTodosUsuarios();

                    ArrayList<Donaciones> listaDonaciones1= donacionesDao.listarTodasDonaciones();
                    double totalDonacionesEgresados=donacionesDao.sumarDonacionesEgresados();
                    double totalDonacionesEstudiantes=donacionesDao.sumarDonacionesEstudiantes();
                    int totalestudiantes=userDao.contarEstudiantes();
                    int totalgraduados=userDao.contargraduados();
                    ArrayList<ArrayList<Integer>> conteorolesgeneral = userDao.contarRolesTodasActividades();
                    ArrayList<String> NombresActividades=userDao.obtenerNombresActividades();

                    String select = request.getParameter("select") == null? "unoCaso" : request.getParameter("select");
                    switch (select){
                        case "unoCaso":
                            request.setAttribute("listaDonaciones",listaDonaciones1);
                            request.setAttribute("totalDonacionesEstudiantes",totalDonacionesEstudiantes);
                            request.setAttribute("totalDonacionesEgresados",totalDonacionesEgresados);


                            request.getRequestDispatcher("pages/super_admin/statisticsRecaudaciones.jsp").forward(request,response);
                            break;
                        case "canAl":
                            request.setAttribute("listaUsuarios",listaUsuario);
                            request.setAttribute("totalestudiantes",totalestudiantes);
                            request.setAttribute("totalgraduados",totalgraduados);



                            request.getRequestDispatcher("pages/super_admin/statisticsStudent.jsp").forward(request,response);
                            break;
                        case "cantAp":
                            request.setAttribute("listaActividades",listaActividades);
                            request.setAttribute("listaUsuarios",listaUsuario);
                            request.setAttribute("conteorolesgeneral",conteorolesgeneral);
                            request.setAttribute("NombresActividades",NombresActividades);
                            System.out.println(NombresActividades);
                            System.out.println(conteorolesgeneral);

                            request.getRequestDispatcher("pages/super_admin/statisticsSupports.jsp").forward(request,response);
                            break;
                    }
                    break;

                case "donations":
                    DonacionesDao donacionesDao = new DonacionesDao();
                    UsuariosDao usuariosDao = new UsuariosDao();

                    String ac = request.getParameter("ac") == null? "list" : request.getParameter("ac");

                    switch (ac){
                        case "list":
                            ArrayList<Donaciones> listaDonaciones = donacionesDao.listarTodasDonaciones();
                            request.setAttribute("listaDonaciones", listaDonaciones);
                            //Lista detalles
                            ArrayList<DonacionUserDto> listaDonacionesUsuariosDetalles = usuariosDao.obtenerListaDetalles();
                            request.setAttribute("listaDetalles", listaDonacionesUsuariosDetalles);
                            request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);
                            break;

                        case "ver": //Editar
                            String idDonante = request.getParameter("idDonante");
                            Donaciones donanteBuscado = donacionesDao.buscarPorIdDonante(idDonante);

                            request.setAttribute("Donante", donanteBuscado);
                            request.getRequestDispatcher("/pages/super_admin/ver_donacion.jsp").forward(request,response);
                    }
                    break;

                case "imagenPorActividad":
                    Boolean b = actividadesDao.validarSizeImagen(response, request.getParameter("idActividad"));

                    System.out.println(b);

                    if(b == true){
                        actividadesDao.listarImagenPorActividad(response, request.getParameter("idActividad"),4);
                    }else{
                        actividadesDao.listarImagenPorActividad(response, request.getParameter("idActividad"),3);
                    }
                    break;
                case "profile":
                    EventosDao eventosDao= new EventosDao();
                    ArrayList<Evento> eventosXusuario = eventosDao.listarEventosInscritos(user.getIdUsuario());
                    request.setAttribute("listaEventos",eventosXusuario);
                    request.getRequestDispatcher("/pages/super_admin/profileSuperAdmin.jsp").forward(request,response);
                    for (Evento evento : eventosXusuario) {
                        System.out.println(evento.getTitulo());
                    }
                    break;
            }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");

            String action = request.getParameter("action") == null ? "home" : request.getParameter("action");
            String ac = request.getParameter("ac") == null ? "busqueda" : request.getParameter("ac");

            switch (action) {
                case "home":
                    Integer limit = 8;
                    String pagina = request.getParameter("pagina") == null ? "1" : request.getParameter("pagina");

                    switch (ac) {

                        case "busquedaPorEstado":
                            String filtroEstado = request.getParameter("id");
                            ArrayList<Usuario> listaPorEstado = userDao.listarPorEstado(filtroEstado);
                            Double totalUsuarios = (double) listaPorEstado.size();
                            Double cantPaginas = Math.ceil(totalUsuarios / limit);
                            ArrayList<Usuario> listaPorEstadoPaginacion = userDao.listarPorEstadoPaginacion(filtroEstado, limit, limit * (Integer.parseInt(pagina) - 1));

                            request.setAttribute("indicador", filtroEstado);
                            request.setAttribute("cantPaginas", Double.valueOf(cantPaginas).intValue());
                            request.setAttribute("listaUsuarios", listaPorEstadoPaginacion);
                            request.getRequestDispatcher("pages/super_admin/tabla_inscritos.jsp").forward(request, response);
                            break;

                        case "editarEstadoUsuario":

                            String nuevoEstadoUsuario = request.getParameter("estado");
                            String idUsuario = request.getParameter("idUsuario");

                            System.out.println("nuevo estado: " + nuevoEstadoUsuario);
                            System.out.println("idusaurio: " + idUsuario);


                            if (nuevoEstadoUsuario.equals("eliminarUsuario")) {
                                userDao.eliminarUsuario(idUsuario);
                            } else {
                                userDao.editarEstadoUsuario(idUsuario, nuevoEstadoUsuario);
                            }

                            response.sendRedirect(request.getContextPath() + "/admin_gen");
                            break;

                    }
                    break;

                case "activities":

                    switch (ac) {
                        case "crear":
                            String tituloActividad = request.getParameter("nombreActividad");
                            String idActividad = tituloActividad.toUpperCase();
                            String idDelegado = request.getParameter("idDelegado");
                            String nuevoRol = "DELACT";

                            Part part = request.getPart("fileFoto");
                            InputStream inputStream = part.getInputStream();
                            Imagen banner = new Imagen();
                            Imagen miniatura = new Imagen();
                            banner.setImagen(inputStream);
                            miniatura.setImagen(inputStream);
                            userDao.actualizarRolSistema(idDelegado, nuevoRol);
                            actividadesDao.crearActividad(idActividad, tituloActividad, Integer.parseInt(idDelegado), banner, miniatura);
                            response.sendRedirect(request.getContextPath() + "/admin_gen?action=activities");

                            break;

                        case "editar":
                            String idDelActual = request.getParameter("idDelActual");
                            String tituloActividad2 = request.getParameter("tituloActividad");
                            String idActividad2 = tituloActividad2.toUpperCase();
                            String idDelegado2 = request.getParameter("idDelegado");

                            Part part2 = request.getPart("fileFoto");
                            InputStream inputStream2 = part2.getInputStream();
                            Imagen banner2 = new Imagen();
                            Imagen miniatura2 = new Imagen();
                            banner2.setImagen(inputStream2);
                            miniatura2.setImagen(inputStream2);
                            userDao.actualizarRolSistema(idDelActual, "USER");
                            userDao.actualizarRolSistema(idDelegado2, "DELACT");

                            if(part2.getSize()==0){
                                actividadesDao.actualizarActividadNoImagen(idActividad2, Integer.parseInt(idDelegado2));
                            }else{
                                actividadesDao.actualizarActividad(idActividad2, Integer.parseInt(idDelegado2), banner2, miniatura2);
                            }

                            response.sendRedirect(request.getContextPath() + "/admin_gen?action=activities");

                            break;
                    }

                    break;

                case "donations":
                    DonacionesDao donacionesDao = new DonacionesDao();

                    switch (ac) {

                        case "filtrarComprobados":
                            UsuariosDao usuariosDao = new UsuariosDao();
                            String comprobacionId = request.getParameter("id");
                            ArrayList<Donaciones> listaDonacionesPorComprobacion = donacionesDao.listarComprobados(comprobacionId);
                            //Lista detalles
                            ArrayList<DonacionUserDto> listaDonacionesUsuariosDetalles = usuariosDao.obtenerListaDetalles();
                            request.setAttribute("listaDetalles", listaDonacionesUsuariosDetalles);
                            //Lista donaciones
                            request.setAttribute("listaDonaciones", listaDonacionesPorComprobacion);
                            request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request, response);


                            break;
                        case "editarDonacion":

                            String donacionId = request.getParameter("idDonacion");
                            String montoStr = request.getParameter("monto");
                            String fechaDonacion = request.getParameter("fecha-donacion");
                            String horaDonacion = request.getParameter("hora-donacion");
                            String estadoDonacion = request.getParameter("estado");

                            double montoInt = Double.parseDouble(montoStr);

                            int estadoDonacionInt = Integer.parseInt(estadoDonacion);

                            donacionesDao.actualizarDonacion(Integer.parseInt(donacionId), montoInt, fechaDonacion, horaDonacion, estadoDonacionInt);
                            response.sendRedirect(request.getContextPath() + "/admin_gen?action=donations");

                            //Actualizaremos el Monto Total solo si es válido el estado (estado = 1)

                            if (estadoDonacion.equals("1")){
                                //----Obtenemos Monto total del Usuario hasta el momento----
                                int idUsuarioDonation = donacionesDao.obtenerIdUserxIdDonation(Integer.parseInt(donacionId));
                                //obtenemos Usuario x ID
                                UsuariosDao usuariosDao1 = new UsuariosDao();
                                Usuario usuario = usuariosDao1.buscarXid(idUsuarioDonation);
                                Double montoTotalAnt = donacionesDao.obtenerMontoTotalUsuario(idUsuarioDonation);
                                Double montoNuevo = Double.parseDouble(montoStr); //monto donado nuevo

                                //actualizamos Monto Total del Usuario
                                donacionesDao.actualizarMontoTotal(montoNuevo, usuario, montoTotalAnt);

                            }



                            break;
                    }
                    break;
            }


    }
}
