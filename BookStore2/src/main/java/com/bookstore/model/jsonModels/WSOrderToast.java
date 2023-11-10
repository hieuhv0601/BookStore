package com.bookstore.model.jsonModels;

public class WSOrderToast {
    private String name;
    private long totalItems;
    private float totalPrice;

    public WSOrderToast() {
    }

    public WSOrderToast(String name, long totalItems, float totalPrice) {
        this.name = name;
        this.totalItems = totalItems;
        this.totalPrice = totalPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(long totalItems) {
        this.totalItems = totalItems;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "WSOrderToast{" +
                "name='" + name + '\'' +
                ", totalItems=" + totalItems +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
