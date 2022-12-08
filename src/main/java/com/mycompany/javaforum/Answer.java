/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaforum;

/**
 *
 * @author pawel
 */
public class Answer {

    String id;
    String questionId;
    String userId;
    String content;
    String date;

    public Answer(String id, String questionId, String userId, String content, String date) {
        this.id = id;
        this.questionId = questionId;
        this.userId = userId;
        this.content = content;
        this.date = date;
    }

    // <editor-fold defaultstate="collapsed" desc="get/set">
    public void setId(String id) {
        this.id = id;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public String getQuestionId() {
        return questionId;
    }

    public String getUserId() {
        return userId;
    }

    public String getContent() {
        return content;
    }

    public String getDate() {
        return date;
    }
    // </editor-fold>
}
