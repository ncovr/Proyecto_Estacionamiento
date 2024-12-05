package logica.Serializable;

import java.io.*;
import java.util.ArrayList;

public class UsuarioManager {

    // Ruta predeterminada para el archivo
    private static final String ARCHIVO_USUARIOS = "src/logica/Serializable/usuarios.txt";
    public static void guardarUsuario(ArrayList<Usuario> usuarios) {
        if (usuarios == null) {
            throw new IllegalArgumentException("La lista de usuarios no puede ser nula.");
        }

        File archivo = new File(ARCHIVO_USUARIOS);
        try {
            if (!archivo.exists()) {
                archivo.getParentFile().mkdirs(); // Crear directorio si no existe
                archivo.createNewFile(); // Crear archivo si no existe
            }

            try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(archivo))) {
                oos.writeObject(usuarios);
                System.out.println("Usuarios guardados en: " + archivo.getAbsolutePath());
            }
        } catch (IOException e) {
            System.err.println("Error al guardar los usuarios: " + e.getMessage());
        }
    }


    // Cargar usuarios desde un archivo
    public static ArrayList<Usuario> cargarUsuario() {
        try {
            File archivo = new File(ARCHIVO_USUARIOS);

            // Si el archivo no existe, crea uno vacío
            if (!archivo.exists()) {
                archivo.getParentFile().mkdirs();
                archivo.createNewFile();
                System.out.println("Archivo creado en " + ARCHIVO_USUARIOS);
                return new ArrayList<>();
            }

            try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(archivo))) {
                return (ArrayList<Usuario>) ois.readObject();
            }
        } catch (FileNotFoundException e) {
            System.out.println("Archivo no encontrado. Retornando una lista vacía.");
            return new ArrayList<>();
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("Error al cargar los usuarios: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    // Verificar si un usuario ya está registrado
    public static boolean esUsuarioRegistrado(ArrayList<Usuario> usuarios, String password) {
        if (usuarios == null || password == null) {
            throw new IllegalArgumentException("La lista de usuarios o la contraseña no pueden ser nulas.");
        }

        for (Usuario usuario : usuarios) {
            if (usuario.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
}
