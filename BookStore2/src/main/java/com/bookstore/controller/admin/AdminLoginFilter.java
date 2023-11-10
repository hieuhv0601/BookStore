package com.bookstore.controller.admin;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bookstore.common.authen.RoleUtils;

@WebFilter("/admin/*")
public class AdminLoginFilter implements Filter {
 
    public AdminLoginFilter() { 
    }

    public void destroy() {   
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        
        boolean loggedIn = session != null && session.getAttribute("useremail") != null;
        String loginURL = httpRequest.getContextPath() + "/admin/login";
//        boolean loginRequest = httpRequest.getRequestURI().equals(loginURL);
//        boolean loginPage = httpRequest.getRequestURI().endsWith("login.jsp");
        
        if (loggedIn) {
        	if((String) session.getAttribute("userRole") != null) {
        		String userRole = RoleUtils.getDecryptedRoleFromSession(httpRequest); // Assuming you store the user's role in the session
                if ("admin".equals(userRole)) {
                    // The user has an admin role, grant access
                    chain.doFilter(request, response);
                    return;
                }
        	}
//        	System.out.println("After decrypted: " + (String) session.getAttribute("userRole")); 	
//        	System.out.println("After decrypted: " + userRole);

        }

        // If the user doesn't have an admin role, deny access
        String accessDeniedPage = "/access-denied.jsp"; // Customize this page
        RequestDispatcher dispatcher = request.getRequestDispatcher(accessDeniedPage);
        dispatcher.forward(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
    
    }
}
