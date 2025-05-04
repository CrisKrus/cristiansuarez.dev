---
title: "Test Unitarios"
slug: "libros/test-unitarios"
date: 2018-04-21T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---

Test Unitarios
================================================================================

  La programación a evolucionado mucho en tan solo 20 años, antes por 1997
  cuando estaba empezando no había forma de probar las funciones que creábamos.
  No era raro crear la función añadirle una parte en la que podamos introducir
  por teclado caracteres o alguna orden y ver como responde este, pero a día de
  hoy existen los test unitarios. Test que ejecutarán nuestra función y
  comprobarán si el resultado obtenido es el que nosotros esperábamos. Tan
  buenos son estos test y tanto ruido han hecho las [metodologías ágiles] y el
  [TDD] que no es raro a día de hoy que en una entrevista de trabajo te
  pregunten explícitamente por ellos.

Las tres leyes del TDD
--------------------------------------------------------------------------------

  1. No escribirás código de producción hasta que exista un test que falle.
  2. No escribirás más de un test unitario que falle.
  3. No escribirás más código de producción del necesario para pasar el test.

  Estas reglas se convierten en un ciclo de trabajo que no dura más de 30
  segundos. Escribes un test, compruebas que falle, escribes el código para que
  este no falle. De esta manera escribimos los test y el código que lo pase al
  mismo tiempo. Si tomamos este hábito será fácil escribir docenas de test
  diariamente lo que hará que cada mes tu software tenga cientos de test nuevos
  que lo prueban ¿quien no quiere eso?

Mantener los test limpios
--------------------------------------------------------------------------------

  Puede que pienses que los test son una simple herramienta para llegar a un
  código de producción sólido y robusto, que realmente el fin es este código de
  producción. Y por ello no le prestes mucha importancia al como realizar los
  test, los creas con "prisa" dejas variables o los propios test con malos
  nombres. El problema vendrá en el futuro cuando creando un nuevo test para una
  nueva funcionalidad tienes que cambiar algo del código y bum explotan unos
  cuantos test a parte del nuevo. Comienzas a leer y ves que no tienes idea de
  que están probando realmente, en ese momento comenzará un viaje el cual (con
  suerte) si has escrito el test hace poco y tienes buena memoria acaba rápido
  pero en la mayoría de casos no será así.

  Con todo esto quiero decir que el código de los test es tan importante como el
  de producción.

Un test limpio
--------------------------------------------------------------------------------

  ¿Como mantenemos un test limpio? Legibilidad, al igual que hemos hablado de
  como hacer un código limpio los test funcionan de un modo similar: claridad,
  simplicidad y densidad. Imagina que te enfrentas a este test:

  ``````````````````````````````````````````````````````````````````````````````
  public void testGetPageHieratchyAsXmlDoesntContainSymbolicLinks() throws Exception{
      WikiPage pageOne = crawler.addPage(root, PathParser.parse("PageOne"));
      crawler.addPage(root, PathParser.parse("PageOne.ChildOne"));
      crawler.addPage(root, PathParser.parse("PageTwo"));
  
      PageData data = pageOne.getData();
      WikiPageProperties properties = data.getProperties();
      WikiPageProperty symLinks = properties.set(SymbolicPage.PROPERTY_NAME);
      symLinks.set("SymPage", "PageTwo");
      pageOne.commit(data);
  
      request.setResource("root");
      request.addInput("type", "pages");
      Responder responder = new SerializedPageResponder();
      SimpleResponse response =  (SimpleResponse) responder.makeResponse(new FitNesseContext(root), request);
      String xml = response.getContent();
      assertEquals("text/xml", response.getContentType());
      assertSubString("<name>PageOne</name>", xml);
      assertSubString("<name>PageTwo</name>", xml);
      assertSubString("<name>ChildOne</name>", xml);
      assertNotSubString("SymPage", xml);
  }
  ``````````````````````````````````````````````````````````````````````````````

  Puede que logres comprenderlo después de un tiempo de análisis, no digo que
  sea imposible. Incluso puede que no te lleve mucho tiempo, pero enfrentarse a
  test así diariamente acaba quemando antes nuestra cabeza. Si en lugar de eso
  tenemos ese mismo test pero de la siguiente forma:
  
  ``````````````````````````````````````````````````````````````````````````````
  public void testSymbolicLinksAreNotInXmlPageHierarchy() throws Exception {
      WikiPage page = makePage("PageOne");
      makePages("PageOne.ChildOne", "PageTwo");
  
      addLinkTo(page, "PageTwo", "SymPage");
  
      submitRequest("root", "type:pages");
  
      assertResponseIsXML();
      assertResponseContains(
          "<name>PageOne</name>", "<name>PageTwo</name>", "<name>ChildOne</name>"
      );
      assertResponseDoesNotContain("SymPage");
  }
  ``````````````````````````````````````````````````````````````````````````````

  Sigue teniendo las mismas tres partes diferenciadas. Una primera parte donde
  creas los datos para el test, a continuación donde utilizamos estos datos y
  finalmente comprobamos si el resultado es el esperado.

Un solo assert por test
--------------------------------------------------------------------------------

  Una buena mentalidad es la de un solo assert por test, en la práctica no es
  tan fácil y veremos que aveces tendremos que poner más de uno. Es una
  mentalidad que se suele tener en cuenta pero no es posible llevarla a cabo en
  todos los casos. Por ello mejor el mínimo de asserts por test.

  Lo que realmente tiene que ser único por test es el concepto a probar, que es
  lo que queremos poner a prueba y eliminar todo el ruido que pueda generarse a
  su alrededor. Con esto me refiero, si tienes una función que puede generar
  tres casos, por ejemplo. Dado un número este puede ser mayor, menor o igual.
  **No** haremos un  test que pruebe estos tres casos de una sola vez, tenemos
  que hacer tres test independientes de manera que cada uno de ellos prueba un
  concepto, un caso.

F.I.R.S.T.
--------------------------------------------------------------------------------

  Las cinco reglas que siguen los test limpios:
  
  - **Fast**, rápido: un test tiene que ejecutarse rápido, si tenemos un test
  que tarda bastante en completarse no nos gustará ejecutarlo con frecuencia y
  tardaremos más en ver posibles errores.
  - **Independent**, independiente: los test tienen que ser independientes unos
  de otros, no podemos tener test que están conectados entre ellos porque en el
  momento que el primero falle todos los demás irán detrás, y será complicado
  saber donde empieza el problema.
  - **Repeatable**, repetible: los test tienen que poder ser ejecutados en
  cualquier ambiente (_enviroment_) desde producción hasta tu portátil en casa
  sin conexión a internet.
  - **Self-validating**, auto-validados: los test tienen que, por si mismos,
  dar como resultado un _boolean_ (verdadero o falso) no queremos test que
  guarden un resultado en un documento de texto que tendremos que mirar a
  posterior y comprobar si coincide con otro que ya tenemos, Somos humanos y
  nos equivocamos, podemos no comprobar bien estos resultados y más cuando
  llevamos ya unas cuantas horas de trabajo encima ese día.
  - **Timely**, oportuno: los test solo serán escritos antes del código de
  producción que haga que los pase. Si tratas de escribirlos después acabarás
  odiando los test, porque habrá partes que son muy complicadas de probar o el
  código de producción que tienes no está si quiera pensado para ser probado.


[Libro original]
--------------------------------------------------------------------------------

Referencias
--------------------------------------------------------------------------------

  - [Template method]
  - [Given When Then]

[metodologías ágiles]: https://es.wikipedia.org/wiki/Desarrollo_%C3%A1gil_de_software
[TDD]: https://es.wikipedia.org/wiki/Desarrollo_guiado_por_pruebas
[Template method]: https://es.wikipedia.org/wiki/Template_Method_(patr%C3%B3n_de_dise%C3%B1o)
[Given When Then]: https://martinfowler.com/bliki/GivenWhenThen.html
[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
