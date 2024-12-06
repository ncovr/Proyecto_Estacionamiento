package logica.Serializable;

import java.io.Serializable;

public class parking implements Serializable {
    // Un arreglo o lista para almacenar los estados de los espacios de estacionamiento
    private int[] estadosEspacios;

    // Constructor
    public parking(int numEspacios) {
        this.estadosEspacios = new int[numEspacios];
        // Inicializa todos los espacios en "libre" (puedes usar 1 para libre y 2 para ocupado)
        for (int i = 0; i < numEspacios; i++) {
            estadosEspacios[i] = 1; // 1 para libre por defecto
        }
    }

    // Métodos para obtener y modificar el estado de un espacio de estacionamiento
    public int getEstado(int index) {
        if (index >= 0 && index < estadosEspacios.length) {
            return estadosEspacios[index];
        }
        return -1; // Indicar que el espacio no existe
    }

    public void setEstado(int index, int estado) {
        if (index >= 0 && index < estadosEspacios.length) {
            if (estado == 1 || estado == 2) { // Validación del estado: 1 = libre, 2 = ocupado
                estadosEspacios[index] = estado;
            }
        }
    }

    // Método para mostrar los estados de los estacionamientos
    public void mostrarEstados() {
        for (int i = 0; i < estadosEspacios.length; i++) {
            System.out.println("Espacio " + (i + 1) + ": " + (estadosEspacios[i] == 1 ? "Libre" : "Ocupado"));
        }
    }

}
