package logica.Serializable;

import java.io.*;
import java.util.ArrayList;

public class UsuarioManager {

    // Guardar usuarios en un archivo
    public static void guardarUsuario(ArrayList<Usuario> usuarios, String nombreArchivo) {
        if (usuarios == null || nombreArchivo == null || nombreArchivo.isEmpty()) {
            throw new IllegalArgumentException("La lista de usuarios o el nombre del archivo no pueden ser nulos o vacíos.");
        }

        try (BufferedWriter oos = new BufferedWriter(new FileWriter(nombreArchivo))) {
            for (Usuario usuario : usuarios) {
                // Supongamos que Usuario tiene un método `toString` adecuado
                oos.write(usuario.toString());  // Escribe la representación del usuario
                oos.newLine();  // Nueva línea para cada usuario
            }
            System.out.println("Usuarios guardados exitosamente en " + nombreArchivo);
        } catch (IOException e) {
            System.err.println("Error al guardar los usuarios: " + e.getMessage());
        }
    }

    // Cargar usuarios desde un archivo
    public static ArrayList<Usuario> cargarUsuario(String nombreArchivo) {
        if (nombreArchivo == null || nombreArchivo.isEmpty()) {
            throw new IllegalArgumentException("El nombre del archivo no puede ser nulo o vacío.");
        }

        ArrayList<Usuario> usuarios = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(nombreArchivo))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] datos = line.split(",");  // Dividir en partes usando la coma como separador
                if (datos.length == 2) {  // Verifica que haya al menos 2 elementos
                    Usuario usuario = new Usuario(datos[0], datos[1]);  // Asegúrate de que tu clase Usuario pueda manejar estos parámetros
                    usuarios.add(usuario);
                }
            }
        } catch (IOException e) {
            System.err.println("Error al cargar los usuarios: " + e.getMessage());
        }

        return usuarios;
    }


    // Verificar si un usuario ya está registrado
    public static boolean esUsuarioRegistrado(ArrayList<Usuario> usuarios, String password) {
        if (usuarios == null || password == null) {
            throw new IllegalArgumentException("La lista de usuarios o la contraseña no pueden ser nulas.");
        }

        for (Usuario usuario : usuarios) {
            if (usuario.getPassword().equals(password) && usuario.getRun() != null) {
                return true;
            }
        }
        return false;
    }
}
