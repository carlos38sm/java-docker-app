# Usa la imagen oficial de OpenJDK 11
FROM openjdk:11

# Establece el directorio de trabajo
WORKDIR /app

# Copia el código fuente al contenedor
COPY src /app/src

# Crea el directorio para las librerías y descarga las dependencias necesarias:
# - Spark Java (spark-core)
# - SLF4J (API y la implementación simple)
# - API de Servlet (javax.servlet)
# - Jetty Server (necesario para Spark)
RUN mkdir -p /app/lib && \
    curl -o /app/lib/spark-core.jar https://repo1.maven.org/maven2/com/sparkjava/spark-core/2.9.4/spark-core-2.9.4.jar && \
    curl -o /app/lib/slf4j-api.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.36/slf4j-api-1.7.36.jar && \
    curl -o /app/lib/slf4j-simple.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/1.7.36/slf4j-simple-1.7.36.jar && \
    curl -o /app/lib/javax.servlet-api.jar https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar && \
    curl -o /app/lib/jetty-server.jar https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-server/9.4.44.v20210927/jetty-server-9.4.44.v20210927.jar && \
    curl -o /app/lib/jetty-servlet.jar https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-servlet/9.4.44.v20210927/jetty-servlet-9.4.44.v20210927.jar && \
    curl -o /app/lib/jetty-http.jar https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-http/9.4.44.v20210927/jetty-http-9.4.44.v20210927.jar && \
    curl -o /app/lib/jetty-util.jar https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-util/9.4.44.v20210927/jetty-util-9.4.44.v20210927.jar && \
    curl -o /app/lib/jetty-io.jar https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-io/9.4.44.v20210927/jetty-io-9.4.44.v20210927.jar

# Crea el directorio para las clases compiladas y compila el código
RUN mkdir -p /app/bin && \
    javac -cp "/app/lib/*" -d /app/bin /app/src/Main.java

# Cambia al directorio de las clases compiladas
WORKDIR /app/bin

# Define el comando de ejecución, incluyendo todas las librerías en el classpath
CMD ["java", "-cp", ".:/app/lib/*", "Main"]