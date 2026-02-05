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

## Tests con el paquete loadtest
Instalamos el paquete **loadtest** con el comando **npm install -g loadtest** (en la provisión)

Mientras se está ejecuta un servicio (sea o no con clúster), ejecutamos el comando **loadtest http://localhost:3000/api/500000 -n 1000 -c 100** para hacer pruebas

### Pruebas sin clúster
![Imagen de pruebas 1](./img/008.png)
<br>
![Imagen de pruebas 2](./img/009.png)

### Pruebas con clúster
![Imagen de pruebas clúster 1](./img/010.png)
<br>
![Imagen de pruebas clúster 2](./img/011.png)

## Instalación y Tests con PM2
Instalamos el paquete **pm2** con el comando **npm install -g pm2** (en la provisión está en la misma línea que loadtest).
<br>
Para ejecutar la app que queremos, usamos el comando **pm2 start [nombre_app].js -i 0**.
<br>
Y para pararlo, el comando **pm2 stop [nombre_app].js**.
<br>
![Imagen de funcionamiento de pm2](./img/012.png)

### Pruebas sin clúster
![Imagen de pruebas pm2 1](./img/013.png)
<br>
![Imagen de pruebas pm2 2](./img/014.png)

### Pruebas con clúster
![Imagen de pruebas pm2 clúster 1](./img/015.png)
<br>
![Imagen de pruebas pm2 clúster 2](./img/016.png)

## Crear Ecosystem con PM2
Ejecutamos el comando **ecosystem.config.js** y lo modificamos para que quede así.
<br>
![Imagen de configuración de Ecosystem](./img/017.png)

Para ejecutar Ecosystem, símplemente usamos el comando **pm2 [start|restart|reload|stop|delete] ecosystem.config.js**
<br>
![Imagen de funcionamiento de Ecosystem](./img/018.png)

## Tarea
### PM2 ls
El comando **pm2 ls** muestra las instancias creada en pm2 con sus datos.
<br>
![Imagen de Tarea pm2 ls](./img/019.png)

### PM2 logs
El comando **pm2 ls** muestra los logs EN VIVO, significando que está en ejecución constante hasta ser frenado manualmente (de forma predeterminada) y mostrando los logs actuales y próximos hasta la finalización del comando.
<br>
![Imagen de Tarea pm2 logs](./img/020.png)

### PM2 monit
El comando **pm2 ls** muestra los procesos en ejecución a mayor detalle y actualizándose cada segundo (y friendly para el usuario), tanto los procesos independientes (y sus logs correspondientes) como otras métricas, como la latencia o la memoria que consume.
<br>
![Imagen de Tarea pm2 logs](./img/021.png)

### Pregunta
**P: ¿Sabrías decir por qué en algunos casos concretos, como este, la aplicación sin clusterizar tiene mejores resultados?**
<br>
R: La aplicación sin clúster puede rendir mejor porque el clúster consume más recursos, y hay poca concurrencia, pocos núcleos o tareas muy intensivas de CPU, ese consumo adicional puede ser mayor que el beneficio que nos brinda, haciendo que un solo proceso sea más rápido.