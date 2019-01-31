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
public class Product {
    
    private int id;
    private String name;
    private String description;
    private String supplier;
    private float pricePerDay;
    
    private Material myMat;

    public Product(int id, String name, String description, String supplier, float pricePerDay) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.supplier = supplier;
        this.pricePerDay = pricePerDay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public float getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(float pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    @Override
    public String toString() {
        return "Product{" + "name=" + name + ", description=" + description + ", supplier=" + supplier + ", pricePerDay=" + pricePerDay + '}';
    }
    
    enum Material{
        Natural, PVC, PE;
    }
    
}
