---
title: "Nombres significativos"
slug: "libros/nombres-significativos"
date: 2018-03-08T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---


  En este capítulo se trata un tema el cual me importa especialmente, nombrar 
  variables, métodos, clases o cualquier cosa que requiera ser nombrada. Es 
  algo que en los inicios de mi aprendizaje con la programación nadie me dijo
  y después de dos años me di cuenta y he ido corrigiendo poco a poco.

Evita la desinformación & Usa nombres que revelen infromación
--------------------------------------------------------------------------------

  Dar un buen nombre puede llevar tiempo, pero ayuda a ahorrar más en el 
  futuro. Supongamos tenemos lo siguiente

  ``````````````````````````````````````````````````````````````````````````````
  private void calcula(int numero){
      // haz algo largo y lioso
     ...
  }
  ``````````````````````````````````````````````````````````````````````````````

  Cuando nos encontremos en nuestro programa esto tendremos que mirar primero 
  si hay algún buen comentario que nos diga que hace, con suerte, o pasar una 
  divertida tarde descifrando que es lo que obtenemos de todo esto y si 
  realmente es lo que queremos porque "calcula" pero que es lo que calcula. 
  Esto es un ejemplo extremista pero queda más claro de esta forma.

  Si en lugar de esto tuviésemos esto otro sería mucho más fácil

  ``````````````````````````````````````````````````````````````````````````````
  private void calculaPresiónDelAgua(int metrosCubicos){
      // haz algo largo y lioso
      ...
  }
  ``````````````````````````````````````````````````````````````````````````````

Nombres pronunciable
--------------------------------------------------------------------------------

  De igual manera los nombres tienen que ser pronunciables no le demos nombres
  cortos con siglas que hace que a la hora de nombrarlo sea imposible. 
  Imagina tienes un campo que guarda la fecha con el formato 
  año-mes-dia-hora-minuto-segundo y decides llamar a este ```private date 
  genamdhms;```  cuando trates de preguntar a otra persona del equipo por 
  este campo ¿como lo nombrarás? y claro, suerte para que tus compañeros le 
  den el mismo nombre y sean capaces de ponerse de acuerdo. Mejor si lo 
  llamas de la forma ``` private date generateTimestamp```

Nombres buscables
--------------------------------------------------------------------------------

  Es bastante normal ver trozos de código como este

  ``````````````````````````````````````````````````````````````````````````````
  for (int j=0; j<34; j++){
      s += (t[j]*4/5);
  }
  ``````````````````````````````````````````````````````````````````````````````

  Que no está mal cumple su función (cualquiera que sea, supongo) pero si 
  queremos corregir, por ejemplo ese "34" en algún momento prque ha cambiado 
  el límite, para empezar no sabemos que es lo que indica y segundo ¿como lo 
  piensas buscar entre todas las líneas de código? sería mejor si hicieramos
  esto en su lugar.

  ``````````````````````````````````````````````````````````````````````````````
  int realDaysPerIdealDay = 4;
  const int WORK_DAYS_PER_WEEK = 5;
  int sum = 0;
  for (int j=0; j < NUMBER_OF_TASKS; j++) {
      int realTaskDays = taskEstimate[j] * realDaysPerIdealDay;
      int realTaskWeeks = (realdays / WORK_DAYS_PER_WEEK);
      sum += realTaskWeeks;
  }
  ``````````````````````````````````````````````````````````````````````````````

  De esta forma en un futuro si queremos cambiar el número de tareas o como se
  calculan estas por día, solo tendremos que usar el buscador y cambiarlo 
  donde esté la constante.

Notación húngara
--------------------------------------------------------------------------------

  Por bagajes culturales de los primeros lenguajes de programación donde 
  indicaban en el nombre de la propia variable el tipo de esta, entiendo que 
  porque era más cómodo al no tener los lenguajes actuales de [tipado fuerte]
  y los potentes [IDE] que tenemos en la actualidad. Pero a día de hoy estoy 
  no es necesario el propio compilador te avisa si no es compatible la 
  variable (en caso de Java, por ejemplo). **No hagas** ```String 
  telefonoString```

Nombres de clase
--------------------------------------------------------------------------------

  Estos deben de ser nombres no verbos usar ```Customer, Wikipage, Account``` 
  en lugar de ```Manager, Processor, Data```

Nombres de métodos
--------------------------------------------------------------------------------

  De forma contraria los métodos deben de ser nombrados como verbos, 
  identificando una acción ```postPayment, deletePage, save```

No seas lindo
--------------------------------------------------------------------------------

  Nombrar tratando de ser gracioso por alguna broma que tienes con cierto 
  compañero, o porque está relacionado con una serie de televisión famosa que
  "todo el mundo conoce" o "está claro lo que significa" no es una buena 
  idea, por mucho que te vayas a reir cuando lo leas. Recuerda no todas las 
  personas tienen el mismo nivel de cultura en los mismos temas que tú y no 
  tienen porque saber que significan esas siglas.

No añadas contexto gratuitamente
--------------------------------------------------------------------------------

  Si estás desarrollando una aplicación que se llama "Gas Station Deluxe" es 
  mala idea nombrar todas las clases con el prefijo "GSD". Te estás añadiendo
  ruido cada vez que pulses "G" para usar algún método, variable, etc que 
  realmente si empieza por esta letra el IDE te hará sugerencias de todo lo 
  que no necesitas.

  A parte de estos puntos que he resumido de forma muy simple, hay otros 
  puntos que se tratan en el libro que he decidido no añadir.

Puntos no descritos
--------------------------------------------------------------------------------

  - Make Meaningful Distinctions
  - Avoid Encodings
  - Member Prefixes
  - Interfaces and Implementation
  - Avoid Mental Mapping
  - Pick One Word per Concept
  - Don't Pun
  - Use Solution Domain Names
  - Use Problem Domain Names
  - Add Meaningful Context

Libro original
--------------------------------------------------------------------------------

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
[tipado fuerte]: https://es.wikipedia.org/wiki/Tipado_fuerte
[IDE]: https://es.wikipedia.org/wiki/Entorno_de_desarrollo_integrado
