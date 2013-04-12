notebookcompare
===============
                                                                              

Práctica 1- Desarrollo de aplicación web bàsica en django- GEI Josep Mª Viladegut - Eduard Miró- Universitat de Lleida - EPS

	Github público: https://github.com/eduardmiro/notebookcompare

En esta práctica desarrollada en Django se pretende listar todas las entidades de una base de datos de portátiles.
De esta manera, de un portátil en concreto, podemos almacenar la información correspondiente a sus características y al mismo tiempo relacionarlo con su marca, así más adelante podremos mostrar toda la información de modelos de una marca en concreto.
Para ahorrar espacio, se ha considerado guardar solo las URL’s de las imágenes, tanto de las marcas como de los portátiles, evitando la necesidad de tener guardada la imagen en el ordenador.

/brands/ 		- Lista todas las marcas disponibles
/brands/VALOR 		- Muestra los detalles la marca VALOR
/brands/VALOR/models/ 	- Lista todos los portátiles de la marca VALOR

/models/ 		- Lista todos los portátiles disponibles
/models/VALOR 		- Muestra los detalles del portátil VALOR

/components/		 - Muestra todas las posibles categorías de componentes de un portátil (CPU,RAM...)
/components/CPU		 - Muestra todos los distintos CPU disponibles. Al mismo tiempo se permite buscar que modelos llevan ese procesador mediante un link

/specifications/	 - Muestra todos los componentes en la base de datos, después se permite hacer una búsqueda a través de un link.
/specifications/(#idvalor)/ - Muestra todos los portátiles que llevan el id de ese componente (en este caso hemos preferido pasar un id en lugar del nombre para evitar problemas de coincidencia en la base de datos).

/login/ 		- Permite hacer login del usuario. Se usa el “built-in” de Django para poder hacerlo.
/logout/ 		- Permite hacer el logout mostrando un mensaje de despedida. Se reaprovecha la página principal para así evitar mantenimiento.
/admin/			 - Permite administrar la base de datos con la interfaz admin de Django.

	El CSS implementado se puede encontrar en: http://bluerobot.com/web/layouts/layout1.html

	Se incorpora una base de datos de muestra, el usuario de pruebas:
		Usuario: pepe
		Contraseña: pepe

No está implementado poder obtener los datos mediante xml o json.

