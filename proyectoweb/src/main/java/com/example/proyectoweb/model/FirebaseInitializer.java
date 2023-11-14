package com.example.proyectoweb.model;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.StorageClient;

import java.util.Objects;

public class FirebaseInitializer {

    public static void initializeFirebase() {
        try {
            // Carga las credenciales desde el archivo JSON generado en la consola de Firebase
            GoogleCredentials credentials = GoogleCredentials.fromStream(
                    Objects.requireNonNull(FirebaseInitializer.class.getResourceAsStream("z-firebase-adminsdk.json"))
            );

            // Configura las opciones de Firebase
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(credentials)
                    .setDatabaseUrl("https://proyectowebsdi.firebaseio.com") // Reemplaza con tu URL de base de datos Firestore
                    .setStorageBucket("proyectowebsdi.appspot.com") // Reemplaza con tu URL de almacenamiento
                    .build();

            // Inicializa Firebase
            FirebaseApp.initializeApp(options);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static StorageClient getStorageClient() {
        return StorageClient.getInstance();
    }
}