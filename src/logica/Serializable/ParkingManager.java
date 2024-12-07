package logica.Serializable;

import java.io.*;

public class ParkingManager {
    private static final String ARCHIVO_ESTACIONAMIENTOS = "src/logica/Serializable/usuarios.txt";
    private static int sizer = 12;


    public static boolean guardarEstacionamientos(int[] espacios) {
        if (espacios == null) {
            throw new IllegalArgumentException("La lista de espacios no puede ser nula.");
        }

        File archivo = new File(ARCHIVO_ESTACIONAMIENTOS);

        try {
            if (!archivo.exists()) {
                archivo.getParentFile().mkdirs(); // Crear directorio si no existe
                archivo.createNewFile();         // Crear archivo si no existe
            }

            // Serializar
            try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(archivo))) {
                oos.writeObject(espacios);
                System.out.println("Espacios guardados en: " + archivo.getAbsolutePath());
                return true;
            }
        } catch (IOException e) {
            System.err.println("Error al guardar el arreglo es espacios: " + e.getMessage());
        }
        return false;
    }


    public static int[] obtenerEstacionamientos() {
        File archivo = new File(ARCHIVO_ESTACIONAMIENTOS);

        if (!archivo.exists()) {
            System.out.println("Archivo no encontrado. Retornando una lista vacía.");
            return new int[sizer];
        }

        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(archivo))) {
            return (int[]) ois.readObject();
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("Error al obtener los espacios: " + e.getMessage());
        }
        return new int[sizer];
    }

    public static int[] inicializar(int[] espacios) {
        int[] inicio = new int[sizer];
        for (int i = 1; i <= espacios.length; i++) {
            inicio[i] = 1;
        }
        return inicio;
    }

}
