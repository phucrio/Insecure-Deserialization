package com.example.demo2;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private String username;
    private String email;
    private int birthYear;
    private String gender;

    // Constructors
    public User() {}

    public User(String username, String email, int birthYear, String gender) {
        this.username = username;
        this.email = email;
        this.birthYear = birthYear;
        this.gender = gender;
    }
    // Getters and Setters
    // ...

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", birthYear=" + birthYear +
                ", gender='" + gender + '\'' +
                '}';
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
