package com.bookstore.controller.OAuth.google;

import com.bookstore.dao.UsersDAO;
import com.bookstore.dto.UserGoogleDTO;
import com.bookstore.common.authen.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;
import java.io.PrintWriter;



@WebServlet(name = "GoogleLoginController", urlPatterns = {"/login-google"})
public class GoogleLoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()){
            HttpSession session = request.getSession();
            UsersDAO userDAO = new UsersDAO();
            String code = request.getParameter("code");
            String accessToken = ProcessOAuthGoogle.getToken(code, GoogleConstants.GOOGLE_REDIRECT_URI);
            UserGoogleDTO user = ProcessOAuthGoogle.getUserInfo(accessToken);
            System.out.println("This is gg acess token: " + accessToken);
            System.out.println("This is userId: " + user.getId());
            if(!(userDAO.checkGoogleUserID(user.getId()))){
                response.sendRedirect("login?error=1");
            } else {
                session.setAttribute("loggedCustomer", userDAO.getUserByGoogleID(user.getId()));
                response.sendRedirect("/BookStore/");
            }

        } catch (Exception e){
            e.printStackTrace();
        }

    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}