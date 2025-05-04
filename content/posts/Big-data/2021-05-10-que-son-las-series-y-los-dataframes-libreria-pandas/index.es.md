---
title: "¿Qué son las series y los dataframes? Librería Pandas"
slug: "big-data/que-son-las-series-y-los-dataframes-libreria-pandas"
date: 2021-05-10T00:00:00.000Z
draft: false
hideLastModified: false
categories: [big data]
summaryImage: "summary.png"
---

[Pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) es la librería más usada en el mundo del big data si trabajamos con Python. Esta librería tiene unas entidades propias para gestionar los datos las cuales son similares a las que ya existen en el lenguaje. Esto me ha llamado la atención y es por ello que he investigado cuales son las principales diferencias entre las listas de una y dos dimensiones respecto a las series y dataframes.

## Listas y series

Por orden de complejidad lo primero que veremos son las listas de python (arrays) y las [series](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.html) provenientes de pandas.

Las listas en python es un objeto el cual contiene cualquier tipo de dato dentro en un orden. Como su nombre indica tenemos una lista de elementos de la siguiente forma:

```python
lista = [0, 1, 'dos', 'tres', 12]
```

Como has podido observar esta lista no tiene porque ser de elementos de un mismo tipo. En el ejemplo se puede ver como mezclamos números enteros y cadenas de texto. Esta es la primera de las diferencias con las series, en estas últimas los elementos que contienen han de ser siempre del  mismo tipo.

Esta es una de sus características principales debido a que una serie se puede considerar como una columna de un conjunto de datos la cual siempre ha de ser del mismo tipo. Por ejemplo, si consideramos la columna nombre en un conjunto de datos esta siempre ha de ser una cadena de texto.

Además de esto, las series tienen un índice el cual puede ser no numérico y lo podremos definir explícitamente.

```python
d = {'a': 1, 'b': 2, 'c': 3}
ser = pd.Series(data=d, index=['a', 'b', 'c'])
ser
# a   1
# b   2
# c   3
# dtype: int64
```

Como vemos en este ejemplo definimos un mapa `d` el cual usaremos para crear nuestra serie y luego le indicaremos cuales serán los índices del resultado. De esta forma podremos acceder a los datos de la serie de forma más "cómoda" con el nombre que le hemos dado a los índices. En el caso de las listas nativas de Python estos índices van definidos por el orden en el que se encuentran partiendo desde cero. Esto mismo nos pasará en las series si no definimos índices.

## Listas de dos dimensiones y dataframes

Una vez hemos comprendido en el apartado anterior las diferencias entre listas y series podremos ver con mayor facilidad en que difieren las listas de dos dimensiones y los dataframe ya que, estos son un conjunto de los anteriores.

Al igual que en el caso ya visto, una lista de dos dimensiones nativa de Python puede contener cualquer tipo de dato en su interior: números enteros, cadenas de texto ¡o incluso otras listas! sin embargo, un [data frame](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html) dentro contiene únicamente series. Por esta razón, los datos dentro de un data frame tienen un tipo por cada columna (serie)

```python
d = {'col1': [1, 2], 'col2': [3, 4]}
df = pd.DataFrame(data=d)
df
#    col1  col2
# 0     1     3
# 1     2     4
df.dtypes
# col1    int64
# col2    int64
# dtype: object
```
