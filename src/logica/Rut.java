package logica;
import java.io.Serializable;

public class Rut implements Serializable {
    private long num;
    private char dv;

    public Rut(long num, char dv)throws  RutException {

        String rutS = Long.toString(num) + dv; //Convertimos el num en una cadena de texto

        if(!isValido(rutS)){ //Verificando si es valido
            throw new RutException("Rut Invalido");
        }
        if(!esNum(Long.toString(num))){
            throw new RutException( "El rut no puede contener letras o caracteres especiales" );
        }
        this.num = num;
        this.dv = dv;
    }

    @Override
    public String toString() {
        String rutStr = Long.toString(num);

        StringBuilder formattedRut = new StringBuilder();
        int longRut = rutStr.length();
        int k=0;
        for(int i= longRut-1; i>=0; i--){
            formattedRut.append(rutStr.charAt(i));
            k++;

            if(k== 3 && i>0){
                formattedRut.insert(0, ".");
                k=0;
            }
        }

        formattedRut.append("-").append(dv);
        return formattedRut.toString();
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Rut rut = (Rut) o;
        return num == rut.num && dv== rut.dv;
    }
    public static boolean isValido(String rut) throws RutException {
        rut = rut.replaceAll("[.-]", ""); //Elimina los puntos y guines
        char dv = rut.charAt(rut.length() - 1);//Saca y guarda el dv
        int cv;

        if (dv == 'K' || dv == 'k') {
            dv = 10;
            cv = dv;
        } else {
            cv = dv - 48;
        }

        String numRut = rut.substring(0, rut.length() - 1); //Saca y guarda la parte numerica del rut

        long[] num = new long[numRut.length()];

        long k=2;
        long sumaRut=0;
        long resto;
        long verificador=0;
        for(int i=0; i<numRut.length(); i++){
            num[i]= numRut.charAt(numRut.length()-i-1) - '0';

            sumaRut += num[i] * k;
            k++;
            if(k>7){
                k=2;
            }
            resto = sumaRut % 11;
            verificador =11 -resto;
        }
        if(verificador==11 && cv== 0){
            verificador=0;
        }
        if(cv == verificador){
            return true;
        } else {
            throw new RutException("ERROR! rut no existente");
        }
    }
    public static Rut valueOf(String string) throws RutException {

        //Eliminar los puntos y guiones de la cadena
        string = string.replaceAll("[.-]", "");

        // Verificar si la cadena tiene al menos 2 caracteres
        if (string.length() < 2) {
            return null; // Formato inválido
        }



        //Sacar el digito verificador y lo guardo en dv
        char dv = string.charAt(string.length() - 1);

        //Sacar la parte numerica sin contar el digito
        String Numero = string.substring(0, string.length() - 1);

        try {

            //Hago a numero en un long y lo guardo en num
            Long num = Long.parseLong(Numero);
            //retorno un objeto tipo Utilidades.Rut con el dv y num
            return new Rut(num, dv);

        }catch (NumberFormatException ex){
            throw new RutException("ERROR! El rut no puede contener letras ni caracteres especiales");
        }
    }
    private static boolean esNum(String rut){
        int verificado=0;
        for(char c: rut.toCharArray()){  //Convierto el String rut en un arreglo de char
            if(c>0 || c<9){ //Verificamos si es Numero
                verificado++;
            }
        }
        return verificado == rut.toCharArray().length;
    }

}
