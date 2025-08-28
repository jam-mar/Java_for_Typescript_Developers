---
layout: default
title: 10.1 Methods & Overloading
parent: "Module 10: Methods in Java"
nav_order: 1
---

# Methods

## Methods vs Functions

Functions and methods are both blocks of reusable code designed to perform specific tasks, but their key distinction lies in their association with objects or classes in object-oriented programming. Functions can exist and be called independently, without being directly tied to a specific object or class instance.
Methods are functions that are defined within a class and are associated with instances of that class (objects).

The javascript developer will be familiar with the concept of functions. If you have mainly worked in a functional programming style, you may not have written static methods, though you will be familiar with static methods available in javascript, for example Math.max(); a static method of the Math class.

In Java, which is an object-oriented programming language, methods are a fundamental part of the language's design. Java encourages the use of methods to operate on objects and their data, promoting encapsulation and reusability.

## Method Structure

Method signatures in Java consist of the method name, return type, and parameters. The general structure of a method is as follows:

```java
public class MyClass {
    // Instance method
    public int addNumbers(int num1, int num2) {
        return num1 + num2;
    }
}
```

## Static Methods

The `static` keyword in Java is used to indicate that a method or variable belongs to the class itself rather than to instances of the class. This means that static methods can be called without creating an instance of the class. Static methods can only access static variables and other static methods directly.

```java
public class MyClass {
    static int staticVar = 10;

    static void staticMethod() {
        System.out.println("Static method called.");
    }
}
```

## Method Overloading

Method overloading is a feature in Java that allows multiple methods to have the same name with different parameters:

### Example of Method Overloading

```java
public class MathUtils {
    static int plusMethod(int x, int y) {
        return x + y;
    }

    static double plusMethod(double x, double y) {
        return x + y;
    }
}

public static void main(String[] args) {
  int myNum1 = plusMethod(8, 5);
  double myNum2 = plusMethod(4.3, 6.26);
  System.out.println("int: " + myNum1);
  System.out.println("double: " + myNum2);
}
```

In this example, the `plusMethod` is overloaded with different parameter lists. The Java compiler determines which method to call based on the method signature, which includes the method name and the parameter types.
