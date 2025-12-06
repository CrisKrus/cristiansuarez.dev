---
title: "Límites"
slug: "libros/limites"
date: 2018-04-14T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
tags: [clean-code, buenas-prácticas, arquitectura, boundaries]
---


  Cuando consumimos una API de terceros existe un conflicto de ideas entre quien
  la crea y quien la consume. Los creadores quieren llegar a la mayor cantidad
  de público posible y, los consumidores de esta, quieren que sea lo más consisa
  posible y esté lo mejor enfocada con su problema para evitar funcionalidades
  superfluas. Por ejemplo si usamos un `Map` es normal ver lo siguiente
  repetidas veces en nuestro código.

  ``````````````````````````````````````````````````````````````````````````````  
  Sensor s = (Sensor) sensor.get(sensorId);
  ``````````````````````````````````````````````````````````````````````````````  
  
  Si, funciona y si, estámos acostumbrados a verlo con bastante frecuencia pero
  en términos de clean code es mejorable. Todo porque clase Map devuelve un
  objeto genérico. ¿Pero por qué no "solucionamos" este problema? Podemos crear
  una clase en medio que en lugar de devolver `object` devuelva `Sensor`
  directamente
  
  ``````````````````````````````````````````````````````````````````````````````  
  public class Sensor {
    ...
    
    public Sensor getById(String id) {
      return (Sensor) sensors.get(sensorId);
    }
    
    ...
  }
  ``````````````````````````````````````````````````````````````````````````````  

  De esta forma evitamos muchos problemas y hacemos que el uso sea más claro,
  además podremos limitar el uso a las funcionalidades que realmente nos hacen
  falta evitando el ruido del que hablamos en el comienzo de una API que trata
  de contentar a un gran público.

Aprende con los test
--------------------------------------------------------------------------------

  Si estamos haciendo uso de una nueva API es normal que al comienzo hagamos
  algunas funcionalidades pequeñas para comprender el funcionamiento de esta y
  como trabajar con ella correctamente en un proyecto de pruebas donde no rompas
  nada. ¿Y si en lugar de eso creamos unos test básico? ¿Qué puede tener de
  malo? Que cuando cambien la API nos demos cuenta porque los test fallan, si un
  conpañero está en la misma situación pueda ver las funciones básicas en esta
  "documentación" hechas con los test, si dentro de un tiempo vamos a volver a
  usarla tener donde refrescar la memoria. Creo que he logrado dejar claro que
  es una buena idea que ayuda más de lo que molesta y no te consumirá tanto
  tiempo como para no merecer la pena.

[Libro original]
--------------------------------------------------------------------------------

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413


