notebookcompare
===============
                                                                              
               Z                                        
            ,Z$Z$Z~                                     
               Z,                                       
                                                        
             N~  N:                                     
             N~  N:                                     
             N~  N:                                     
 ZZZ~        N~  N:       :ZIZ           Universitat de Lleida                  
 IZZ         N~  N:        ZZ?        Escola Politècnica Superior                  
=            N~  N:           ?                         
      ~$     N~  N:    II                               
        ZZ   NNDNN   ZZ.                                
         ~ZZ       $ZI                                  
           ZZ     ZZ                                    
             Z,  Z.                                     
              $ Z                                                                              
             

Pràctica 1- Desarrollo de aplicación web bàsica en django- GEI Josep Mª Viladegut - Eduard Miró

	Github público: https://github.com/eduardmiro/notebookcompare

En esta práctica desarrollada en django se pretende listar todas las entidades de un base de datos de portátiles.

De esta manera de un portátil en concreto podemos almacenar la informacion correspondiente a sus características y al mismo tiempo relacionarlo con su marca de esta manera que más adelante podremos mostrar toda la información de modelos de una marca en concreto.

Para ahorrar espacio se ha considerado solo guardar las url de las imágenes tanto de las marcas como de los portátiles.

El arbol de rutas para obtener la información es el siguiente:

/brands/ 		- Lista todas las marcas disponibles
/brands/VALOR 		- Muestra los detalles la marca VALOR
/brands/VALOR/models/ 	- Lista todos los portátiles de la marca VALOR

/models/		- Lista todos los portátiles disponibles
/models/VALOR		- Muestra los detalles del portátil VALOR

/components/		- Muestra todos los posibles categorias de componentes de un portátil (CPU,RAM...)
/components/CPU		- Muestra todos los distintos CPU disponibles.Al mismo tiempo se permite buscar que modelos llevan ese procesador mediante un link

/specifications/	- Muestra todos los componentes en la base de datos, después se permite hacer una búsqueda a través de un link.
/specifications/(#idvalor)/  - Muestra todos los portátiles que llevan el id de ese componente,en este caso hemos preferido pasar un id en lugar del nombre para evitar problemas de coincidencia en la base de datos.

/login/			- Permite hacer login del usuario, se usa el built-in de django para el login.
/logout/		- Permite logout mostrando un mensaje de despedida, se reaprovecha la página principal para asi evitar mantenimiento.
/admin/			- Permite administrar la base de datos con la interfaz admin de django.

Por el momento no esta implementado poder obtener los datos mediante xml o json

El css implementado se puede encontrar en: http://bluerobot.com/web/layouts/layout1.html

