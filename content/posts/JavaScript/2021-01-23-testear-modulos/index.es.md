---
title: "Testear módulos"
slug: "javascript/testear-modulos"
date: 2021-01-23T09:01:14.381Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
---

  Vamos a probar el modulo que hemos sacado en la parte anterior del juego
  saberganar.

```javaScript
const saberganarQuestionNavigator = require('../src/questionNavigator');

describe('question navigator', function () {
  let questions,
      navigator;

  beforeEach(function () {
      questions = [
          {
              id: 1,
              question: "¿De que colo es el caballo blanco de santiago?",
              answers: [
                  {id: 0, answer: "Es un unicornio, no un caballo", isCorrect: false, idQuestion: 1},
                  {id: 1, answer: "Verde", isCorrect: false, idQuestion: 1},
                  {id: 2, answer: "Blanco", isCorrect: true, idQuestion: 1}
              ]
          },
          {
              id: 2,
              question: "¿Como sale un perro de un tanque de agua?",
              answers: [
                  {id: 0, answer: "Por la escalera", isCorrect: false, idQuestion: 2},
                  {id: 1, answer: "Mojado", isCorrect: true, idQuestion: 2},
                  {id: 2, answer: "Verde, los perros si se mojan se ponen verdes", isCorrect: false, idQuestion: 2}
              ]
          },
          {
              id: 3,
              question: "¿Que fue antes el huevo o la gallina?",
              answers: [
                  {id: 0, answer: "Huevo", isCorrect: false, idQuestion: 3},
                  {id: 1, answer: "Gallina", isCorrect: false, idQuestion: 3},
              ]
          }
      ];
      navigator = saberganarQuestionNavigator.questionNavigator(questions);
  });

  it('should get a question', function () {
      expect(navigator.getQuestion()).toBe(questions[0]);
  });

  it('should get next question', function () {
      expect(navigator.getQuestion()).toBe(questions[0]);
      navigator.goToNextQuestion();
      expect(navigator.getQuestion()).toBe(questions[1]);
  });

  it('does\'t get out of bound', function () {
      expect(navigator.getQuestion()).toBe(questions[0]);
      navigator.goToNextQuestion();
      navigator.goToNextQuestion();
      navigator.goToNextQuestion();
      navigator.goToNextQuestion();
      navigator.goToNextQuestion();
      expect(navigator.getQuestion()).toBe(questions[2]);
  });
});
```

## Actualizar test de la interfaz

  Para que nuestros test anteriormente hechos sobre la interfaz sigan pasando
  tendremos que actualizarlos con el nuevo módulo.


```javaScript
const pug = require('pug');
const saberganarGame = require('../src/main');
const saberganarQuestionNavigator = require('../src/questionNavigator');

describe("the game", function () {
  let app;

  beforeEach(function () {
      document.body.innerHTML = pug.compileFile('./views/main.pug', null)();
      app = saberganarGame.game(saberganarQuestionNavigator.questionNavigator);
      // app.setServerData(questions);
      app.start();
  });

  it('loads the markup', function () {
      expect(
          document.getElementById('start-button'))
          .not.toBeNull();
  });

  it('should start the game, answer a question and change the score', function () {
      startGame();

      selectAnswer();
      submitAnswer();

      expectScoreToBeDifferentFromTheBeginning();
  });

  it('should start the game, answer a question and change the question', function () {
      startGame();

      let question = document.getElementById('question').textContent;
      selectAnswer();
      submitAnswer();

      expectQuestionAndAnswersToBeDifferentFromPreciousOne(question);
  });

  function startGame() {
      let startButton = document.getElementById('start-button');
      startButton.click();

  }
  function selectAnswer() {
      let answer = document.getElementById('0');
      answer.click();
      expect(answer.checked).toBeTruthy();

  }
  function expectToBeAbleToSendTheAnswer(submitAnswerButton) {
      expect(submitAnswerButton.disabled).toBeFalsy();

  }
  function submitAnswer() {
      let submitAnswerButton = document.getElementById('submit-answer');
      expectToBeAbleToSendTheAnswer(submitAnswerButton);
      submitAnswerButton.click();

  }
  function expectScoreToBeDifferentFromTheBeginning() {
      let score = document.getElementById('scoreUI');
      expect(score.innerHTML).not.toBe('0 puntos');

  }
  function expectQuestionAndAnswersToBeDifferentFromPreciousOne(question) {
      let newQuestion = document.getElementById('question').textContent;
      expect(question).not.toEqual(newQuestion);//TODO: should check only the question not the answers too

  }

});
```

Referencias
--------------------------------------------------------------------------------

* [Video original][original-video]
* [Java Script][javaScript], lenguaje que se usa en los ejemplos.
* _Suite_ de test que uso [Jest][jest]
* Sistema de plantillas [pug]

<!-- All links here -->

[original-video]: https://youtu.be/nvAiL3gKISg
[javaScript]: https://www.javascript.com/
[jest]: https://facebook.github.io/jest/
[pug]: https://pugjs.org/api/getting-started.html

