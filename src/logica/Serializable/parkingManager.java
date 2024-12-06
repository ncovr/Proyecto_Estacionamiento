package logica.Serializable;

import java.io.*;
import java.util.ArrayList;

public class parkingManager {
    private static final String ARCHIVO_estacionamientos = "src/logica/Serializable/usuarios.txt";

    public static boolean guardarEstacionamiento(String[] espacios){
        if(espacios==null){
            throw new IllegalArgumentException("La lista de espacios no puede ser nula.");
        }

        File archivo = new File(ARCHIVO_estacionamientos);

        try{
            if (!archivo.exists()) {
                archivo.getParentFile().mkdirs(); // Crear directorio si no existe
                archivo.createNewFile(); // Crear archivo si no existe
            }

            try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(archivo))) {
                oos.writeObject(espacios);
                System.out.println("espacios guardados en: " + archivo.getAbsolutePath());
            }
        }catch (IOException e) {
            System.err.println("Error al guardar los espacios: " + e.getMessage());
        }
        return false;
    }

    public static ArrayList<parking> obtenerEstacionamientos() {
        try{
            File archivo = new File(ARCHIVO_estacionamientos);

            if (!archivo.exists()) {
                archivo.getParentFile().mkdirs();
                archivo.createNewFile();
                System.out.println("Archivo creado en " + ARCHIVO_estacionamientos);
                return new ArrayList<>();
            }

            try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(archivo))){
                return (ArrayList<parking>) ois.readObject();
            }
        }catch (FileNotFoundException e) {
            System.out.println("Archivo no encontrado. Retornando una lista vacía.");
            return new ArrayList<>();
        }catch (IOException | ClassNotFoundException e) {
            System.err.println("Error al obtener los archivos: " + e.getMessage());
            return new ArrayList<>();
        }
    }
}
