---
title: "GraalVM: la JVM polyglotte"
date: 2019-12-12T00:00:00+00:00

tags: ["GraalVM", "JVM", "Polyglot"]
author: "Pascal Gillet"
lang: fr
---

Présentation de "GraalVM: la JVM polyglotte" au Toulouse JUG le 12 décembre 2019.


[![GraalVM: la JVM polyglotte](https://img.youtube.com/vi/PypmeSh1WlQ/0.jpg)](https://youtu.be/PypmeSh1WlQ)


> “Cette librairie n'est pas disponible dans mon langage de programmation. Je dois la réécrire."

> "Ce langage conviendrait parfaitement à mon problème, mais nous ne pouvons pas l'exécuter dans notre environnement."

> "Ce problème est déjà résolu dans tel ou tel langage, mais ce langage est trop lent."

Oui, GraalVM améliore les performances des langages JVM tels que Groovy, Scala ou Kotlin pour égaler les performances des langages natifs. Oui, GraalVM permet de produire des exécutables Java standalone - des images natives - grâce à la compilation Ahead-of-time. Oui, le startup de ces applications est grandement réduit. Oui, GraalVM est bien intégrée dans des frameworks tels que Micronaut et Quarkus. Et donc oui, GraalVM rend ses lettres de noblesse au langage Java, qui devient très pertinent dans le monde des micro-services. 😛

Dans ce talk, nous nous intéresserons à l'autre grand objectif de GraalVM, qui est de mélanger librement plusieurs langages dans des applications multi-langages ou **polyglottes**: imaginez une application dont le code source mêle le Java, le JavaScript, le Python, et le Rust! 🤯  GraalVM permet donc aux développeurs de choisir librement le bon langage pour la tâche à résoudre, sans faire de compromis sur les performances.

Nous allons étudier les mécanismes de GraalVM permettant des applications polyglottes. Nous présenterons également Truffle, un outil associé à GraalVM pour écrire son propre langage.

Et bien sûr nous écrirons, en live, une application multi-langages!

