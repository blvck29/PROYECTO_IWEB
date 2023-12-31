package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.CurrentDate;
import com.example.proyectoweb.model.EmailSender;
import com.example.proyectoweb.model.beans.*;
import com.example.proyectoweb.model.daos.*;
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
                UsuariosDao usuariosDao=new UsuariosDao();
                AlbumDao albumDao=new AlbumDao();

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
                        int idEv1 = Integer.parseInt(idEv);

                        boolean encontrado = false;

                        for (Evento evento : listaEventos) {
                            if (evento.getIdEvento()==idEv1) {
                                encontrado = true;
                                break; // Si encontraste el ID, no necesitas seguir buscando, así que sales del ciclo
                            }
                        }

                        if(encontrado){
                            int idUsr = user.getIdUsuario();
                            ArrayList<Inscripcion> listaEventosPropia = eventoDao.listarEventosPropios(String.valueOf(idUsr));
                            Evento ev = eventoDao.EventoXid(idEv);

                            request.setAttribute("listaEventosPropia",listaEventosPropia);
                            request.setAttribute("evento_detailed", ev);

                            if(CurrentDate.isCurrent(ev) > 0){

                                System.out.println("estoy en imagenes album en details");
                                String idEvento = request.getParameter("idEvento");
                                System.out.println(idEv);

                                ArrayList<FotoAlbum> listafotos = new ArrayList<>();
                                listafotos=albumDao.listarfotosDeAlbum(idEv);
                                request.setAttribute("listafotos",listafotos);
                                System.out.println(listafotos.size());





                                request.getRequestDispatcher("pages/user/dyn_events/event_end.jsp").forward(request,response);





                            } else {
                                int idUsr1 = user.getIdUsuario();
                                String estadoInscripcionDelUsuario= usuariosDao.EstadoDeInscripcionDeUsuario(idUsr1,idEv);
                                System.out.println(estadoInscripcionDelUsuario);
                                request.setAttribute("estadoInscripcionDelUsuario",estadoInscripcionDelUsuario);




                                request.getRequestDispatcher("pages/user/dyn_events/event.jsp").forward(request,response);

                            }
                        }
                        else{
                            request.setAttribute("listaInscritos", listaInscritos);
                            request.setAttribute("listaActividades",listaActividades);
                            request.setAttribute("listaEventos",listaEventos);
                            request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);

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

                        if(b){
                            actividadesDao.listarImagenPorActividad(response, request.getParameter("idActividad"),4);
                        }else{
                            actividadesDao.listarImagenPorActividad(response, request.getParameter("idActividad"),3);
                        }
                        break;

                    case "imagenDonacionPorUsuario":
                        donacionesDao.listarImagenDonacionPorUsuario(response, request.getParameter("idDonacion"));
                        break;

                    case "profile":
                        ArrayList<Evento> eventosXusuario = eventoDao.listarEventosInscritosbienhecho(user.getIdUsuario());
                        System.out.println(eventosXusuario.size());
                        request.setAttribute("listaEventos",eventosXusuario);
                        request.getRequestDispatcher("pages/user/profile.jsp").forward(request,response);
                        System.out.println("ANTES DEL FOR");
                        for (Evento evento : eventosXusuario) {
                            System.out.println(evento.getTitulo());
                        }
                        System.out.println("despuesd del for de fprof");
                        break;

                    case "imagenPorEvento":
                        System.out.println(request.getParameter("idEvento"));
                        eventoDao.listarImagenPorEvento(response, request.getParameter("idEvento"));

                        break;

                    case "imagenPorAlbum":
                        System.out.println("Estoy en imagen por album");
                        albumDao.listarImagenPorFotoDeAlbum(response,request.getParameter("IdFoto"),3);

                        break;


                    default:
                        response.sendRedirect(request.getContextPath() + "/user_home");
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
            UsuariosDao userDao = new UsuariosDao();

            switch (action) {
                case "inscribirse":
                    String id_evento = request.getParameter("idEvento");
                    System.out.println("Intentando inscribirse...");
                    request.setAttribute("listaInscritos", listaInscritos);
                    request.setAttribute("listaActividades",listaActividades);
                    request.setAttribute("listaEventos",listaEventos);

                    try {
                        eventoDao.Inscribirse_a_un_evento(id_evento, user.getIdUsuario());
                        System.out.println("¡Inscripción exitosa!");
                        request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                    } catch (Exception e) {
                        System.out.println("Error al inscribirse: " + e.getMessage());
                        request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                        // Otra lógica si es necesario manejar el error de otra manera
                    }
                    break;

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

                case "eventosXactividad":
                    String id_actividad = request.getParameter("id_actividad");
                    Actividad actividad=actDao.buscarPorTitulo(id_actividad);
                    ArrayList<Evento> listaFiltro = new ArrayList<>();
                    System.out.println("Estamos en eventos por actividad , antes del dao");




                    listaFiltro = eventoDao.listarEventosProximosxActividad(actividad.getIdActividad());
                    System.out.println("Estamos en eventos por actividad , dsps del dao");



                    request.setAttribute("actividad", actividad);
                    request.setAttribute("listaEventos",listaFiltro);
                    request.getRequestDispatcher("pages/user/dyn_events/prox.jsp").forward(request,response);

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
                    String eventTitle = request.getParameter("buscar_evento");
                    ArrayList<Evento> listaEventosProx;

                    switch (of){
                        case "prox":

                            if(eventTitle.equals("")){
                                response.sendRedirect(request.getContextPath() + "/user_home?action=events&id=prox");
                            }else{
                                listaEventosProx = eventoDao.buscarXtituloEz(eventTitle);
                                request.setAttribute("listaEventosProx", listaEventosProx);
                                request.setAttribute("listaActividades",listaActividades);
                                request.getRequestDispatcher("pages/user/dyn_events/prox.jsp").forward(request,response);

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

                    if(user.getIdRolAcademico().equals("GRADUAT")){

                        if(Double.parseDouble(monto) >= 100){
                            Usuario usuarioDonacion = userDao.usuarioByEmail(user.getCorreo());

                            System.out.println("el estado del kit teleco de este usuario es: " + usuarioDonacion.getKitTeleco());

                            if(usuarioDonacion.getKitTeleco()==0){
                                HttpSession httpSession = request.getSession();
                                httpSession.setAttribute("msgKitTeleco", "Su donación se ha registrado correctamente y ha obtenido su Kit Teleco. Se le enviará un correo con mas información sobre la entrega de este mismo.");
                                userDao.obtieneKitTeleco(user.getIdUsuario());
                                EmailSender.sendEmail(user.getCorreo(),"Recojo de Kit Teleco!"," Lugar de recojo: Explanada de Cía \n Fecha de recojo: 15/12/2023 \n \n Gracias por su apoyo a la fibra!");
                                donacionesDao.nuevaDonacion(user.getIdUsuario(), monto, donacion);
                            }else{
                                HttpSession httpSession = request.getSession();
                                httpSession.setAttribute("msgDonacionCorrecta", "Su donación se ha registrado correctamente.");
                                donacionesDao.nuevaDonacion(user.getIdUsuario(), monto, donacion);
                                EmailSender.sendEmail(user.getCorreo(),"Gracias por su donación a la fibra!"," Monto donado: " + monto + " soles");
                            }

                        }else{
                            HttpSession httpSession = request.getSession();
                            httpSession.setAttribute("msgErrorDonacion", "Como egresado, el monto mínimo que puede donar son S/100");
                        }


                    }
                    else{

                        if(Double.parseDouble(monto) > 0){
                            HttpSession httpSession = request.getSession();
                            httpSession.setAttribute("msgDonacionCorrecta", "Su donación se ha registrado correctamente.");
                            donacionesDao.nuevaDonacion(user.getIdUsuario(), monto, donacion);

                        }else{
                            HttpSession httpSession = request.getSession();
                            httpSession.setAttribute("msgErrorDonacion", "El monto de su donación debe ser mayor a S/0");
                        }

                    }

                    response.sendRedirect(request.getContextPath() + "/user_home?action=donate");
                    break;


            }


    }
}
