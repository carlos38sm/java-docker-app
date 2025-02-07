import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        port(4567); // Asegurar que use el puerto correcto

        // Configurar la ruta de los archivos estáticos
        staticFiles.externalLocation("/app/frontend");  // <- Aquí se referencia el directorio copiado en Docker

        // Ruta de prueba
        get("/", (req, res) -> {
            res.redirect("/index.html");  // Redirige a index.html automáticamente
            return null;
        });

        System.out.println("Servidor corriendo en: http://localhost:4567");
    }
}

