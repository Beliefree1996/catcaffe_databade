package com.bb.domain;

import java.io.Serializable;

public class Cat implements Serializable {
    private Integer id;
    private String name;
    private Integer age;
    private String gender;
    private Integer price;
    private String breeder;
    private String attendance;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setBreeder(String breeder) {
        this.breeder = breeder;
    }

    public String getBreeder() {
        return breeder;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getAttendance() {
        return attendance;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }
}
