---
title: "Objetos y estructuras de datos"
slug: "libros/objetos-y-estructuras-de-datos"
date: 2018-03-31T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---


  ¿Porque crear variables privadas si acto seguido creamos los _getters_ y 
  _setters_? Con esto hacemos que el modificador _private_ pierda el sentido.

  Los _getter_ y _setter_ solo deben estar cuando sea necesario su existencia 
  porque estamos compartiendo esos datos crudos. Cuando creamos una clase lo 
  hacemos con la intención de mostrar unos datos con un formato. Por ejemplo,
  si estamos con una clase que sea para control del combustible de un 
  vehículo ¿Cual de las dos clases siguientes esta mejor?

  ``````````````````````````````````````````````````````````````````````````````
  public interface Vehiculo{
      public double capacidadDelTanqueEnLitros;
      public double litrosDeGasolinaActuales;
  }
  ``````````````````````````````````````````````````````````````````````````````

  ``````````````````````````````````````````````````````````````````````````````
  public interface Vehiculo{
      void rellenarTanque(double litros);
      double damePorcentajeDeCombustibleRestante();
  }
  ``````````````````````````````````````````````````````````````````````````````

  El segundo caso es el aconsejable, en esta clase **no importa como guardamos
  los datos** si en litros o galones o centímetros cúbicos. El usuario solo 
  le interesa cuanto le queda respecto del total y poder indicar que ha 
  llenado el deposito, y eso es lo que le damos en la segunda. No tenemos que
  dar mas datos de los que son necesarios y con el formato correcto. De forma
  que si en algún momento queremos cambiar la forma en la que implementamos 
  esta clase, el tipo de datos o la forma de calcular, el usuario no le 
  supondrá problema. Ya que en el segundo caso seguiremos devolviendo el 
  mismo resultado, pero calculado de otra manera o en otras unidades pero 
  haciendo la conversión antes de devolver el resultado. En el primer caso el
  usuario de nuestra clase tendrá que hacer cambios donde use esos campos.

Datos estructurados u Objetos
--------------------------------------------------------------------------------

  Pongamos unos ejemplos para reflejar las diferencias entre estos. En el 
  primero de ellos implementamos una clase por cada figura geométrica y otra 
  en la que calculamos el área.

  ``````````````````````````````````````````````````````````````````````````````
  public class Cuadrado {
    public Punto superiorDerecho;
    public double lado;
  }
  
  public class Rectangulo {
    public Punto superiorDerecho;
    public double altura;
    public double anchura;
  }
  
  public class Circulo {
    public Punto centro;
    public double radio;
  }
  
  public class Geometria {
    public final double PI = 3.141592653589793;
  
    public double area(Object figura) throws FiguraNoSoportada {
      if (figura instanceof Cuadrado) {
        Cuadrado cuadrado = (Cuadrado) figura;
        return cuadrado.lado * cuadrado.lado;
  
      }if (figura instanceof Rectacgulo) {
        Rectangulo rectangulo = (Rectangulo) figura;
        return rectangulo.altura * rectangulo.anchura;
  
      }if (figura instanceof Circulo) {
        Circulo circulo = (Circulo) figura;
        return PI * circulo.radio * circulo.radio;
      }
      throw new FiguraNoSoportada();
    }
  }
  ``````````````````````````````````````````````````````````````````````````````
  
  Los programadores orientados a objetos estarán arrancándose los pelos de la 
  cabeza al ver esto, pero tiene sus aspectos positivos si tienes que añadir 
  una **función perímetro** en la clase **Geometría** las clases de figuras 
  ¡no se ven afectadas! Pero por otro lado si incorporamos una **nueva 
  figura** todos los métodos de la clase Geometría tendrán que ser 
  actualizados con la nueva.
  
  Si por el contrario tenemos el caso siguiente en el que usamos la 
  orientación a objetos en el que el método **area()** sea [polimórfico], la 
  clase **Geometría** no sera necesaria gracias al uso de las [interfaces]. Y
  en caso de tener que añadir una nueva figura ¡no tendremos que hacer nada!
  
  ``````````````````````````````````````````````````````````````````````````````
  public class Cuadrado implements Figura {
    private Punto superiorDerecho;
    private double lado;
  
    public double area() {
      return lado * lado;
    }
  
  }
  
  public class Rectangulo implements Figura {
    private Punto superiorDerecho;
    private double altura;
    private double anchura;
  
    public double area() {
      return altura * anchura;
    }
  }
  
  public class Circulo implements Figura {
    private Punto centro;
    private double radio;
    public final double PI = 3.141592653589793;
  
    public double area() {
      return PI * radio * radio;
    }
  }
  ``````````````````````````````````````````````````````````````````````````````
  
  Solo para dejarlo claro son dos implementaciones completamente opuestas 
  **objetos** o **estructuras de datos**, tu decides. Si prevés que vas a 
  incluir nuevas funciones en un futuro las estructuras de datos son mucho 
  mas fáciles pero, por el otro lado, si tu previsión es que incluirás nuevos
  "tipos" de datos la orientación a objetos soluciona el problema mucho mas 
  sencillamente.

La ley de Demeter
--------------------------------------------------------------------------------

  Resumiendo mucho esta [ley] dice que __quien modifica__ (modulo que lo usa) 
  un objeto no debe conocer sus entresijos (como se implementa internamente).
  Esta ley no es aplicable a las estructuras de datos, ya que como vimos 
  antes el funcionamiento de estas es justamente lo contrario. Esta ley de 
  Demeter es aplicable para la orientación a objetos.

Híbridos
--------------------------------------------------------------------------------

  Si vas a implementar ambos casos a medias terminaras por no implementar 
  ninguno y quedarte con la peor parte de los dos. No hagas un híbrido de 
  objeto y estructura de datos porque acabaras con la peor parte de cada uno 
  de ellos, analiza y decide cual compensa mas implementar, seguramente no 
  uses todas sus ventajas y sufras algunos de sus defectos pero es decisión 
  tuya saber cual compensa una cosa con la otra de mejor forma.

[Libro original]
--------------------------------------------------------------------------------

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
[polimórfico]: https://es.wikipedia.org/wiki/Polimorfismo_(inform%C3%A1tica)
[interfaces]: https://es.wikipedia.org/wiki/Interfaz_(Java)
[ley]: https://es.wikipedia.org/wiki/Ley_de_Demeter
