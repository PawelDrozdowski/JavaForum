/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaforum;

/**
 *
 * @author pawel
 */
public class Question {

    int id;
    int userId;
    String title;
    String content;
    String date;

    public Question(int id, int userId, String title, String content, String date) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.date = date;
    }
    
    // <editor-fold defaultstate="collapsed" desc="get/set">
    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getDate() {
        return date;
    }
    // </editor-fold>
}
