---
title: "Un año programando con inteligencia artificial: aprendizajes y reflexiones"
slug: "bitacora/un-ano-programando-con-ia"
date: 2025-09-29T00:00:00.000Z
draft: false
hideLastModified: false
summary: "Un año de experimentos personales programando con IA: de Bolt.new, Lovable, Codespaces, Copilot, Claude Sonnet 4 y las expectativas con GPT-5 Codex."
categories: [bitacora]
tags: [aprendizaje, ia, experiencias, bitácora]
---

Hace poco más de un año decidí lanzarme a un experimento personal: probar en primera persona cómo estaba evolucionando la programación asistida por inteligencia artificial. Había mucho ruido en torno al tema —que si la IA iba a quitarnos el trabajo, que si generaba código malo, que si era puro humo— y no quería quedarme solo con opiniones externas.

El objetivo era sencillo: experimentar, aprender y formarme una opinión propia. Aquí recojo lo que me ha dejado este año de práctica.

---

## Comenzar sin fricciones: Bolt.new

Uno de mis primeros descubrimientos fue [**Bolt.new**](https://bolt.new/). Me atrapó por algo muy simple: quitaba de encima esa fricción inicial que siempre me ha pesado al arrancar proyectos. Configurar entornos, dependencias o despliegues básicos siempre ha sido un paso tedioso, y Bolt lo reducía a escribir un prompt.

En cuestión de segundos, tenía un entorno listo con editor, consola y despliegue integrado. Esa simplicidad me animó a crear un proyecto que sigo usando: una aplicación para llevar el control de todo lo relacionado con mi coche —repostajes, kilómetros, mantenimientos, neumáticos, costes, talleres— y que incluso me avisa cuándo toca una revisión. Una especie de bitácora del vehículo.

La versión gratuita de Bolt.new limitaba a tres prompts al día, y aunque a veces se quedaba corta, me bastaba para avanzar de forma iterativa. Fue mi primera experiencia real de cómo la IA podía ayudarme a **prototipar con inmediatez**.

---

## Reconstruir mejor que migrar: Lovable

Tiempo después descubrí [**Lovable**](https://lovable.dev/), que ofrecía integración con Supabase y mayor potencia. Intenté migrar mi proyecto manualmente desde GitHub, pero el proceso se volvió un laberinto. Ahí aprendí una lección importante: a veces es más fácil **reconstruir con ayuda de la IA** que intentar arrastrar todo el peso de una migración.

Lo resolví escribiendo un gran prompt donde describía funcionalidades, diseño y estructura del proyecto. Con eso, pude reconstruir la aplicación en Lovable de manera sorprendentemente fiel. La navegación se replicó como la había definido, y los modelos de datos quedaron montados con apenas ajustes. Fue un recordatorio potente de lo crucial que es **dar buenas instrucciones**.

---

## Codespaces y Copilot en el día a día

Con el tiempo surgió otro problema: trabajar en varios ordenadores distintos implicaba siempre dedicar tiempo entre configuraciones y credenciales. La solución llegó con **GitHub Codespaces**: abrir el repositorio y tener en segundos un entorno listo en la nube, con Visual Studio Code en el navegador y todas las dependencias configuradas.

Gracias a eso pude incluso experimentar con lenguajes nuevos sin ensuciar mi máquina. Recuerdo haber probado Elixir una tarde: abrí un Codespace vacío, instalé lo básico y en minutos ya estaba programando.

En paralelo, **GitHub Copilot** se volvió casi invisible de tanto que lo usaba. Detectaba typos que mi IDE pasaba por alto al estar en cadenas de texto como referencias, corregía errores sutiles en algoritmos y, lo más valioso, generaba tests.

> “No solo generaba tests unitarios, también proponía casos límite que yo no había considerado, incluso en escenarios donde ya utilizaba *property-based testing*. Esa capacidad de ampliar la cobertura me abrió nuevas perspectivas de calidad.”

Al final, Codespaces me dio portabilidad y Copilot me dio apoyo constante en calidad. No siempre aplican o tienen del todo sentido algunos de los tests que sugiere pero es muy útil tenerlo en cuenta como sugerencia, como un compañero más de trabajo.

---

## La precisión de Sonnet 4

En este camino, varios compañeros me recomendaron probar **Claude Sonnet 4**, de Anthropic. La experiencia me sorprendió: no es el modelo más rápido, pero sí uno de los más precisos que he probado programando.

La diferencia estaba en que **se detenía a razonar antes de escribir código**, y eso se notaba. Lo puse a prueba con una tarea compleja: implementar un índice a partir de varios algoritmos, añadir cálculos de ponderación y exponerlo en un nuevo endpoint. Explicar bien el problema llevó unos 10 minutos. Después, en unos 20 minutos, tenía una solución que en condiciones normales me habría llevado un par de horas.

Fue uno de esos momentos en los que sentí claramente cómo la IA no sustituye, sino que **acelera el trabajo sin sacrificar precisión**.

---

## Lo que espero de GPT-5 Codex

Hoy mi mirada está puesta en **GPT-5-Codex**, la evolución de OpenAI enfocada en programación. Lo interesante no es solo la potencia, sino la idea de integrar en un mismo ecosistema lo que ahora tengo repartido: Codespaces, Copilot y asistentes externos como ChatGPT.

Me ilusiona especialmente la posibilidad de reducir dependencias y concentrar todo en GitHub: un solo flujo, menos fricción y menos suscripciones. Si Codex logra unificar eso, tendría mucho sentido para mi día a día.

---

## Reflexiones de un año de práctica

Mirando atrás, la conclusión es clara: la IA no nos quita el trabajo, pero sí cambia nuestra forma de trabajar. Lo veo como cuando aparecieron los frameworks: el rol del programador no desapareció, se transformó.

> “La IA amplifica lo que ya eres como desarrollador. Si escribías mal código, ahora lo harás más rápido; si buscabas calidad y sostenibilidad, también las conseguirás más rápido.”

Programar hoy significa aprender a guiar estas herramientas, dar contexto, estructurar bien las tareas y supervisar el resultado. La IA multiplica, pero no decide por ti.

---

## Cierro esta bitácora con una pregunta

Después de este año, lo que me queda claro es que el futuro de la programación será híbrido: criterio humano + potencia algorítmica. Lo que me pregunto es:
¿nos convertiremos en **arquitectos de prompts** o en **curadores de código generado**?

Tal vez, como pasó con los frameworks, la respuesta no esté en elegir una sola cosa, sino en aceptar que nuestra forma de programar seguirá cambiando, y que aprender a navegar ese cambio es parte del trabajo.

---

### Referencias

* [Bolt.new](https://bolt.new/) — arranque de proyectos en segundos.
* [Lovable](https://lovable.dev/) — construcción de aplicaciones con integración a bases de datos.
* [GitHub Codespaces](https://docs.github.com/codespaces/overview?utm_source=chatgpt.com) — entornos de desarrollo en la nube.
* [GitHub Copilot](https://code.visualstudio.com/docs/copilot/overview?utm_source=chatgpt.com) — asistente de programación integrado en VS Code.
* [Claude Opus 4 / Sonnet 4](https://cloud.google.com/blog/products/ai-machine-learning/anthropics-claude-opus-4-and-claude-sonnet-4-on-vertex-ai?utm_source=chatgpt.com) — modelos de Anthropic enfocados en razonamiento y programación.
* [GPT-5-Codex](https://openai.com/index/introducing-upgrades-to-codex/?utm_source=chatgpt.com) — modelo de OpenAI especializado en desarrollo de software.
