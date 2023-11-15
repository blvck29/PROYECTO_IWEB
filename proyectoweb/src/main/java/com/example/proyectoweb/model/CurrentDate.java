package com.example.proyectoweb.model;

import com.example.proyectoweb.model.beans.Evento;

import java.sql.Date;
import java.time.LocalDateTime;

public class CurrentDate {
    public static Date getCurrentDate() {
        LocalDateTime now = LocalDateTime.now();
        return Date.valueOf(now.toLocalDate());
    }
    public static int isCurrent(Evento event) {

        java.sql.Date currentDate = CurrentDate.getCurrentDate();
        java.util.Date utilDate = event.getFecha();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Date eventDate = new java.sql.Date(sqlDate.getTime() + event.getHora().getTime());

        return currentDate.compareTo(eventDate);
    }

}

