# Technical Resources

This is a list of various sites, textbooks, and tools that I've personally found useful. At some point I plan to organize these into a starting-from-scratch syllabus for all of computer science, like Gerard 't Hooft's ["How to Become a GOOD Theoretical Physicist"](http://www.staff.science.uu.nl/~gadda001/goodtheorist/) or the anonymous ["How to Become a Pure Mathematician (or Statistician)"](https://hbpms.blogspot.ca), both of which I highly recommend.

## General

* ["What every computer science major should know"](http://matt.might.net/articles/what-cs-majors-should-know/): Matt Might's magisterial manifest of everything a well-rounded computer science graduate should know is, perhaps, a bit too ambitious for any real 4-year degree, but it still serves as a timeless guide to the many subfields of computer science.
* [Wizard Zines](https://wizardzines.com): Julia Evans makes delightful zines that provide bite-size guides to topics like SQL queries or containers. She's released many of the comics for free on her website and Twitter.

## Programming Languages

* [*Crafting Interpreters*](http://www.craftinginterpreters.com): Bob Nystrom's tour de force of programming language design and implementation is not just one of my favorite technical books, but one of my favorite books period. Even better, it's available completely free online.
* [*Types and Programming Languages*](https://www.cis.upenn.edu/~bcpierce/tapl/): Pierce's *TAPL* is *the* introductory textbook for programming languages theory (PLT). It's a fantastic resource that explains type theory in reasonable depth without straying too far into the mathematical weeds.
* [*Software Foundations*](https://softwarefoundations.cis.upenn.edu): This free online textbook provides an introduction to "the mathematical underpinnings of reliable software", teaching the use of the [Coq proof assistant](https://coq.inria.fr) along the way[^1]. It's a fun exercise to implement the exercises in another proof assistant or dependently-typed language, like [Idris](https://www.idris-lang.org).
* ["PLT: A path to enlightenment in Programming Language Theory"](http://steshaw.org/plt/): This curated list of resources, roughly in order of difficulty, focuses on the more theoretical side of programming languages theory.

## Operating Systems

* [*Operating Systems: Three Easy Pieces*](http://pages.cs.wisc.edu/~remzi/OSTEP/): *OSTEP*, freely available online, covers the basics of operating systems via the eponymous "three easy pieces" (virtualization, concurrency, and persistence). It strikes a nice middle ground between highlighting the "big ideas" of operating systems and explaining how those ideas are implemented in practice.

## Algorithms

* [Tim Roughgarden's Lecture Notes](http://timroughgarden.org/notes.html): Roughgarden, a professor focused on algorithm design and algorithmic game theory, has a collection of his edited, and quite detailed, lecture notes on those topics. 

## System Design

* [*System Design Primer*](https://github.com/donnemartin/system-design-primer): A massive collection of tutorials, resources, and interview question guides, I've occasionally seen this cited as the "canonical" source for software architecture and system design interview questions.

## iOS/Swift

* [*Hacking with Swift*](https://www.hackingwithswift.com): Paul Hudson's site is the "user manual you didn't know you needed" for iOS programming. His ["100 Days of Swift"](https://www.hackingwithswift.com/100) and ["100 Days of SwiftUI"](https://www.hackingwithswift.com/100/swiftui) are both highly recommended for beginners.

[^1]: Important: the "download" button on the main page lets you download and run the Coq source, which is the best way to follow along with the book.
