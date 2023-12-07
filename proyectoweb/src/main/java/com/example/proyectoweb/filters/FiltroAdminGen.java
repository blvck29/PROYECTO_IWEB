package com.example.proyectoweb.filters;

import com.example.proyectoweb.model.beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(servletNames = {"AdminGenServlet"})
public class FiltroAdminGen implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("usuario");
        if (user!=null && user.getIdRolSistema().equals("DELGEN")){
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            session.invalidate();
            request.getRequestDispatcher("login?action=unvalid_session").forward(request, response);
        }
    }
}
