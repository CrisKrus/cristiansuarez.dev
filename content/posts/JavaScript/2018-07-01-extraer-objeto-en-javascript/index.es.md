---
title: "Extraer objeto en JavaScript"
slug: "javascript/extraer-objeto-en-javascript"
date: 2018-06-30T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
---


  Vamos a ver como extraer un objeto en [JavaScript] en su versión
  de [ECMAScript 5]. Partimos de un fichero donde tenemos todas las
  funcionalidades y vemos que una de ellas es claramente un objeto que podemos
  extraer.

  [JavaScript]: https://www.javascript.com/

  [ECMAScript 5]:
  https://developer.mozilla.org/es/docs/Web/JavaScript/Novedades_en_JavaScript/ECMAScript_5_support_in_Mozilla

```javaScript
// main.js
function application(){

  // {...}

  let actualQuestionIndex = 0;
  function isThereMoreQuestions() {
      return actualQuestionIndex < questions.length -1;
  }
  function getQuestion() {
      return questions[actualQuestionIndex];
  }
  function goToNextQuestion() {
      if (isThereMoreQuestions()) {
          actualQuestionIndex++;
      }
  }
  function resetQuestions() {
      actualQuestionIndex = 0;
  }

  // {...}
}
```

  Como podemos ver esta parte de nuestro código se encarga de la navegación en
  nuestras preguntas, por ello vamos a sacarlo a un nuevo fichero. Haciendo
  que nuestra aplicación sea más modular y acepte cualquier tipo de navegación
  que cumpla estos requisitos mínimos.

```javaScript
//questionNavigator.js
var saberganar = saberganar || {};
saberganar.questionNavigator = function (questions){
  let actualQuestionIndex = 0;
  function isThereMoreQuestions() {
      return actualQuestionIndex < questions.length -1;
  }
  function getQuestion() {
      return questions[actualQuestionIndex];
  }
  function goToNextQuestion() {
      if (isThereMoreQuestions()) {
          actualQuestionIndex++;
      }
  }
  function resetQuestions() {
      actualQuestionIndex = 0;
  }

  return {
      isThereMoreQuestions,
      getNextQuestion
  };
};    
```

```javaScript
//main.js
var saberganar = saberganar || {};

saberganar.game = function(questionNavigator){

  // {...}

  let question = questionNavigator.getQuestion();

  // {...}
}
```

  De esta forma también evitamos ensuciar el namespace de nuestra aplicación
  dejando por separado cada módulo `namespace.game` y
  `namespace.questionNavigator`

Referencias
--------------------------------------------------------------------------------

* [Video original][original-video]

<!-- All links here -->

[original-video]: https://youtu.be/nvAiL3gKISg

