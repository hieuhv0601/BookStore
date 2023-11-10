package com.bookstore.model.jsonModels;

public class WSRequest {
    private String action;
    private int userID;

    public WSRequest() {
    }

    public WSRequest(String action, int userID) {
        this.action = action;
        this.userID = userID;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
}
