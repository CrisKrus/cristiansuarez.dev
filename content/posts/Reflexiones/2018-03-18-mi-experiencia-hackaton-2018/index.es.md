---
title: "Hack for good 2018, Canarias"
slug: "hack-for-good-2018-canarias"
date: 2018-03-18T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [reflexión]
---

# Hack for good 2018, Canarias

El pasado 8 de Marzo asistí a mi primer [Hackaton](http://hackforgood.net/las-palmas/) junto a mi compañero de batalla [Javier Santana](https://twitter.com/MrIvaj). La primera sorpresa fue nada más llegar, íbamos con una idea preconcebida de encontrar una gran cantidad de frikis de la informática allí, realmente si lo pienso ahora en frío no se porqué, pero fue todo lo contrario encontramos personas de muchas disciplinas dirección de empresas, magisterio, diseño, incluso un profesional que venía huyendo del día a día de su trabajo quería desconectar y pensar en nuevos retos.

Tras las exposiciones de los retos por lo ponentes, nos quedamos en tierra de nadie ningún reto nos llamaba con mucho interés, no sabíamos que hacer en cual de ellos participar. Observábamos como el resto de participantes ya estaban formando sus equipos y empezando a planear que hacer con su reto mientras nosotros discutíamos a que atacar, dudamos entre el propuesto por [Santi Navarro](https://twitter.com/Santi_Navarro_) para [Wikimedia](https://www.wikimedia.org/) o, ir a por el reto de ayuda para los celiacos. Necesitábamos un impulso que nos decidiera de una vez.

Y así fue, dos chicos se nos acercaron ([David](https://twitter.com/Heyheydavi) y [Javier](https://twitter.com/javiercabreram)) al escucharnos hablar sobre el reto de Santi y nos comentaron que ellos estaban pensando ir a por el mismo, que podríamos formar un equipo. Hablamos, vimos que teníamos una idea similar, congeniábamos bien, estudian diseño algo que a Javi y a mi no se nos da especialmente bien y lo más importante, teníamos ganas. Así que había nacido un nuevo equipo de trabajo para el Hackaton.

## Explicación del reto

El [reto](https://hackforgood.net/que-puedo-fotografiar-para-wikipedia/) parte de que Wikimedia en muchos de sus artículos no tiene foto y que es una enciclopedia sin fotos en sus artículos. Estas hacen que leer se haga mas ameno y ya lo sabemos todo una imagen vale más que mil palabras. Entonces se propuso el hacer una aplicación con la que partiendo de tu ubicación actual te muestre artículos cercanos sin foto, para que puedas acercarte sacar la foto subirla y ayudar a completar entre todos esta enciclopedia. Había una evolución clara para la segunda fase del proyecto, que sería el poder la aplicación sugerirte rutas para hacer fotos o por otro lado rutas visitando puntos cercanos a modo de turismo. Pero esto último eran funcionalidades para segunda o tercera fase de la aplicación, la principal problemática era añadir fotos.

## Viernes

Al día siguiente al llegar por la mañana vimos que ya ellos habían adelantado trabajo, tenía preparado el [canvas](http://www.eoi.es/wiki/index.php/Modelo_CANVAS_en_Proyectos_de_negocio) con las ideas sobre el problema, soluciones y puntos clave del proyecto. Hablamos, corregimos, detallamos y una vez con todo organizado y dado de alta en el evento comenzamos a desarrollar cada uno nuestras tareas.

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/93593556@N02/25948746727/in/album-72157693756827624/" title="HackForGood Canarias 2018"><img src="https://farm1.staticflickr.com/785/25948746727_f23eaa67c1_z.jpg" width="640" height="427" alt="HackForGood Canarias 2018"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

En el caso de Javi y mío decidimos hacer primero una web en HTML, con datos falsos a modo de prototipo antes de comenzar a darle funcionalidades para que nuestros compañeros pudieran ir probando el material que generaban. Estuvimos con ello casi toda la mañana. Sobre mediodía Javi tuvo que salir para el trabajo y me quedé solo con la web. En ese momento decidí comenzar a jugar con la API de [Wikimedia](https://www.mediawiki.org/wiki/API:Main_page/es), de primeras fue un poco extraño nunca me había enfrentado a algo así a solas y no estaba muy familiarizado. Pasé esa tarde y parte de la noche, escribiendo _query_ tras _query_ hasta que conseguí obtener los datos que nos hacía falta. Ya con estos datos parecía que el resto sería una cosa rodada pero no iba a ser tan fácil, tocaba el siguiente problema **Google Maps**. Pero esto sería un problema que abordaría al día siguiente, para mí el día terminaba ahí. Me fui a dormir a casa el Viernes por la noche (me arrepiento, me perdí bastantes buenos momentos).

Uno de ellos como mi compañero Javi, decide a las tantas de la madrugada borrar todo el trabajo hecho porque no le gustaba y rehacerlo todo jajaja Me manda un mensaje que leo por la mañana diciendo: "Lo borré todo, ahora está en este repositorio nuevo. Revísalo, te he dejado notas para que soluciones algún problema que tiene" Me tuve que reír.

## Sábado

Un problema con el teníamos la suerte de contar con la ayuda de un mentor que conocía a la perfección el tema, [Pablo Fernández](https://twitter.com/MonizPablo). Le pregunté vino nos ayudó estuvo conmigo un rato hasta que logramos pintar aquella nube de puntos en el mapa, toda una victoria, gracias Pablo. 

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/93593556@N02/39010421350/in/album-72157693756827624/" title="HackForGood Canarias 2018"><img src="https://farm5.staticflickr.com/4776/39010421350_9a8251cc41_z.jpg" width="640" height="427" alt="HackForGood Canarias 2018"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Con esta parte finalizada quedaba el siguiente paso, subir las fotos. Y aquí hablamos el grupo durante un tiempo y decidimos que no nos daba tiempo, no era algo que a pocas horas de que cerrara el plazo de entrega nos diese tiempo. Preferimos no arriesgar y comenzar con la parte de la presentación, organizar los entregables y dejar todo listo para que no se nos hiciera tarde luego.

Una vez todo presentado sin problemas, estando todo en orden y quedando solo preparar la presentación (en la que no participé, se lo pedí a mis compañeros) dediqué lo que quedaba de mañana a preguntar al resto de equipos que tal con sus retos. Llevaba un día allí y no había hecho lo más importante en este evento **¡conocer gente maravillosa!**. Fui equipo por equipo, preguntando que tal el reto y la experiencia en general.

**GC004 Canarias sin Barreras**, me contaban como empezaron queriendo hacer una aplicación pero vieron que había decenas ya sin terminar y cambiaron de idea hacia una base de datos que recopile toda la información de estas que ya existe y unificarlo. Porque cada una mapeaba un trozo cercano a los creadores pero no continuaban más.

**GC010 Testigos de Fourier**, como en la madrugada sobre las 2 am **la gran hora** consiguieron mejorar el tiempo de la función, con lo que ello suponía y la emoción que supuso.

**GC002 H4Gluten**, como descubrieron la poca información al respecto que hay en la web sobre los celiacos y que pasara lo que pasase querían que este proyecto continuase.

Y como no agradecer a todo el **equipo de mentores y organizadores**, los cuales saben como relajar la tensión que existe en esta contrarreloj. ¡¡Son todo unos profesionales!!

Y como estos otros tanto que no te voy a seguir contando porque esto se hará eterno, pero muy contento de conocerlos a todos ellos. Y tan contento estaba que una vez finalizadas las presentaciones, el jurado en proceso de deliberación, y haber hablado con todos de la buena experiencia que esto había supuesto me fui. Me fui contento, con mi premio el haberlos conocido y la experiencia en general. La sorpresa fue al llegar a casa que me llama Javi diciendo que habíamos ganado dos premios, y que yo como capitán no estaba... que vergüenza... Lo dicho, muy muy contento con la experiencia en general.


## Más información

[Hack for good Las Palmas](https://hackforgood.net/las-palmas/)

[Álbum completo](https://www.flickr.com/photos/93593556@N02/sets/72157693756827624/)

[Twitter hack for good Canarias](https://twitter.com/H4GCAN)



