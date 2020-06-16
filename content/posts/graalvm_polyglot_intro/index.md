---
title: "A brief rationale of GraalVM as a Polyglot Platform"
date: 2020-06-12T04:00:00+01:00
tags: ["GraalVM", "Polyglot"]
author: "Pascal Gillet"
lang: en
---

GraalVM is a Java VM - _runtime and compiler_ - based on HotSpot/OpenJDK for the Community Edition and on Oracle JDK for 
the Enterprise Edition. Among the goals of the project, GraalVM strives for improving the performance of JVM-based 
languages, such as Groovy, Scala and Kotlin, to match the performance of native languages. GraalVM can also produce 
native code thanks to the Ahead-Of-Time compilation - as opposed to the classic Just-In-Time compilation - which greatly 
reduces the startup time and the memory footprint of Java applications. Last but not least, GraalVM allows freeform 
mixing of code from any programming language in a single program, namely "polyglot applications".   

![banner](batman-robin.jpg)

<!--more-->

The main argument in favor of GraalVM as a Polyglot Platform, and language interoperability in general, is the reuse of 
existing code, much like inheritance in object-oriented programming languages whereby a subclass re-uses code in a base 
class (at least, it was the "silver bullet" announced with the rise of OO languages). Except that here, we get rid of 
the limits of the programming language and its ecosystem. Indeed, a programming language never comes alone. 
siloed environment and a closed world


A language can have its own characteristics that make it suitable for a given problem.   

![GraalVM rationale](graalvm-rationale.png)


there are a lot of precedents and attempts to achieve language interoperability