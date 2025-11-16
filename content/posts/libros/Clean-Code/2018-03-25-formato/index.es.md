---
title: "Formato"
slug: "libros/formato"
date: 2018-03-25T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
tags: [clean-code, buenas-prácticas, formato, estilo]
---


  ¿Dejar una linea en blanco entre métodos o no? ¿El corchete de inicio de la
  función en la misma linea o en la siguiente? ¿Los campos de la clase todos en
  la parte superior o al final? Parecen pequeños detalles insignificantes pero a
  la hora de leer y comprender lo que hemos hecho es mejor seguir siempre un
  mismo estilo y mas aun si estamos trabajando en equipo. A veces depende del
  lenguaje que usemos pero en la gran mayoría de casos es un tema del cada
  persona.
  
  De estos temas no hay hojas de estilo estrictas que sigan todos los
  programadores, pero existe unas "normas" que todos conocen o van descubriendo
  con el paso del tiempo.

## Formato vertical

  ¿Cuanto debe ocupar un fichero? Como ya dije no hay nada escrito en Java un
  fichero es una clase, si estamos haciendo lo correcto. Estas si miramos casos
  de proyectos ya desarrollados vemos que rara vez superan las 500 lineas y que
  normalmente se extienden 200 lineas, en esta extensión una clase tiene mas que
  suficiente para realizar todas las funciones que debería.
  
  Toda nuestra clase debe de estar estructurada como un articulo empezando por
  un titulo que nos acerque sobre el tema que trata esta, luego una introducción
  donde tendremos los campos de la clase y el constructor, con lo que sabremos
  con una mirada rápida quienes son los "personajes" que tenemos en nuestra
  historia. Un nudo donde estarán todas las funciones de la clase. 
  
  Todos estos métodos deben de estar tan cerca unos de otros como de
  relacionados estén entre si. De manera que si en un primer método usamos un
  segundo este debería estar justo debajo, como si continuásemos un párrafo.
  Todo esto es por sentido común, no lo pondremos lejos para estar saltando de
  arriba a abajo sin parar hasta marearnos.
  
  De igual manera las variables no las declararemos muy lejos de donde las
  usamos, si estas solo tienen razón de ser dentro de un método lo declararemos
  en este. Si es una variable para controlar un bucle, esta estará justo encima
  del bucle.

## Formato horizontal

  En los inicios de la informática no se escribían mas de 80 caracteres (si no
  me equivoco) porque los terminales donde se veían no alcanzaban mas. Hoy en
  día no podemos tener esta guía dada la gran cantidad de monitores en el
  mercado, panorámicos, etc. de todos los tamaños y colores. Pero como limite se
  podría decir que unos 120 caracteres es una medida buena.
  
  Los espacios entre los parámetros de una función, personalmente me gusta que
  después de cada coma ',' dejar un espacio y es recomendable para ayudar a ver
  que se tratan de variables diferentes. De la misma forma podemos dejar
  espacios entre las variables de una operación si ayuda a que esta se vea de
  forma mas clara.
  
  Cuando declaramos muchas variables seguidas, hay quienes las declaran de la
  siguiente forma:
  
  ``````````````````````````````````````````````````````````````````````````````
  private   Socket          socket;
  private   InputStream     input;
  private   OutputStream    output;
  private   Request         request;
  private   Response        response;
  private   FitNesseContext context;
  protected long            requestParsingTimeLimit;
  private   long            requestProgress;
  private   long            requestPars;
  ``````````````````````````````````````````````````````````````````````````````
  
  Puede parecer a primera vista que de esta forma queda mas claro pero no, no es
  verdad es mas fácil no seguir la linea que toca y terminar leyendo mas arriba
  de donde empezamos equivocándonos.
  
  ``````````````````````````````````````````````````````````````````````````````
  private Socket socket;
  private InputStream input;
  private OutputStream output;
  private Request request;
  ``````````````````````````````````````````````````````````````````````````````

## Reglas de equipo

  Todas estas reglas que seguimos cada uno de nosotros al escribir no dejan de
  ser por gusto personal. Por ello si vamos a realizar un proyecto en equipo es
  mejor usar 10 minutos antes de empezar a hacer nada y llegar a un acuerdo
  entre todos para que todo este sea de la misma forma y no veamos decenas de
  estilos diferentes. Sera una ayuda en el futuro si tenemos que leer parte del
  trabajo hecho por un compañero.

## Libro original

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
