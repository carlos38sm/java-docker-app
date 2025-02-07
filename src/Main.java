// src/Main.java
import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        port(4567); // Puerto en el que escuchará el servidor

        get("/", (req, res) -> "¡Esta es una prueba de una pequeña web con Java y Docker por Carlos Sánchez Miranda!");
    }
}

