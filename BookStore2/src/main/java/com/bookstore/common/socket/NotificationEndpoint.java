package com.bookstore.common.socket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import com.bookstore.dao.OrdersDAO;
import com.bookstore.model.jsonModels.WSRequest;
import com.bookstore.service.OrderServices;
import com.google.gson.Gson;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/notification")
public class NotificationEndpoint {

    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("Open Connection ...");
        users.add(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        try{
            Gson gson = new Gson();
            OrdersDAO orderDAO = new OrdersDAO();
            System.out.println("Call one message");
            WSRequest wsr = gson.fromJson(message, WSRequest.class);
            if (wsr.getAction().equals("order-toast")) {
                String orderToast = gson.toJson(orderDAO.getOrderToastInfo(wsr.getUserID()));
                System.out.println(orderToast);
                for (Session s : users) {
                    s.getBasicRemote().sendText(orderToast);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("Close Connection ...");
        users.remove(session);
    }

    @OnError
    public void onError(Throwable e) {
        e.printStackTrace();
    }

}
