---
title: "JUnit Internos"
slug: "libros/junit-internos"
date: 2018-06-09T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---


  [JUnit] es de los *frameworks* *open source* más famosos de testing en Java. Es 
  simple en su concepto, preciso y elegante de implementar. Además al tener 
  tanta fama y tantos seguidores podemos encontrar documentación de sobra.

Ejemplo básico
--------------------------------------------------------------------------------

  Supongamos que tenemos una calculadora con la siguiente implementación. No 
  es importante la implementación en si, pero si quieres reproducir un test 
  te lo dejo, por aquí ;)
  
````````````````````````````````````````````````````````````````````````````````
  public class Calculator {
    public int evaluate(String expression) {
      int sum = 0;
      for (String summand: expression.split("\\+"))
        sum += Integer.valueOf(summand);
      return sum;
    }
  }
````````````````````````````````````````````````````````````````````````````````
  
  Y como es normal queremos hacer un test de nuestra calculadora porque como 
  ya sabemos tener una buena batería de test es importante. Entonces 
  implementamos el siguiente.
    
````````````````````````````````````````````````````````````````````````````````
  import static org.junit.Assert.assertEquals;
  import org.junit.Test;
  
  public class CalculatorTest {
    @Test
    public void evaluatesExpression() {
      Calculator calculator = new Calculator();
      int sum = calculator.evaluate("1+2+3");
      assertEquals(6, sum);
    }
  }
````````````````````````````````````````````````````````````````````````````````
  
  Como vemos es bastante fácil y limpio, es por lo que es tan famoso. Y como 
  este podemos hacer todos los test que queramos, buscando hacer que falle la
  calculadora. Porque si conseguimos que falle es buena señal, ya hemos 
  descubierto un hueco que tapar, una funcionalidad rota o que no existe. Y 
  claro, mejor encontrarla nosotros que un usuario frustrado.
  
  - - -
  
Pasar los test no significa que no falle
--------------------------------------------------------------------------------

  Y es aquí donde quería llegar, como he dicho puedes hacer todos los test 
  que se te ocurran. Y ahí está el punto, *los que se te ocurran*. En este caso 
  sólo tenemos uno y parece claro que esta calculadora no está completa 
  ¿verdad? Claro, eso lo vemos nosotros que conocemos más operaciones 
  aritméticas que no sea la suma. Pero, quien ha implementado esta 
  calculadora no conocía más. Para él parece que está completa y testeada 
  contra todos los problemas y casos existentes. No se si ves lo que trato de
  decirte. __Tener una gran batería de test no significa que tu aplicación esté
  correcta__ o perfecta porque pasa todos los test. Eso solo significa que aún 
  no has encontrado/escrito los suficientes test para encontrar un fallo. Y 
  antes o después alguien se le ocurrirá otro caso que haga que la aplicación 
  explote. 
  
  Es por eso que los test si son importantes, es un gran apoyo contra los 
  cambio que puedas hacer al código. Pero no significa que vaya a funcionar 
  en todos los casos que se den. __Haces test para probar todo, sabiendo que 
  todo no puede ser probado.__ 
  
  - - -
  
  Esto es lo que le pasa al autor en este capítulo. Nos muestra un código de 
  primeras bastante correcto y limpio, con una batería de test bastante 
  completa. Y va haciendo varios cambios en el código, nombres de variables, 
  encapsula algunos métodos, etc y finalmente descubre un fallo. Este fallo 
  no estaba visible por como se redactaban las condiciones. Y tras un poco 
  más de cambios en el código, descubre como dos condiciones más sobran. 
  
  En un primer momento, miras y ves `fSuffix > 0` puede parecer que tiene 
  sentido.
  
````````````````````````````````````````````````````````````````````````````````
  ...
  if (fSuffix > 0)
      result = result + computeCommonSuffix();
  return result;
  ...
````````````````````````````````````````````````````````````````````````````````
  
  Pero después de varias vueltas al código con paciencia, llegamos a esto 
  otro que al verlo choca.
  
````````````````````````````````````````````````````````````````````````````````
  ...
  if (suffixLength >= 0)
      result = result + computeCommonSuffix();
  return result;
  ...  
````````````````````````````````````````````````````````````````````````````````
  Ya que al tratarse de una aplicación que comprueba 
  si dos *strings* tienen algún carácter distinto. Si nos ponemos a ver el 
  código, llegamos a la conclusión de como esa comparación no tiene sentido. 
  Puesto que si ha llegado a este punto es porque existe un sufijo, es decir es
  imposible que sea 0 y nunca entrará al *else*. Una vez sabemos esto podemos
  borrar ambas comparaciones dejando más claro aún el código.
  
  - - - 
  
  Y todo esto porque el autor quiso darle una vuelta a un aplicación que 
  parecía, de primeras testeada a prueba de misiles nucleares. Pero a pesar 
  de ello se podía mejorar aún más. __Siempre se puede mejorar__
      
Referencias
--------------------------------------------------------------------------------

* [Libro original] sobre Clean Code.
* [Página][JUnit] oficial de JUnit.
* [Wiki][github-getting-started] primeros pasos con JUnit.


<!------------------------------ All links here ------------------------------->

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
[JUnit]: https://junit.org/junit5/
[github-getting-started]: https://github.com/junit-team/junit4/wiki/getting-started

