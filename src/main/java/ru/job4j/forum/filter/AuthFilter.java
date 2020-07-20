package ru.job4j.forum.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest sreq, ServletResponse  sresp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) sreq;
        if (req.getSession().getAttribute("user") == null) {
            HttpServletResponse resp = (HttpServletResponse) sresp;
            resp.sendRedirect("/index");
            return;
        }
        chain.doFilter(sreq, sresp);
    }
}