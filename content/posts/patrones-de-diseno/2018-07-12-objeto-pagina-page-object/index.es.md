---
title: "Objeto Página (pageObject)"
slug: "patrones-de-diseño/objeto-pagina-page-object"
date: 2018-07-11T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [patrones de diseño]
---

Objeto Página (*pageObject*)
================================================================================

  Cuando te encuentras haciendo test para una aplicación que no tiene módulos
  testables y tienes que hacerlo contra la interfaz directamente, es muy
  probable que te encuentres ante esta situación:

```javaScript
// scoreBoard.spec.js

// [...]

it('should save score after answer a question', function () {
    startGame();
    selectOption(0);
    submitAnswer();
    addPlayerName(players[1]);
    saveScore();
    expectScoreToContainsMinusOne();
});

function startGame() {
    let startButton = document.getElementById('start-button');
    startButton.click();
}

function selectOption(optionId) {
    let answer = document.getElementById(optionId);
    answer.click();
    expect(answer.checked).toBeTruthy();
}

// [...]
```

  Y luego en otro test lo siguiente:
```javaScript
// game.spec.js

// [...]

it('should start the game, answer a question and change the score', function () {
    startGame();

    selectOption(0);
    submitAnswer();

    expectScoreToBeDifferentFromTheBeginning();
});

function startGame() {
    let startButton = document.getElementById('start-button');
    startButton.click();
}

function selectOption(optionId) {
    let answer = document.getElementById(optionId);
    answer.click();
    expect(answer.checked).toBeTruthy();
}

// [...]
```

  Estámos repitiendo los mismos métodos `startGame()` y `selectOption()` y eso
  es algo que no nos gusta en el [*código limpio*][clean-code]. Por ello es que
  existe el __PageObject model__. Este está formado por funciones que
  trabajan directamente con la interfaz. De esta manera podemos usar todos las
  funciones manera unificada con el mismo comportamiento.

Extraer al `PageObject`
--------------------------------------------------------------------------------

  Creamos nuestro nuevo fichero donde guardar este modulo que hemos decidido
  extraer y ponemos las funcionalidades que queremos.

```javaScript
// pageObject.js

export default function pageObject() {

    function startGame() {
        let startButton = document.getElementById('start-button');
        startButton.click();
    }

    function selectOption(optionId) {
        let answer = document.getElementById(optionId);
        answer.click();
        expect(answer.checked).toBeTruthy();
    }

    // [...]

    return {
        startGame,
        selectOption
    };
};
```

  Ahora solo tendremos que importarlo donde lo usábamos anteriormente

```javaScript
// game.spec.js
import gamePageObject from '../src/pageObject';

// [...]

let pageObject = gamepageObject();

it('should start the game, answer a question and change the score', function () {
    pageObject.startGame();

    pageObject.selectOption(0);
    submitAnswer();

    expectScoreToBeDifferentFromTheBeginning();
});

function startGame() {
    let startButton = document.getElementById('start-button');
    startButton.click();
}

function selectOption(optionId) {
    let answer = document.getElementById(optionId);
    answer.click();
    expect(answer.checked).toBeTruthy();
}

// [...]
```

  De igual forma podemos sacar `submitAnswer()` si lo vemos necesario.

References
--------------------------------------------------------------------------------

* [Martin Fowler post][Martin Fowler post]
* Publicaciones mías sobre [Código limpio][clean-code]

<!-- All links here -->

[Martin Fowler post]: https://martinfowler.com/bliki/PageObject.html
[clean-code]: https://criskrus.wordpress.com/tag/codigo-limpio/

