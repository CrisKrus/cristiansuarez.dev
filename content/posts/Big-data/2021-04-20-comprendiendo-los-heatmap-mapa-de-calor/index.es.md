---
title: "Comprendiendo los heatmap (mapa de calor)"
slug: "comprendiendo-los-heatmap-mapa-de-calor"
date: 2021-04-20T00:00:07.000Z
draft: false
hideLastModified: false
categories: [big data, visualización de datos]
summaryImage: "hetmap-game-sales.png"
---

Este tipo de gráfico, mapa de calor, es muy útil a la hora de comparar valores
numéricos de una relación. Es decir, si por ejemplo tenemos las ventas de
videojuegos clasificadas por plataforma y año como se muestra a continuación

| Plataforma| Año| Ventas|
--- | --- | ---
|Wii|2000|100|
|Wii|2001|150|
|Wii|2002|50|
|DS|2000|98|
|DS|2001|118|
|DS|2002|134|

---

Si esta tabla de datos fuera mucho mayor con cientos de miles de entradas sería bastante complicado hacer una comparación de sus datos con otro tipo de gráficas. Con el mapa de calor podremos hacer un eje de coordenadas como si de un mapa de hundir la flota se tratase. Dónde, en los ejes en lugar de letras y números tengamos el nombre de la plataforma y el año en el que ocurren las ventas.

Y luego dentro de este mapa pondremos los valores que corresponda a cada intersección. La parte interesante viene ahora, este mapa además colorea con un degradado todas las casillas de tal manera que las que tengan un valor mayor sea de un color más intenso y las de menor valor de un tono más claro.

Con esto lo que logramos es ver patrones más fácilmente de momentos en los que han habido muchas ventas.

Te dejo un ejemplo a continuación

![mapa de calor ventas por plataformas.png](hetmap-game-sales.png)

Como puedes ver en la imágen anterior la Play 1 tuvo su pico de ventas en 1998. También podemos ver como entre 2008 y 2012 hubo un gran numero de ventas repartido entre diferentes plataformas.

Para poder crear este tipo de gráficos con la librería [Seaborn](https://seaborn.pydata.org/index.html) en [Python](https://www.python.org/) necesitaremos que los datos que los datos estén formateados de tal manera que las cabeceras sean uno de los ejes y los índices el otro. Estos dos son los únicos datos que pueden no ser numéricos el resto debe de serlo.

El conjunto de datos (*dataset*) que usaremos tendrá la siguiente forma:

|  | 2000| 2001| 2002|
--- | --- | --- | ---
|Wii|100|250|50|
|DS|98|118|2002|

```python
import seaborn as sns

heatmap_data = create_data_frame_with_sales_per_year_and_platforms(data)
ax = sns.heatmap(heatmap_data, annot=True)
```

---

Este ejemplo ha salido de las sesiones que he hecho en directo aprendiendo visualización de datos. Puedes ver las sesiones grabadas [en youtube](https://www.youtube.com/playlist?list=PLZh1qmaTeQ-qvyJ9GOLNEwESIGTQdHAoI) o en directo por [Twitch](https://www.twitch.tv/cristian_suarez_dev) además subo a [github](http://bit.ly/cristian-suarez-github) todo los ejercicios que vamos haciendo y los apuntes.
