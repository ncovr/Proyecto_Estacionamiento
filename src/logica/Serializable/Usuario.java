package logica.Serializable;

import java.io.Serializable;

public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;
    private String run;
    private String password;


    public Usuario(String run, String password) {
        this.run = run;
        this.password = password;
    }

    public String getRun() {
        return run;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "run='" + run + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}