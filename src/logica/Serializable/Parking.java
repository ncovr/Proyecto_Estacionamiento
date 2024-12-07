package logica.Serializable;

import java.io.Serializable;

public class Parking implements Serializable {
    private static final long serialVersionUID = 1L;

    // Constantes para los estados de los espacios
    public static final int LIBRE = 1;
    public static final int OCUPADO = 2;

    // Un arreglo para almacenar los estados de los espacios de estacionamiento
    private static int[] estadosEspacios;

    // Constructor
    public Parking() {
        this.estadosEspacios=new int[12];
        inicializarEspacios();
    }

    // Inicializa todos los espacios como libres
    private void inicializarEspacios() {
        for (int i = 0; i < estadosEspacios.length; i++) {
            estadosEspacios[i] = LIBRE;
        }
    }

    public boolean setEstado(int index, int estado) {
        if (estado == LIBRE || estado == OCUPADO) {
            estadosEspacios[index] = estado;
            return true;
        } else {
            System.err.println("Estado inválido: " + estado + ". Debe ser LIBRE (1) u OCUPADO (2).");
            return false;
        }
    }

    public void mostrarEstados() {
        for (int i = 0; i < estadosEspacios.length; i++) {
            System.out.println("Espacio " + (i + 1) + ": " + (estadosEspacios[i] == LIBRE ? "Libre" : "Ocupado"));
        }
    }


    public static void setEstadosEspacios(int[] nuevosEstados) {
        if (nuevosEstados == null) {
            throw new IllegalArgumentException("El arreglo de estados no puede ser nulo.");
        }
        if (nuevosEstados.length != estadosEspacios.length) {
            throw new IllegalArgumentException("El tamaño del arreglo no coincide con el número de espacios.");
        }

        // Validar que los nuevos estados sean válidos (1 para libre, 2 para ocupado)
        for (int estado : nuevosEstados) {
            if (estado != 1 && estado != 2) {
                throw new IllegalArgumentException("Estados inválidos en el arreglo. Solo se permiten valores 1 (libre) o 2 (ocupado).");
            }
        }

    }
}
