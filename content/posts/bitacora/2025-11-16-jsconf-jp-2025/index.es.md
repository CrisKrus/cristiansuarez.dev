---
title: "JSConf JP 2025 — Bitácora de un domingo intenso"
slug: "bitacora/jsconf-jp-2025"
date: 2025-11-16T00:00:00.000Z
draft: false
hideLastModified: false
summary: "Bitácora completa de JSConf JP 2025: desde passkeys y Qwik hasta tendencias del ecosistema web, desarrollo asistido por IA y las diferencias culturales entre eventos tech en Japón y España."
categories: [bitacora]
---

Hoy he vivido una de esas jornadas que mezclan contenido técnico, diferencias culturales y pequeños descubrimientos que solo se aprecian cuando estás dentro del ambiente de una conferencia internacional. Esta es mi bitácora del día, tal y como lo fui anotando.

⸻

## Sábado: Pre-evento en Google Tokyo

El sábado anterior fue el turno del pre-evento, una cita previa a la conferencia principal que merecía su propia atención. Fue celebrado en las oficinas de Google en Tokio, ubicadas en una planta tan alta que la vista desde las ventanas era uno de esos panoramas que solo existen en grandes ciudades japonesas.

Al llegar, recibimos las credenciales típicas de edificios de esta escala: tarjetas magnéticas que controlan el acceso a las zonas permitidas. Subimos en ascensor y nos encontramos con una distribución particularmente interesante del espacio.

La sala estaba organizada alrededor de una zona central con comida y bebidas variadas, flanqueada por dos áreas bien diferenciadas: mesas y sillas en el lado derecho, y el lado izquierdo donde se proyectaban las lightning talks en dos televisores —una en cada extremo de la sala- esta división no era casual.

Después de la primera sesión de charlas, el organizador explicó la filosofía del evento: la idea era que los asistentes estuviesen comiendo, bebiendo y conversando mientras alguien presentaba, sin necesidad de prestar el 100% de atención. Sin embargo, notó que algo no funcionaba como se esperaba en esa primera ronda. Así que replanteó la dinámica: el lado izquierdo, donde estaba el ponente, prestaría más atención a las presentaciones. El lado derecho apagaría su televisor para que quienes quisieran permanecer allí pudiesen seguir conversando sin interrupciones.

Las charlas se alternaban entre inglés y japonés. Junto a Airán Sánchez asistimos a varias de ellas, aunque pasamos buena parte del tiempo conversando con miembros de la organización y otros asistentes: algunos procedentes de Singapur, otros viviendo en Japón siendo originarios de Argentina. Las historias que compartían revelaban esa característica peculiar de los eventos tech internacionales: encuentros breves pero intensos entre personas de contextos completamente distintos.

La forma en que estaba organizado el pre-evento resultaba curiosa, diferente a cualquier cosa que hubiese visto antes. No era el típico networking event, ni tampoco una conferencia formal. Era algo intermedio, algo más orgánico.

⸻

## Domingo: Evento principal

10:10 — Arranque del día: Passwordless in Production

La mañana comenzó con una sesión centrada en las passkeys y la transición hacia la autenticación sin contraseñas. Se explicó cómo las credenciales [WebAuthn](https://webauthn.io/) están ligadas al dominio mediante el RPID, cómo se genera el challenge en cada inicio de sesión y cómo los dispositivos almacenan la clave privada para firmarlo.

También se mostraron cifras recientes de adopción, el impacto del Conditional UI en la experiencia de login y los mecanismos de recuperación disponibles (email verificado, SMS OTP y MyNumberCard). Hubo ejemplos de limitaciones técnicas en navegadores y se insistió en la importancia de cachear correctamente las opciones antes de invocar la API de credenciales.

⸻

10:20 — ECMA-402: El universo de la internacionalización en JavaScript

La siguiente charla fue un repaso estructurado del ecosistema i18n: Unicode, CLDR, ICU y [ECMA-402](https://tc39.es/ecma402/) como capa final. Se presentaron las operaciones más comunes (fechas, números, unidades, plurales, segmentación, colación) y varias novedades que están llegando al estándar.

Entre ellas: Temporal API (con lanzamiento previsto en 2026), DurationFormat, LocaleInfo y nuevas unidades para energía. También se mencionaron propuestas en estado inicial como Intl.MessageFormat y la existencia de ICU4X como alternativa ligera.

⸻

10:30 — Qwik bajo el microscopio

Después vino una explicación técnica del funcionamiento interno de [Qwik](https://qwik.dev/). Se desglosaron sus mecanismos de delayed execution y resumability, la serialización del estado dentro del HTML y la ausencia de hidratación tradicional.

También se presentaron sus cuatro componentes internos (serializer, optimizer, loader y proxy) y cómo trabaja con rutas, loaders, actions y validación con Zoddy. La demostración incluyó tiempos de carga de aproximadamente 10 ms en recursos estáticos.

⸻

10:40 — Preguntar como acto central de una conferencia

En esta charla se explicó el papel que tienen las preguntas dentro del proceso de aprendizaje en un evento: permiten detectar qué se entiende y qué no, y sirven como una revisión en vivo del contenido para el ponente.

Se dieron algunos datos prácticos sobre la conferencia: predominio de portátiles Mac, disponibilidad de café sin coste adicional y las tallas de camisetas que se agotan antes. El ponente contó un experimento personal del año anterior, donde preparó 10 preguntas para 10 ponentes; todos respondieron positivamente.

⸻

11:00 — Tres décadas de JavaScript

El cierre de la mañana fue un recorrido histórico por los 30 años de JavaScript, desde 1995 hasta la actualidad, mencionando los hitos que marcaron su estandarización y los cambios que han definido la evolución del lenguaje.

⸻

Pausa para comer — Un contraste inesperado

Durante la pausa nos acercamos a los stands de las empresas. La experiencia fue muy distinta a lo que suelo ver en eventos en España:
las empresas no se centraban en captar talento, sino en presentar soluciones y productos ya construidos.

Cuando mis compañeros preguntaron por ofertas de empleo:

- Las respuestas eran vagas.
- Algunas personas no sabían dónde encontrar la sección de empleo en su web.
- En varios casos, simplemente dijeron que no tenían posiciones abiertas.

Después de esa vuelta rápida, salimos a comer fuera en el primer sitio que encontramos y regresamos cuanto antes para no perder el inicio del bloque de tarde.

⸻

14:50 — El estado actual del ecosistema web

La primera sesión tras la comida fue una presentación de datos procedentes de encuestas como [State of JS](https://stateofjs.com/), CSS o HTML, que en conjunto superan las 45.000 respuestas. Se mostraron tendencias en uso, satisfacción e interés de tecnologías del ecosistema:

- React continúa como framework más utilizado; Vue supera a Angular.
- Solid aparece como la herramienta con mayor satisfacción.
- Next.js es el meta-framework dominante, mientras que Astro lidera en satisfacción.
- En backend, herramientas recientes como Hono, Nitro y Elijah muestran altos niveles de adopción y valoración.
- Vite continúa creciendo acercándose a Webpack en uso y superándolo en satisfacción.
- TypeScript es usado por el 84% de desarrolladores y encabeza las peticiones de funcionalidades que gustaría ver integradas en JavaScript.

El análisis se centró en funnels de adopción, evolución año a año y previsiones basadas en los datos.

⸻

15:30 — Cómo se construye un backend con TypeScript y desarrollo asistido por IA

Rodrigo Ramírez presentó la arquitectura del backend de Newt.net. Explicó cómo migraron desde un sistema acoplado hacia un monorepo estructurado en:

- apps/ para la capa de presentación y GraphQL.
- packages/ divididos por dominio, con capas domain, application, infra y presentation.

Se describió el uso de contratos (validaciones, modelos, esquemas GraphQL, Schema Prisma) para mantener alineados cliente, servidor y base de datos. También se mencionó que más del 50% del código actual está generado por IA, y que algunas tareas internas ya superan el 90%.

El flujo de desarrollo se basa en que los agentes de IA generen código siguiendo reglas y contratos estrictos, lo que permite detectar errores antes de integrarlo.

⸻

Cierre del día

El domingo dejó una combinación de tecnología, metodología y datos que ofrecieron una mirada amplia al ecosistema JavaScript actual: seguridad sin contraseñas, internacionalización, nuevas arquitecturas de ejecución, relevancia de las preguntas en los eventos, tendencias globales y una aplicación práctica de IA en un backend moderno.

⸻

## Recursos

- [JSConf JP 2025](https://jsconf.jp/2025/)
- [WebAuthn.io](https://webauthn.io/)
- [ECMA-402 Internationalization API](https://tc39.es/ecma402/)
- [Qwik Framework](https://qwik.dev/)
- [State of JS](https://stateofjs.com/)
