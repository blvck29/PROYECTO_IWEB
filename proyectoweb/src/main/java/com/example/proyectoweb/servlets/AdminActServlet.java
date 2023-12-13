package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.*;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.AlbumDao;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.InscritosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "admin_act", value = "/admin_act")
public class AdminActServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();
    ActividadesDao actividadesDao = new ActividadesDao();
    ActividadesDao actDao = new ActividadesDao();
    InscritosDao inscritosDao = new InscritosDao();
    AlbumDao albumDao = new AlbumDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");
        Actividad actividadDelUsuario = actDao.getActividadByIdUsuario(user.getIdUsuario());



            String action = request.getParameter("action") == null? "home" : request.getParameter("action");
            int idUsr = user.getIdUsuario();

            switch (action){

                case "vista":
                    String vista = request.getParameter("id") == null? "admin" : request.getParameter("id");

                    switch (vista){
                        case "admin":
                            break;

                        case "user":
                            response.sendRedirect(request.getContextPath() + "/user_home?");
                            break;
                    }


                case "home":

                    Actividad actividad = actividadesDao.getActividadByIdUsuario(idUsr);
                    ArrayList<Evento> listaEventos = eventoDao.listarEventosxActividad(actividad.getIdActividad());

                    request.setAttribute("actividad", actividad);
                    request.setAttribute("listaEventos", listaEventos);
                    request.getRequestDispatcher("/pages/admin_act/home.jsp").forward(request, response);
                    break;
                case "new_event":
                    String idActividad = request.getParameter("idActividad");

                    if(idActividad.equals(actividadDelUsuario.getIdActividad())){

                        Actividad actividad1 = actividadesDao.getActividadByIdUsuario(idUsr);
                        request.setAttribute("actividad", actividad1);
                        request.setAttribute("idActividad", idActividad);
                        request.getRequestDispatcher("/pages/admin_act/new_event.jsp").forward(request, response);

                    }else{
                        response.sendRedirect(request.getContextPath() + "/admin_act");

                    }

                    break;

                case "edit_event":

                    String idEvento = request.getParameter("idEvento");
                    String idActividad4 = request.getParameter("idActividad");

                    if(idActividad4.equals(actividadDelUsuario.getIdActividad())){

                        Actividad actividadEv= actividadesDao.getActividadByIdUsuario(idUsr);
                        request.setAttribute("actividad", actividadEv);
                        Evento eventoBuscado = eventoDao.EventoXid(idEvento);

                        if (eventoBuscado != null) {

                            if(eventoBuscado.getIdActividad().equals(actividadDelUsuario.getIdActividad())){

                                request.setAttribute("idActividad", idActividad4);
                                request.setAttribute("evento", eventoBuscado);
                                request.getRequestDispatcher("/pages/admin_act/edit_event.jsp").forward(request, response);

                            }else{
                                response.sendRedirect(request.getContextPath() + "/admin_act");
                            }

                        } else {
                            response.sendRedirect(request.getContextPath() + "/admin_act");
                        }

                    }else{
                        response.sendRedirect(request.getContextPath() + "/admin_act");

                    }

                    break;

                case "verEvento":
                    String idEvento2 = request.getParameter("idEvento");
                    String idActividad1 = request.getParameter("idActividad");


                    if(idActividad1.equals(actividadDelUsuario.getIdActividad())){
                        Evento eventoBuscado2 = eventoDao.EventoXid(idEvento2);

                        if (eventoBuscado2 != null) {

                            if(eventoBuscado2.getIdActividad().equals(actividadDelUsuario.getIdActividad())){
                                request.setAttribute("idActividad", idActividad1);
                                request.setAttribute("evento", eventoBuscado2);
                                request.getRequestDispatcher("/pages/admin_act/ver_evento.jsp").forward(request, response);


                            }else{
                                response.sendRedirect(request.getContextPath() + "/admin_act");
                            }

                        } else {
                            response.sendRedirect(request.getContextPath() + "/admin_act");
                        }

                    }else{
                        response.sendRedirect(request.getContextPath() + "/admin_act");

                    }

                    break;


                case "verInscritos":
                    String idEvento3 = request.getParameter("idEvento");
                    String idActividad3 = request.getParameter("idActividad");


                    if(idActividad3.equals(actividadDelUsuario.getIdActividad())){
                        System.out.println("aqui 1");

                        if(eventoDao.buscarEventoXid(idEvento3) != null){
                            System.out.println("aqui 2");

                            if(eventoDao.buscarEventoXid(idEvento3).getIdActividad().equals(actividadDelUsuario.getIdActividad())){
                                System.out.println("aqui 3");

                                ArrayList<Inscrito> listaInscritosxEvento = inscritosDao.listarInscritosXevento(idEvento3);
                                request.setAttribute("idEvento", idEvento3);
                                request.setAttribute("idActividad", idActividad3);
                                request.setAttribute("listaIncritosxEvento", listaInscritosxEvento);
                                request.getRequestDispatcher("/pages/admin_act/ver_inscritos.jsp").forward(request, response);

                            }else{
                                response.sendRedirect(request.getContextPath() + "/admin_act");
                            }



                        }else{
                            response.sendRedirect(request.getContextPath() + "/admin_act");
                        }


                    }else{
                        response.sendRedirect(request.getContextPath() + "/admin_act");

                    }

                    break;

                case "borrarEvento":
                    String idEventoEliminar = request.getParameter("idEventoEliminar");

                    eventoDao.eliminarAlbumFotosDeEvento(idEventoEliminar);
                    eventoDao.eliminarInscripcionDeEvento(idEventoEliminar);
                    eventoDao.eliminarEvento(idEventoEliminar);

                    response.sendRedirect(request.getContextPath() + "/admin_act");
                    break;

                case "editarRolInscrito":

                    String idEventoIns = request.getParameter("idevento");
                    String idInscrito = request.getParameter("idInscrito");

                    Evento event = eventoDao.buscarEventoXid(idEventoIns);

                    if(event != null){

                        if(event.getIdActividad().equals(actividadDelUsuario.getIdActividad())){

                            if(inscritosDao.buscarInscritoXid(idInscrito, Integer.parseInt(idEventoIns)) != null){

                                if(inscritosDao.buscarInscritoXidFiltro(idInscrito).getIdEvento() == Integer.parseInt(idEventoIns)){

                                    Inscrito inscrito = inscritosDao.buscarInscritoXid(idInscrito,Integer.parseInt(idEventoIns)); //deberia tmb buscar por idevento

                                    request.setAttribute("idActividad", actividadDelUsuario.getIdActividad());
                                    request.setAttribute("inscrito", inscrito);
                                    request.getRequestDispatcher("/pages/admin_act/editar_inscrito.jsp").forward(request, response);


                                }else{
                                    response.sendRedirect(request.getContextPath() + "/admin_act");
                                }

                            }else{
                                response.sendRedirect(request.getContextPath() + "/admin_act");
                            }

                        }else{
                            response.sendRedirect(request.getContextPath() + "/admin_act");
                        }

                    }else{
                        response.sendRedirect(request.getContextPath() + "/admin_act");
                    }


                    break;

                case "imagenPorEvento":

                    eventoDao.listarImagenPorEvento(response, request.getParameter("idEvento"));
                    break;

                case "profile":
                    ArrayList<Evento> eventosXusuario = eventoDao.listarEventosInscritos(user.getIdUsuario());
                    request.setAttribute("listaEventos",eventosXusuario);
                    request.setAttribute("idActividad", actividadDelUsuario.getIdActividad());
                    request.getRequestDispatcher("pages/admin_act/profile.jsp").forward(request,response);
                    for (Evento evento : eventosXusuario) {
                        System.out.println(evento.getTitulo());
                    }
                    break;

                case "album":
                    String idEventoAlbum = request.getParameter("idEvento");
                    Evento eventoAlbum = eventoDao.buscarEventoId(idEventoAlbum);

                    if(eventoAlbum!=null){
                        if (eventoAlbum.getIdEstado().equals("FINISH")) {
                            ArrayList<Integer> idsFotosAlbum = albumDao.idFotosAlbum(idEventoAlbum);
                            request.setAttribute("listaIds", idsFotosAlbum);
                            request.setAttribute("evento", eventoAlbum);
                            request.getRequestDispatcher("pages/admin_act/upload_album.jsp").forward(request, response);
                        }else{
                            response.sendRedirect(request.getContextPath() + "/admin_act?action=home");
                        }
                    }else{
                        response.sendRedirect(request.getContextPath() + "/admin_act?action=home");
                    }

                    break;

                case "imagenDeAlbum":
                    albumDao.listarImagenesAlbum(response, request.getParameter("idImagen"));
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/admin_act?action=home");
                    break;

            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession(false);
        Usuario user = (Usuario) session.getAttribute("usuario");
        Actividad actividadDelUsuario = actDao.getActividadByIdUsuario(user.getIdUsuario());

        String action = request.getParameter("action") == null? "filtros" : request.getParameter("action");
            String ac = request.getParameter("ac") == null? "eventosXfecha" : request.getParameter("ac");
            String idEvento = request.getParameter("idEvento");

            switch (action){

                case "filtros":

                    switch (ac){
                        case "eventosXfecha":
                            String filtro = request.getParameter("filtro");
                            ArrayList<Evento> listaFiltro = new ArrayList<>();
                            int idUsr = user.getIdUsuario();
                            Actividad actividad = actividadesDao.getActividadByIdUsuario(idUsr);

                            switch (filtro){
                                case "all":
                                    listaFiltro = eventoDao.listarEventosxActividad(actividad.getIdActividad());
                                    break;
                                case "prox":
                                    listaFiltro = eventoDao.listarEventosProximosxActividad(actividad.getIdActividad());
                                    break;
                                case "fin":
                                    listaFiltro= eventoDao.listarEventosFinalizadosxActividad(actividad.getIdActividad());
                                    break;
                            }
                            request.setAttribute("actividad", actividad);
                            request.setAttribute("listaEventos",listaFiltro);
                            request.getRequestDispatcher("pages/admin_act/home.jsp").forward(request,response);

                            break;

                        case "busquedaXEvento":
                            int idUsr1 = user.getIdUsuario();
                            Actividad actividad1 = actividadesDao.getActividadByIdUsuario(idUsr1);
                            String dato= request.getParameter("txtBuscar");
                            ArrayList<Evento> eventosBuscados= eventoDao.buscarXtitulo(actividad1.getTitulo(),dato);
                            request.setAttribute("dato", dato);
                            request.setAttribute("listaEventos", eventosBuscados);
                            request.setAttribute("actividad", actividad1);
                            request.getRequestDispatcher("pages/admin_act/home.jsp").forward(request,response);
                            break;
                    }
                    break;


                case "crearEvento":
                    String titulo = request.getParameter("titulo");
                    String subtituloP1 = request.getParameter("subtituloP1");
                    String subtituloP2 = request.getParameter("subtituloP2");
                    String subtitulo = subtituloP1 + subtituloP2;
                    String hora = request.getParameter("hora");
                    String fecha = request.getParameter("fecha");
                    String lugar = request.getParameter("lugar");
                    String descripcion = request.getParameter("descripcion");
                    String idActividad = request.getParameter("idActividad");

                    Part part = request.getPart("fileFoto");
                    InputStream inputStream = part.getInputStream();
                    Imagen imagen = new Imagen();
                    imagen.setImagen(inputStream);
                    eventoDao.crearEvento(titulo,subtitulo,hora,fecha,lugar,imagen, descripcion,idActividad);

                    response.sendRedirect(request.getContextPath() + "/admin_act?action=home");

                    break;



                case "editEvent":
                    String titulo2 = request.getParameter("titulo");
                    String subtitulo2 = request.getParameter("subtitulo");
                    String hora2 = request.getParameter("hora");
                    String fecha2 = request.getParameter("fecha");
                    String lugar2 = request.getParameter("lugar");
                    String descripcion2 = request.getParameter("descripcion");
                    String idActividad2 = request.getParameter("idActividad");

                    Part part2 = request.getPart("fileFoto");
                    InputStream inputStream2 = part2.getInputStream();
                    Imagen imagen2 = new Imagen();
                    imagen2.setImagen(inputStream2);

                    if(part2.getSize()==0){
                        eventoDao.actualizarEventoNoImagen(idEvento,titulo2,subtitulo2,hora2,fecha2,lugar2,descripcion2,idActividad2);
                    }else{
                        eventoDao.actualizarEvento(idEvento,titulo2,subtitulo2,hora2,fecha2,lugar2,imagen2,descripcion2,idActividad2);
                    }

                    response.sendRedirect(request.getContextPath()+"/admin_act?action=home");

                    break;

                case "editarRolInscrito":
                    String idUsuario = request.getParameter("idUsuario");
                    String rolNuevo = request.getParameter("rolNuevo");
                    String idActividad3 = request.getParameter("idActividad");
                    System.out.println("El nuevo rol es: " + rolNuevo);

                    inscritosDao.actualizarRolInscrito(rolNuevo, idUsuario);
                    response.sendRedirect(request.getContextPath() +"/admin_act?action=verInscritos&idEvento="+idEvento+"&idActividad="+idActividad3);
                    break;

                case "filtroInscritosRol":

                    String rol = request.getParameter("rol");
                    ArrayList<Inscrito> listaFiltrada = inscritosDao.filtrarXrolInscritoEnEvento(idEvento, rol);
                    String msg = "Aún no hay inscritos con este rol";

                    request.setAttribute("msg", msg);
                    request.setAttribute("listaIncritosxEvento", listaFiltrada);
                    request.setAttribute("idEvento", idEvento);
                    request.setAttribute("idActividad", actividadDelUsuario.getIdActividad());
                    request.getRequestDispatcher("/pages/admin_act/ver_inscritos.jsp").forward(request,response);

                    break;


                case "subirFotosAlbum":
                    String idEventoAlbum = request.getParameter("idEvento");
                    ArrayList<Part> fotosAlbum = new ArrayList<>(request.getParts());


                    ArrayList<Part> fotosValidas = new ArrayList<>();

                    for (Part fotoCheck : fotosAlbum) {
                        if (fotoCheck.getContentType() != null) {
                            fotosValidas.add(fotoCheck);
                        }
                    }

                    if (!fotosValidas.isEmpty()) {
                        for (Part foto : fotosValidas) {
                            System.out.println("Nombre del archivo: " + foto.getSubmittedFileName());
                            System.out.println("Tipo de contenido: " + foto.getContentType());
                            System.out.println("Tamaño del archivo: " + foto.getSize() + " bytes");
                        }
                    } else {
                        System.out.println("No se recibieron archivos válidos");
                    }

                    eventoDao.crearAlbumFotos(fotosValidas, idEventoAlbum);
                    response.sendRedirect(request.getContextPath() +"/admin_act?action=album&idEvento="+idEventoAlbum);
                    break;

            }

    }
}

