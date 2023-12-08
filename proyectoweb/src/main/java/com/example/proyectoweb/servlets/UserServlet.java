package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.CurrentDate;
import com.example.proyectoweb.model.beans.*;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.DonacionesDao;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.InscritosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet(name = "UserHome", value = "/user_home")
public class UserServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();
    InscritosDao inscritosDao = new InscritosDao();
    ActividadesDao actDao = new ActividadesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");

                String action = request.getParameter("action") == null? "home" : request.getParameter("action");

                ArrayList<Evento> listaEventos = eventoDao.listarEventos();
                ArrayList<Actividad> listaActividades = actDao.getListaActividades();
                ArrayList<Inscrito> listaInscritos = inscritosDao.inscritosPorEvento();
                ActividadesDao actividadesDao = new ActividadesDao();
                DonacionesDao donacionesDao = new DonacionesDao();

                switch (action){
                    case "home":
                        request.setAttribute("listaInscritos", listaInscritos);
                        request.setAttribute("listaActividades",listaActividades);
                        request.setAttribute("listaEventos",listaEventos);

                        request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                        break;

                    case "donate":
                        ArrayList<Donaciones> listaDonaciones = donacionesDao.donacionesPorUsuario(user.getIdUsuario());

                        request.setAttribute("listaDonaciones", listaDonaciones);
                        request.getRequestDispatcher("pages/user/donate.jsp").forward(request,response);
                        break;

                    case "events":

                        String id = request.getParameter("id") == null? "self" : request.getParameter("id");

                        switch (id){
                            case "self":
                                int idUsr = user.getIdUsuario();
                                ArrayList<Inscripcion> listaEventosPropia = eventoDao.listarEventosPropios(String.valueOf(idUsr));

                                request.setAttribute("listaEventos",listaEventos);
                                request.setAttribute("listaEventosPropia",listaEventosPropia);
                                request.setAttribute("listaInscritos", listaInscritos);
                                request.getRequestDispatcher("pages/user/dyn_events/self.jsp").forward(request,response);
                                break;

                            case "prox":
                                ArrayList<Evento> listaEventosProx = eventoDao.listarEventosProximos();
                                request.setAttribute("listaActividades",listaActividades);
                                request.setAttribute("listaEventosProx",listaEventosProx);
                                request.setAttribute("listaInscritos", listaInscritos);
                                request.getRequestDispatcher("pages/user/dyn_events/prox.jsp").forward(request,response);
                                break;

                            case "end":
                                ArrayList<Evento> listaEventosFin = eventoDao.listarEventosFinalizados();

                                request.setAttribute("listaActividades",listaActividades);
                                request.setAttribute("listaEventosFin",listaEventosFin);
                                request.setAttribute("listaInscritos", listaInscritos);
                                request.getRequestDispatcher("pages/user/dyn_events/end.jsp").forward(request,response);
                                break;
                        }
                        break;

                    case "details":
                        String idEv = request.getParameter("id") == null? "self" : request.getParameter("id");

                        int idUsr = user.getIdUsuario();
                        ArrayList<Inscripcion> listaEventosPropia = eventoDao.listarEventosPropios(String.valueOf(idUsr));
                        Evento ev = eventoDao.EventoXid(idEv);

                        request.setAttribute("listaEventosPropia",listaEventosPropia);
                        request.setAttribute("evento_detailed", ev);

                        if(CurrentDate.isCurrent(ev) > 0){
                            request.getRequestDispatcher("pages/user/dyn_events/event_end.jsp").forward(request,response);
                        } else {
                            request.getRequestDispatcher("pages/user/dyn_events/event.jsp").forward(request,response);
                        }
                        break;


                    case "acts":
                        String idAct = request.getParameter("idAct");

                        ArrayList<Evento> listaFiltroAct = eventoDao.listarEventosProximosxActividad(idAct);

                        request.setAttribute("idAct", idAct);
                        request.setAttribute("listaFiltroAct",listaFiltroAct);
                        request.setAttribute("listaInscritos", listaInscritos);
                        request.getRequestDispatcher("pages/user/activity.jsp").forward(request,response);
                        break;


                    case "user":
                        request.getRequestDispatcher("pages/user/user.jsp").forward(request,response);
                        break;


                    case "imagenPorActividad":
                        Boolean b = actividadesDao.validarSizeImagen(response, request.getParameter("idActividad"));

                        if(b == true){
                            actividadesDao.listarImagenPorActividad(response, request.getParameter("idActividad"),4);
                        }else{
                            actividadesDao.listarImagenPorActividad(response, request.getParameter("idActividad"),3);
                        }



                        break;

                    case "imagenDonacionPorUsuario":
                        donacionesDao.listarImagenDonacionPorUsuario(response, request.getParameter("idDonacion"));
                        break;
                }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");

            String action = request.getParameter("action") == null? "load" : request.getParameter("action");

            ArrayList<Evento> listaEventos = eventoDao.listarEventos();
            ArrayList<Actividad> listaActividades = actDao.getListaActividades();
            ArrayList<Inscrito> listaInscritos = inscritosDao.inscritosPorEvento();
            DonacionesDao donacionesDao = new DonacionesDao();

            switch (action) {
                case "load":
                    request.getRequestDispatcher("user_home").forward(request, response);
                    break;

                case "search_title":
                    String Actividad = request.getParameter("idAct");
                    String title = request.getParameter("title_search");

                    ArrayList<Evento> eventosSearched = eventoDao.buscarXtitulo(Actividad, title);
                    request.setAttribute("idAct", Actividad);
                    request.setAttribute("listaFiltroAct",eventosSearched);
                    request.setAttribute("listaInscritos", listaInscritos);
                    request.getRequestDispatcher("pages/user/activity.jsp").forward(request,response);
                    break;

                case "filter_act":
                    String idActividad = request.getParameter("idAct");
                    String filtro = request.getParameter("filtro");
                    ArrayList<Evento> listaFiltroAct = new ArrayList<>();

                    switch (filtro){
                        case "all":
                            listaFiltroAct = eventoDao.listarEventosxActividad(idActividad);
                            break;
                        case "prox":
                            listaFiltroAct = eventoDao.listarEventosProximosxActividad(idActividad);
                            break;
                        case "fin":
                            listaFiltroAct = eventoDao.listarEventosFinalizadosxActividad(idActividad);
                            break;
                    }
                    request.setAttribute("idAct", idActividad);
                    request.setAttribute("listaFiltroAct",listaFiltroAct);
                    request.setAttribute("listaInscritos", listaInscritos);
                    request.getRequestDispatcher("pages/user/activity.jsp").forward(request,response);
                    break;


                case "filter":
                    String of = request.getParameter("of") == null? "prox" : request.getParameter("of");

                    request.setAttribute("listaInscritos", listaInscritos);

                    String actSelected = request.getParameter("seleccion_actividad");
                    String eventTitle = request.getParameter("buscar_evento");
                    ArrayList<Evento> listaEventosProx;

                    switch (of){
                        case "prox":
                            if(eventTitle!=null){
                                listaEventosProx = eventoDao.buscarXtitulo(actSelected, eventTitle);
                                request.setAttribute("listaEventosProx", listaEventosProx);
                            } else {
                                listaEventosProx = eventoDao.listarEventosProximosxActividad(actSelected);
                                request.setAttribute("listaEventosProx", listaEventosProx);
                            }

                            break;

                        case "end":
                            break;
                    }
                    break;

                case "donate":
                    String monto = request.getParameter("monto");

                    Part part = request.getPart("fileFoto");
                    InputStream inputStream = part.getInputStream();
                    Imagen donacion = new Imagen();
                    donacion.setImagen(inputStream);

                    donacionesDao.nuevaDonacion(user.getIdUsuario(), monto, donacion);
                    response.sendRedirect(request.getContextPath() + "/user_home?action=donate");
                    break;


            }


    }
}
