---
title: "Guía visual y explicativa para no perderte en el mundo agentic (LangChain4j edition)"
slug: "ia/guia-vocabulario-visual-langchain4j"
date: 2025-09-01T00:00:00.000Z
draft: false
hideLastModified: false
summary: "Glosario visual y funcional de conceptos clave en LangChain4j, con ejemplos y sugerencias para presentaciones y formación."
categories: [ia]
---

## Guía visual y explicativa para no perderte en el mundo agentic (LangChain4j edition)

Esta guía no es un glosario tradicional. Aquí no hay definiciones frías ni orden alfabético. En su lugar, encontrarás conceptos agrupados por afinidad funcional, explicados con ejemplos sencillos y acompañados (donde aplica) de ideas para visuales que podrás usar en presentaciones, documentación o formación.

---

### 🧠 Bloques básicos: lo mínimo para entender una conversación con LLMs

* **Turno (Turn)**: Cada vez que tú hablas y el sistema responde, eso es un turno. Como en el ping-pong: uno tú, uno la máquina.

* **Ventana (Window)**: Es el pedazo del historial reciente que el modelo tiene "en mente" para responderte. Imagina un scroll limitado hacia atrás.

* **Resumen (Summary)**: Si la ventana no alcanza, el sistema hace un resumen de lo anterior para no olvidar lo importante.

![Chat tipo WhatsApp con globos de texto; una lupa sobre los últimos mensajes (ventana) y una caja de notas aparte (resumen)](/images/posts/ia/img.png)

---

### 🤖 ¿Quién manda aquí? Agentes, workflows y routers

* **Workflow**: Ruta fija. Como una receta de cocina paso a paso. Siempre igual.

* **Agentic**: El modelo decide el orden de pasos. No hay receta, solo ingredientes y contexto.

* **Agente (Agent)**: Un entity con memoria, herramientas y objetivos. Piensa y actúa según la situación. El chef que improvisa, pero con experiencia.

* **Router**: El portero que decide si entras por la puerta A (workflow), B (tool), o llamamos al chef (agent).

![Diagrama de flujo: filas de entrada, mostradores (router), distintos caminos con iconos (workflow, agentic, agent).](/images/posts/ia/img_1.png)

---

### 🛠️ Herramientas, funciones y control

* **Tool**: Una función externa que el modelo puede usar. Como darle una calculadora a un asistente.

* **Toolset**: El conjunto de herramientas disponibles en un entorno.

* **Descripción de tool**: Texto que explica para qué sirve, qué necesita y cuándo usarla. Imprescindible para que el LLM no se equivoque.

* **JSON Schema**: Lo que valida que los datos estén bien formados. Como un molde para rellenar correctamente.

![Caja de herramientas etiquetadas, una calculadora, una lupa, un formulario con marcas de validación.](/images/posts/ia/img_2.png)

---

### 🧾 Memoria y estado: lo que el sistema debería recordar

* **Pinned Facts**: Cosas importantes que no deben olvidarse. Ej: idioma del usuario, preferencias, reglas de negocio.

* **Estado estructurado (slots)**: Variables guardadas con nombre y tipo. Ej: `nombre_usuario = "Juan"`

* **TTL (time to live)**: Tiempo que vive un dato antes de borrarse automáticamente.

![Post-it en una pizarra con "Idioma: español", "Usuario: Juan"; reloj de arena sobre un dato para representar el TTL](/images/posts/ia/img_3.png)

---

### ⚙️ Cómo mantener todo bajo control

* **Observabilidad**: Saber qué pasa por dentro. Logs, métricas, trazas. Es como tener cámaras de seguridad en la cocina.

* **Presupuesto de tokens**: Límite de palabras que se pueden usar por interacción. Afecta a coste y rendimiento.

* **Timeouts**: Si algo tarda demasiado, se cancela. Evita que el sistema se quede "pensando para siempre".

![Panel de control con medidores, un contador de tokens y un cronómetro con un símbolo de alerta](/images/posts/ia/img_4.png)

---

### 🤯 Patrón ReAct: cómo decide un modelo qué hacer

* **ReAct (Reason + Act)**: El modelo piensa, elige una tool, ejecuta, y repite hasta tener una respuesta final.

---

### Preguntas frecuentes (FAQ express)

* **¿Un agente y un agente conversacional son lo mismo?**

  * A veces sí, pero no necesariamente. Un agente puede ejecutar lógica sin tener interfaz conversacional.

* **¿Cuándo usar agentic y no workflow?**

  * Cuando no sabes a priori qué pasos serán necesarios y el coste de decidirlo al vuelo está justificado.

* **¿Necesito pinned facts si ya tengo resumen?**

  * Sí, si hay cosas que no deben perderse ni resumirse. Son conceptos distintos.

---

**Conclusión**

Trabajar con LangChain4j y LLMs implica aprender un nuevo lenguaje: no solo el de los modelos, sino el de sus patrones de diseño. Esta guía busca hacer ese vocabulario más cercano, visual y aplicable.
