package com.example.proyectoweb.model;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CurrentDate {
    public static Date getCurrentDate() {
        LocalDateTime now = LocalDateTime.now();
        return Date.valueOf(now.toLocalDate());
    }
}