Instalación:
descargar apache-tomcat-9.0.97:
https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.zip

Extraerlo y dejarlo en una carpeta nueva llamada "tomcat"

Usando Intellij para clonar el proyecto.

Debe utilizar la rama "Frontend_Serializable"

luego revisar ciertas cosas dentro del proyecto ya clonado

Dependencias: 

Project Strucuture> project> SDK :22 Amazon corretto 22.02

Project Strucuture> project> Language level: SDK Default

Project Strucuture> project>Compiler output: Direccion donde tenga el proyecto ~\...\Proyecto_Estacionamiento\out

Project Strucuture> modules>Dependecies> Java EE 6-Java EE6

Project Strucuture> Libraries> Java EE 6-Java EE6

Project Strucuture> Plataform Settings SDks> corretto-22

Plugin>Descargar Smart Tomcat

Settings>Tomcat Server >+ *escoger la carpeta antes creada llamada "tomcat" y seleccionar "apache-tomcat-9.0.97"

luego seleccionar apply y ok

ahora ejercutar "Current File" con el archivo index.jsp abierto debe aparecer como se adjunta en la imagen

Debido a que se implemento serializable, el archivo se crea y se guarda automaticamente en C:\Users\(...)\.SmartTomcat\Proyecto_Estacionamiento\Proyecto_Estacionamiento\src\logica\Serializable\usuarios.txt

![2024-12-03_12h13_09](https://github.com/user-attachments/assets/b147aaaf-0316-4376-afc2-5080b6b8f9fd)


deberia ejecurtarse correctamente, escogiendo el link como aparece en la imagen 

![2024-12-02_20h35_50](https://github.com/user-attachments/assets/581ca1e8-dcbb-481f-b111-1e321c4a57d1)


