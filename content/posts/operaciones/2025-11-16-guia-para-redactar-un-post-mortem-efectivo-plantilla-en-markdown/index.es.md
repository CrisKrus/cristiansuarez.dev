---
title: "Guía para redactar un post-mortem efectivo + Plantilla en Markdown"
slug: "operaciones/guia-para-redactar-un-post-mortem-efectivo-plantilla-en-markdown"
date: 2025-10-16T00:00:00.000Z
draft: false
hideLastModified: false
summary: "Guía práctica paso a paso para redactar post-mortems efectivos con una plantilla profesional en Markdown lista para usar. Incluye mejores prácticas y técnicas de análisis de causa raíz."
categories: [operaciones]
tags: [post-mortem, plantilla, guía, incidentes, rca]
---

La calidad del post-mortem determina la utilidad del conocimiento que genera. A continuación, una guía práctica para elaborarlo con claridad y precisión.

1. Empieza con un resumen objetivo

Debe describir qué ocurrió, cuándo ocurrió y cuál fue su impacto. Debe ser breve, factual y sin interpretaciones.

2. Construye una línea temporal verificable

Incluye eventos clave desde la aparición del primer síntoma hasta la resolución final, con marcas de tiempo claras. Esto revela patrones, retrasos y decisiones relevantes.

3. Identifica la causa raíz

La causa raíz no es el último error visible, sino el conjunto de condiciones técnicas y organizativas que permitieron que ocurriera el incidente.
Técnicas como los 5 Porqués o diagramas de Ishikawa pueden ayudar.

“La causa raíz explica el porqué profundo del incidente, no solo el síntoma que lo detonó.”

4. Documenta factores contribuyentes

Factores que, sin ser la causa directa, empeoraron o facilitaron el incidente: alertas deficientes, falta de pruebas, procesos ambiguos, complejidad accidental, etc.

5. Registra acciones correctivas inmediatas

Documenta lo que se hizo durante el incidente para restaurar el servicio y si las soluciones fueron temporales o definitivas.

6. Define acciones preventivas con responsables

Todo post-mortem debe generar un plan de acción claro: tareas, responsables y fechas estimadas.
Sin esto, el documento pierde su propósito transformador.

7. Extrae aprendizajes clave

Resume qué ha aprendido el equipo y qué cambios se derivarán en procesos, herramientas o prácticas de ingeniería.

8. Escribe con claridad y neutralidad

Evita suposiciones, juicios personales, explicaciones vagas y lenguaje emocional.
La claridad es esencial para que cualquier lector pueda comprender el incidente sin haber participado en él.

## Plantilla de Post-Mortem (Markdown)

```md
# Post-Mortem del Incidente: [Título]

## 1. Resumen Ejecutivo
**Fecha:**  
**Duración:**  
**Impacto:**  
**Sistemas afectados:**  
**Severidad:**  

Descripción breve y objetiva del incidente, impacto y estado final.

---

## 2. Línea Temporal del Incidente
| Hora (UTC) | Evento | Acción/Tarea |
|------------|--------|--------------|
| 09:14 | Primera alerta detectada | - |
| 09:20 | Se confirma degradación del servicio | - |
| ... | ... | ... |
| 10:02 | Servicio completamente restaurado | - |

---

## 3. Impacto Detallado
- Usuarios afectados:  
- Funcionalidades interrumpidas:  
- Degradación del rendimiento:  
- Repercusiones externas (si aplican):  

---

## 4. Causa Raíz
Descripción del mecanismo o condiciones que permitieron que ocurriera el incidente.  
Pueden incluirse técnicas como “5 Why’s” o diagramas de causa-efecto.

---

## 5. Factores Contribuyentes
-  
-  
-  

---

## 6. Acciones Correctivas Inmediatas
Qué se hizo durante el incidente para restaurar el servicio.  
Indicar si son soluciones temporales o definitivas.

---

## 7. Acciones Preventivas y Plan de Mejora
| Acción | Responsable | Fecha objetivo | Estado |
|--------|-------------|----------------|--------|
| | | | |
| | | | |

---

## 8. Lecciones Aprendidas
-  
-  
-  

---

## 9. Anexos (opcional)
- Logs relevantes  
- Capturas de pantalla  
- Diagramas  
- Métricas o gráficos  
```
