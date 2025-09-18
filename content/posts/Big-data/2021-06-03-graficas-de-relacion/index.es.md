---
title: "Gráficas de relación"
slug: "big-data/graficas-de-relacion"
date: 2021-06-03T00:00:00.000Z
draft: false
hideLastModified: false
categories: [big data, visualización de datos]
summaryImage: "resources/untitled.png"
---

Cuando nos enfrentamos a un conjunto de datos nuestro cerebro intenta crear relaciones entre los distintos conjuntos. Esto es normal, ya que como seres humanos que somos, siempre intentamos buscar una relación, es la forma que tenemos de asociar acciones. Si bebo agua me quita la sed, a mayor número de ventas de videojuegos en una consola más popular es ¿o no?

Estas relaciones que buscamos inconscientemente pueden tener o no sentido y es ahí dónde entra el papel del analista de datos. Debe ser quien determine si la una relación entre ciertos conjuntos de datos tiene sentido o no. Hoy nos centraremos en como podemos facilitarnos la vida para poder ver estas relaciones gracias a una serie de gráficos pensados para esto, **relacionar datos.**

## Gráfico de barras (barplot)

Este gráfico presenta su fuerte cuando se trata de agrupar por valores categóricos y comparar sus valores numéricos como puede ser, ventas de juegos por categorías de los mismos.

![Untitled.png](/images/posts/big-data/untitled.png)

El gráfico anterior parece sencillo de hacer, pero si no te percatas de algunas características puedes caer en ciertos errores típicos.

1. **El gráfico está ordenado**. Con este tipo de gráficos solemos buscar comparar entre las categorías, por eso es mejor dar los datos ordenados, para facilitar esta comparación a la vista.
2. **Empieza desde cero**. Aunque parezca obvio es fácil ignorar los valores cuando todas las barras son mayores de 200, por ejemplo. Debe de partir desde cero siempre.
3. **Colores con sentido**. En este caso buscamos resaltar como disminuye el valor entre las diferentes islas, por esto todas las barras tienen un mismo tono verde más o menos intenso. Si buscamos resaltar ciertos valores es interesante darle un color más potente a estos y dejar el resto de datos con colores más apagados, por el mismo motivo de antes, facilitar al usuario obtener la información que busca.
4. **Incluir anotaciones de valores**. Como podemos ver en el ejemplo cada barra tiene su valor exacto. Esto puede resultar útil sobre todo, cuando dos de ellas están prácticamente en el mismo punto y difícilmente podemos ver la diferencia o simplemente este valor nos es útil, que también puede darse el caso.
5. **Voltear el gráfico si son muchos valores**. Existe un caso en el que voltear el gráfico tiene sentido, cuando tenemos tantos valores por los que clasificar que se solaparían entre sí. En estos casos es casi obligatorio cambiar la posición de los valores como mostramos a continuación.

![Untitled1.png](/images/posts/big-data/untitled-1.png)

## Gráfico de puntos (Scatter plot)

En este caso el gráfico de puntos es más interesante si nos encontramos con dos variables de tipo numérico a diferencia del caso anterior dónde uno de los valores a comparar era de tipo categórico. Como todos los gráficos de este artículo será de utilidad a la hora de comprobar relaciones entre datos de nuestro conjunto. Por ejemplo, podemos ver si existe una relación entre la cantidad de accidentes de tráfico y la velocidad a la que iba el vehículo.

![Untitled-2.png](/images/posts/big-data/untitled-2.png)

Un punto a destacar interesante de este tipo de gráficos es que **nos permite añadir una tercera variable categórica** a tener en cuenta.

Por ejemplo, si queremos comprobar si existe relación entre el peso, la altura y el género de un bebé recién nacido podremos hacerlo de la siguiente forma.

![Untitled-3.png](/images/posts/big-data/untitled-3.png)

Como podemos ver estas gráficas **nos ayudan a ver una correlación entre los datos**, pero tenemos que tener cuidado porque nuestras interpretaciones pueden estar equivocadas. Podemos estar viendo una relación clara que está ahí por causa de otro campo de nuestros datos.

Por ejemplo, si vemos una relación entre el año y el número de crímenes en una población. En esta relación se ve como claramente cuando avanzamos en el tiempo más crímenes ocurren y podríamos concluir que con el tiempo las personas se vuelven más propensas al crimen, pero en realidad este aumento está relacionado con la población que aumenta. Es decir cuanta más población la probabilidad de que ocurra un crimen es mayor y no tiene que ver el tiempo en esto. Es por ello que tenemos que cuidar y hacer un análisis completo de los datos.

> La correlación no implica causa

En este tipo de gráficos puede ser de gran ayuda añadir una **línea de tendencias** para dejar más claro hacia donde va la relación del conjunto.

### Problemática 🤦‍♂️

Las gráficas de puntos presentan una problemática que por suerte tiene varias soluciones, el **overplotting.** Este término indica que podemos estar superponiendo puntos sin darnos cuenta. Y si nos paramos a pensarlo tiene sentido.

En el ejemplo anterior de los bebés que han nacido con cierto peso y altura si nos fijamos los puntos son más grandes que en el primer caso y **son semitransparentes.** Con este detalle podemos ver si hay una aglomeración en un punto de la gráfica, ya que se verá de un color más intenso, como ocurre en el punto 58 del eje de las equis.

Otra opción es darle un **tamaño distinto** a los puntos en función de las repeticiones que tenga, por ejemplo.

![Untitled-4.png](/images/posts/big-data/untitled-4.png)

O un **degradado** de los mismos.

![Untitled-5.png](/images/posts/big-data/untitled-5.png)

Aunque llegados a este punto puede que nos interese más usar un [mapa de calor 👀](https://criskrus.com/blog/comprendiendo-los-heatmap-mapa-de-calor/)

De igual forma, si el valor exacto no nos es tan importante como la relación en sí, podemos aplicar un desplazamiento mínimo a los puntos para que pueda verse mejor la densidad. Esto es un tipo de gráfico especial, el swarm plot.

### Swarm plot

Este último tipo de gráficos resulta de gran utilidad cuando queremos tener un gráfico de puntos, pero **uno de nuestros ejes no es numérico** como por ejemplo, la cuenta total de las mesas de un restaurante según el día de la semana.

![Untitled-6.png](/images/posts/big-data/untitled-6.png)

Si no aplicamos **jitter** nos queda de esta forma, el jitter no es más que la separación de la que hablábamos antes. Aplicando esta separación quedaría de la siguiente forma.

![Untitled-7.png](/images/posts/big-data/untitled-7.png)

## Recursos

Para escribir este artículo he consultado muchos artículos y recursos dispersos, pero de los más interesantes que he encontrado han sido precisamente los de *seaborn*, la librería más conocida en Python para esto.

- [Barplot](https://seaborn.pydata.org/generated/seaborn.barplot.html)
- [Scatterplot](https://seaborn.pydata.org/generated/seaborn.scatterplot.html)
- [Swarmplot](http://seaborn.pydata.org/generated/seaborn.swarmplot.html?highlight=swarmplot#seaborn.swarmplot)
- [Plotting with categorial data](https://seaborn.pydata.org/tutorial/categorical.html#categorical-tutorial)
- [Visualizing statistical relationships](https://seaborn.pydata.org/tutorial/relational.html#relational-tutorial)
