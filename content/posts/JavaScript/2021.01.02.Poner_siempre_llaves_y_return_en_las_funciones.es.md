---
title: "Poner siempre llaves y return en las funciones"
slug: "poner-siempre-llaves-y-return-en-las-funciones"
date: 2021-01-02T18:24:26.134Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
---

Ejemplo sobre porque es relevante poner las llaves y el return en javascript cuando definimos una función.

```js
// returns: undefined
// explanation: an empty block with an implicit return
((name) => {})() 

// returns: 'Hi Jess'
// explanation: no block means implicit return
((name) => 'Hi ' + name)('Jess')

// returns: undefined
// explanation: explicit return required inside block, but is missing.
((name) => {'Hi ' + name})('Jess')

// returns: 'Hi Jess'
// explanation: explicit return in block exists
((name) => {return 'Hi ' + name})('Jess') 

// returns: undefined
// explanation: a block containing a single label. No explicit return.
// more: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/label
((name) => {id: name})('Jess') 

// returns: {id: 'Jess'}
// explanation: implicit return of expression ( ) which evaluates to an object
((name) => ({id: name}))('Jess') 

// returns: {id: 'Jess'}
// explanation: explicit return inside block returns object
((name) => {return {id: name}})('Jess') 
```
