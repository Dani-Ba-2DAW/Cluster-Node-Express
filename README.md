# Práctica de Aplicación en "Cluster" con NodeJS y Express
## Instalación de NodeJS y archivo sin clúster
Ejecutamos los siguientes comandos (la imagen es el archivo de provisión, si usas el repositorio, deberían ejecutarse todos los comandos al crear la máquina con Vagrant).
<br>
¡Nota, al ser una máquina **debian/bullseye64**, hace falta asignar un paquete de node más reciente al disponible (por eso instalamos curl)!
<br>
![Imagen de comandos de instalación](./img/001.png)

Ahora creamos un archivo JS (en este caso **app.js**) con el siguiente contenido.
<br>
![Imagen de app sin cluster](./img/002.png)

### Comprobación de funcionamiento sin clúster
Abrimos 2 pestañas (la primera se ejecuta antes que la segunda) y da tiempos desproporcionados por la carga del servidor.
<br>
![Imagen de funcionamiento 1](./img/003.png)
<br>
![Imagen de funcionamiento 2](./img/004.png)

## Archivo con clúster y comprobación
Ahora creamos un archivo JS con clúster (**appCluster.js**) con el siguiente contenido.
<br>
![Imagen de app con cluster](./img/005.png)

### Comprobación de funcionamiento con clúster
Abrimos 2 pestañas (la primera se ejecuta antes que la segunda) y da tiempos desproporcionados por la carga del servidor.
<br>
![Imagen de funcionamiento clúster 1](./img/006.png)
<br>
![Imagen de funcionamiento clúster 2](./img/007.png)