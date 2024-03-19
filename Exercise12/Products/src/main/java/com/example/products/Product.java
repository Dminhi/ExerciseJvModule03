package com.example.products;

public class Product {
    private int idProduct;
    private String productName,description,manufacturer;
    private double productPrice;

    public Product() {
    }

    public Product(int idProduct, String productName, String description, String manufacturer, double productPrice) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.description = description;
        this.manufacturer = manufacturer;
        this.productPrice = productPrice;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }
}
