package com.bookstore.controller.OAuth.google;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet(name = "GoogleRegisterController", urlPatterns = {"/register-google"})
public class GoogleRegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            UsersDAO dao = new UsersDAO();
            String code = request.getParameter("code");
            System.out.println("This is gg code: " + code);
            String accessToken = ProcessOAuthGoogle.getToken(code, GoogleConstants.GOOGLE_REDIRECT_URI_2);
            System.out.println("This is gg acess token: " + accessToken);
            UserGoogleDTO user = ProcessOAuthGoogle.getUserInfo(accessToken);
            System.out.println("This is gg acess token: " + user.toString());
            if(!(dao.checkGoogleUserID(user.getId()))){
                dao.addGoogleUser(user);
            }
            response.sendRedirect("/BookStore/");
        } catch (Exception e) {
            throw new RuntimeException(e);
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