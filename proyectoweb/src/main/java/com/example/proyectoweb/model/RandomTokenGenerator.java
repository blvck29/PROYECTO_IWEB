package com.example.proyectoweb.model;

import java.util.Random;

public class RandomTokenGenerator {
    public static String generator() {
        int length = 6;
        StringBuilder key = new StringBuilder();

        Random random = new Random();
        for (int i = 0; i < length; i++) {
            // Generar un número aleatorio entre 0 y 35 (26 letras + 10 números)
            int randomValue = random.nextInt(36);

            // Convertir el número a un carácter
            char randomChar = (char) (randomValue < 10 ? '0' + randomValue : 'A' + (randomValue - 10));

            // Agregar el carácter a la clave
            key.append(randomChar);
        }

        return key.toString();
    }
}
