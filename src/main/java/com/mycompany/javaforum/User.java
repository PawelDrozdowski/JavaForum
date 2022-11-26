/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaforum;

/**
 *
 * @author pawel
 */
public class User {
    public static int firstFreeID = 2;
    public int id;
    public String email;
    public String password;
    public String nick;

    public User(int id, String email, String password, String nick) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.nick = nick;
    }
}
