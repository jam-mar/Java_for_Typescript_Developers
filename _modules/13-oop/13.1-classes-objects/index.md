---
layout: default
title: 13.1 Introduction to Object-Oriented Programming
parent: "Module 13: Object-Oriented Programming"
nav_order: 1
---

# Introduction to Object-Oriented Programming

Object-oriented programming (OOP) is a software design approach in which the concept of 'object' occupies the first place. It is computer programming model that organizes software design around objects, rather than functions. Depending on how long you have been writing JavaScript code, you may or may not have used OOP concepts. JavaScript is a multi-paradigm language, which means it supports different programming styles, including procedural, functional, and object-oriented programming. You may have encountered OOP concepts in your JavaScript career, such as classes, objects, inheritance, and polymorphism.

However, many developers work in an exclusively in a functional or procedural style and may not be familiar with the principles of OOP. In Java, OOP is a fundamental part of the language, and understanding its concepts is crucial. If you are new to OOP, understanding its principles is essentially for anyone working with Java.

## What is an object

In OOP everything is an object, an array is an object, a connection to a database is an object, an exception is an object. This means that all data types in Java are objects, and they can be manipulated using methods defined in their classes. Think of a dog as an object. The properties of an object are its attributes, and the actions that can be performed on the object are its methods. A dog has attributes (breed, color, age, weight) and methods (bark, eat, sleep, run) that define its behavior. An object is an instance of a class.

## Functional Programming vs Object-Oriented Programming

Functional programming is a programming paradigm that treats computation as the evaluation of mathematical functions and avoids changing-state and mutable data. It emphasizes the use of pure functions, higher-order functions, and function composition. Functional programming approach works best when you don't care about the order of operations and want to focus on the data transformations. Object-oriented programming, on the other hand, is centered around the concept of objects, which can encapsulate data and behavior.

## Advantages of Object-Oriented Programming

1. **Modularity**: OOP allows you to break down complex problems into smaller, manageable pieces (objects), making it easier to develop, test, and maintain code. In OOP, methods should be co-located with the data they operate on.
2. **Security**: OOP can enhance security by restricting access to certain components of an object and exposing only what is necessary through public methods.
3. **Modularity**: OOP promotes modularity by encouraging the use of classes and objects, which can be developed and tested independently.
4. **Scalability**: OOP makes it easier to manage and scale complex applications by organizing code into reusable components.

## Object-Oriented Programming Concepts

In this lesson, we will cover the fundamental concepts of object-oriented programming (OOP) in Java. OOP is a programming paradigm that uses "objects" to represent data and methods to manipulate that data. The key concepts of OOP include:

1. **Classes and Objects**: A class is a blueprint for creating objects. An object is an instance of a class.
2. **Encapsulation**: The bundling of data (attributes) and methods (functions) that operate on the data into a single unit (class).
3. **Inheritance**: The mechanism by which one class can inherit the attributes and methods of another class.
4. **Polymorphism**: The ability of different classes to be treated as instances of the same class through a common interface.
5. **Abstraction**: The concept of hiding the complex implementation details and showing only the essential features of the object.

## Classes

A class is a template, or blueprint, for creating objects. An Animal class might have attributes like species, age, and weight, and methods like eat, sleep, and move. When you create an object from a class, you are creating an instance of that class. For example, you could create a specific dog object with the species "Golden Retriever", age 3, and weight 30 kilograms.
So an object is an instance of a class.

## Inheritance

Inheritance is a mechanism in OOP that allows one class (the child class) to inherit the attributes and methods of another class (the parent class). This promotes code reusability and establishes a relationship between classes. All mammals have the same basic characteristics (attributes and methods) - they are warm-blooded, have hair or fur, and produce milk for their young - but each mammal species can have its own specific features as well. So a specific species like a dog could be represented as a subclass of the mammal class, inheriting its attributes and methods while also adding its own unique features. For example, a bat could be represented as a subclass of the mammal class, inheriting all mammalian characteristics while also adding its own unique features, such as wing attributes and a method for echolocation, which most other mammals do not have.

## Encapsulation

Encapsulation is the principle that tells us to keep data and code that can manipulate this data together. So the data and the code can be kept safe from external interference and misuse. Think of the 'digest' method in an animal class. When an animal eats food, the animal's internal systems (like the stomach, intestines, and various enzymes) work together in a complicated series of biochemical processes. However, other parts of the program don't need to know the details of how digestion happens; they just need to be able to access the 'digest' method to process nutrients for the animal.

### Access Modifiers

In Java, you can use access modifiers to control the visibility of class members (attributes and methods). The main access modifiers are:

- **private**: The strictest access level. The member is accessible only within its own class.
- **default** (no modifier): The member is accessible only within its own package. Elements with the default access level can be accessed by other classes in the same package.
- **protected**: Access level within the package and outside the package within subclasses.
- **public**: The member is accessible from anywhere.

## Polymorphism

Imagine you have two different animals: a bird and a fish. Both animals can move, but the way they implement movement is completely different - one flies through the air while the other swims through water. In a polymorphic scenario, you could treat both animals as instances of a common superclass (e.g., `Animal`) and call the `move` method without needing to know the specifics of each animal's implementation. This means you can have one interface for all animals, with multiple implementations. This is called method overriding, where you override a method in a subclass to provide a specific implementation.

## Abstraction

Think about the concept of a "mammal." In the natural world, there is no actual animal called simply a "mammal" - it's an abstract classification that groups together animals sharing certain essential characteristics. You can't point to a creature and say "that's just a mammal," because every mammal is actually a specific species like a dog, cat, whale, or human. However, the mammal classification is incredibly useful because it defines the common features that all mammals share: they are warm-blooded, have hair or fur at some point in their lives, produce milk, and give birth to live young (with rare exceptions - see below).

In programming, abstraction works similarly. You might create an abstract `Mammal` class that defines the essential characteristics and behaviors that all mammals must have, without providing the specific implementation details. Concrete classes like `Dog`, `Cat`, or `Whale` would then extend this abstract class, inheriting its essential mammalian features while implementing their own specific behaviors.

But here's where abstraction becomes even more powerful: consider monotremes like the platypus and echidna. These mammals lay eggs instead of giving birth to live young, which seems to contradict one of our "essential" mammalian characteristics. However, they still produce milk and are warm-blooded. In an abstract `Mammal` class, you might define `reproduce()` as an abstract method that must be implemented by all subclasses, rather than assuming all mammals give live birth. The `Platypus` class would implement `reproduce()` by laying eggs, while the `Dog` class would implement it through live birth. Both are valid mammalian reproduction strategies.

This allows you to work with the concept of "mammalness" in your code while hiding the complex details of how each individual species implements those mammalian characteristics, even when those implementations vary dramatically from the "typical" pattern.
