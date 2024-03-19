package com.example.product;

import java.time.LocalDateTime;

public class Users {
    private String names;
    private String img;
    private int age;
    private LocalDateTime birthDay;

    // Constructor
    public Users(String names, String img, int age, LocalDateTime birthDay) {
        this.names = names;
        this.img = img;
        this.age = age;
        this.birthDay = birthDay;
    }

    // Getters and setters (if needed)
    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public LocalDateTime getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(LocalDateTime birthDay) {
        this.birthDay = birthDay;
    }
}
