package com.bookstore.common.utils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Set character encoding for request and response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Continue the request-response chain
        chain.doFilter(request, response);
    }

    public void destroy() {
        // Cleanup code, if needed
    }
}

