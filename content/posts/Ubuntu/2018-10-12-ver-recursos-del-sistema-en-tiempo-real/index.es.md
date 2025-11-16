---
title: "Ver recursos del sistema en tiempo real"
slug: "ubuntu/ver-recursos-del-sistema-en-tiempo-real"
date: 2018-10-11T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ubuntu]
tags: [linux, ubuntu, sistema, monitorización]
---

<!-- TODO screenshots -->
  Instalar `indicator-multiload`

```bash
sudo apt install indicator-multiload
```

  Iniciar el programa. Por defecto, te mostrara un grafico en la barra superior
  del sistema. Si pulsamos sobre él y nos dirigimos a preferencias podremos
  seleccionar que quiere que se muestre en el gráfico, personalmente no uso esta
  parte. Pero si nos vamos a `Indicator items...` aqui esta la de lo que se esta
  mostrando en mi barra.

  -- CAPTURA DEL ESCRITORIO INDICANDO QUE BARRA HABLO

  Si nos fijamos hay varios elementos de ejemplo. El que se muestra en la barra
  es el primero de todos. Y este es el que editaremos a nuestro gusto.

  -- CAPTURA PROGRAMA

  En mi caso quiero que se muestre todo CPU, RAM, descarga y subudaen, es por
  eso que lo edito y pongo lo siguiente

```
🐐 $(percent(cpu.inuse)) | $(size(mem.user)) | $(speed(net.down))⬇ $(speed(net.up))⬆
```

  Con esto se verá `🐐 9% | Men 5,5 GB | Net 12kb/s⬇15kb/s⬆` en todo momento en
  nuestra barra del sistema y podremos saber como se encuentran nuestros
  recursos.

  Toda la información de como configurar e instalar lo he sacado de este [post]

  [post]: https://askubuntu.com/questions/406204/how-can-i-add-the-current-cpu-usage-to-my-menu-bar-as-a-percentage#866337

