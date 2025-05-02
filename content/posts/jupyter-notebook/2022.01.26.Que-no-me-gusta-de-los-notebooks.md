---
title: "Que puede mejorar de los Jupyter Notebooks"
slug: "que-puede-mejorar-de-los-jupyter-notebooks"
date: 2022-01-26T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [jupyter notebook]
---

Últimamente, a Medea que voy avanzando en el mundo del big data, me voy alejando del inicio del sistema como ingeniero de datos y me acerco un poco más a la parte de análisis de datos he visto que gusta bastante explorar datos e incluso desarrollar ciertas partes con Jupyter Notebooks. Esto, persé, no es un problema soy defensor de los Notebooks bajo situaciones concretas.

Antes de nada, te cuento muy resumidamente como funciona un Notebook. Esta herramienta te permite crear un archivo en el que puedes mezclar código de Python y Markdown. Además, todo lo que escribes en él lo puedes separar por **bloques**. Un bloque es un trozo de código o markdown el cual puedes ejecutar de manera independiente. ¿Esto que implica?

Esto significa, que aunque veas los bloques de manera secuencial, siguiendo un orden tú puedes ejecutarlos de manera manual en el orden que prefieras. Supongamos que tenemos el siguiente ejemplo:

```python
# Bloque 1
my_number = 5

# Bloque 2
my_number = my_number + 5

# Bloque 3
my_number = my_number - 5

# Bloque 4
print(my_number)
```

Si esto fuera un script de Python se ejecutaría todo de una vez y el resultado sería pintar el número 5 pero, en un Notebook si tenemos separado por bloques estos trozos de código podremos seguir la secuencia que queramos, incluso repetir la ejecución d una de ellas.

Podríamos perfectamente ejecutar los bloque de la siguiente forma: 1, 2, 2, 4 y obtener como resultado 15 y tendría sentido. Siempre hablando que estas ejecuciones las hacemos de manera manual.

Es por ello que esta herramienta me resulta muy útil cuando estoy explorando los datos porque puedo tener un primer bloque dónde cargo los datos, muestro información genérica para conocer mejor con que estoy trabajando y a partir de ahí comenzar a jugar con los datos. Puedo ir creando otros bloques dónde hago transformaciones específicas, destruyo los datos sin problemas para más tarde, si lo necesito, volver a cargar la información original sin tener que esperar a ejecutar todo porque aún está en memoria la carga inicial.

Esto resulta de gran ayuda y me ahorra mucho tiempo porque si toda esta parte de exploración y transformación de datos la tengo que hacer con scripts de Python tendría que esperar todo el rato a que se ejecute una y otra vez todas las líneas de código. En cambio, con un notebook ejecutó solamente lo que necesito, tantas veces como sea necesario y puedo incluso modificar un bloque y volver a ejecutarlo.

Esto presenta algunos problemas, bajo mi punto de vista. El primero es que puedes no tener claro que valor tiene una variable ahora mismo porque puedes haber hecho cualquier cosa con ella en otros bloques durante la sesión en la que estás ahora mismo. Es por esto que me gusta siempre antes de dar por cerrada una sesión hacer dos cosas: reiniciar el kernel (eliminar todo lo que tenemos en memoria en la sesión actual) y ejecutar los bloques desde el primero al último para estar seguro que el resultado que obtengo no depende de una transformación aleatoria que he hecho hace un rato y ya he borrado.

Esto que puede sonar tan raro o complejo no lo es para nada. Los Jupyter Notebooks tienen un editor propio: JupyterLab con el que puedes hacer estas dos acciones pulsando dos botones de forma cómoda y rápida. Otra forma es configurar tu editor de confianza con los plugins correspondientes y servidor para poder ejecutar todo esto.

Y aquí es dónde veo el primer problema, estos editores no he visto que tengan la potencia que tienen normalmente para poder hacer refactors de código o poder hacer test unitarios del código que hemos generado. Si usas Jupyter Lab, salvo que instales plugins concretos no auto completa los nombres de variables o no te hace sugerencias de código sobre la librería que estés usando.

En resumen, es una herramienta muy potente y útil que me gusta mucho pero con la que tenemos que tener cuidado porque puede volverse caótica con facilidad y ser luego un dolor a la hora de mantener ese código.
