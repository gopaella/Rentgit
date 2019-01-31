/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rentatree.model;

/**
 *
 * @author cuba
 */
public class BasketItem {
    
    private Product product;
    private String dateFrom;
    private int daysRequired;

    public BasketItem(Product product, String dateFrom, int daysRequired) {
        this.product = product;
        this.dateFrom = dateFrom;
        this.daysRequired = daysRequired;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public int getDaysRequired() {
        return daysRequired;
    }

    public void setDaysRequired(int daysRequired) {
        this.daysRequired = daysRequired;
    }
    
    
    
}
