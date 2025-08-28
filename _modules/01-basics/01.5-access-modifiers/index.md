---
layout: default
title: 01.5 Access Modifiers & Packaging
parent: "Module 01: Introduction & Setup"
nav_order: 4
---

# Access Modifiers & Packaging

As you have seen from the previous sections, Java provides access modifiers to control the visibility of classes, methods, and variables. Understanding these modifiers is crucial for designing robust and maintainable applications. If you used a functional programming style in JavaScript, this syntax may be new to you. The important thing to note is that access modifiers help enforce encapsulation, a core principle of object-oriented programming.

## Encapsulation

Encapsulation is the concept of bundling the data (attributes) and methods (functions) that operate on the data into a single unit, or class. It restricts direct access to some of an object's components, which can prevent the accidental modification of data. In Java, encapsulation is achieved through the use of access modifiers.

## Types of Access Modifiers

Java has four main access modifiers:

1. **Public**: The member is accessible from any other class.
2. **Protected**: The member is accessible within its own package and by subclasses.
3. **Default** (no modifier): The member is accessible only within its own package.
4. **Private**: The member is accessible only within its own class.

## Why Use Access Modifiers?

- **Encapsulation**: Restricting access to certain components helps protect the internal state of an object.
- **Maintainability**: Clear access levels make it easier to understand and modify code.
- **Security**: Limiting access reduces the risk of unintended interference with an object's behavior.

## Examples

```java
public class Example {
    public int publicVar;
    protected int protectedVar;
    int defaultVar; // package-private
    private int privateVar;
}
```

In this example, `publicVar` can be accessed from anywhere, while `privateVar` can only be accessed within the `Example` class.

## Packaging

Packaging is the mechanism of organizing classes and interfaces into namespaces, known as packages. This helps avoid naming conflicts and makes it easier to manage large codebases. In Java, packages are defined using the `package` keyword, and they can contain sub-packages as well. They are identified using a hierarchical naming convention, typically based on the organization's domain name (e.g., `com.example.project`) as this will be unique.

```java
package com.example.project;

public class Example {
    public class InnerExample {
        // Inner class can access all members of the outer class
        public void accessOuterClassMembers() {
            System.out.println(publicVar);
            System.out.println(protectedVar);
            System.out.println(defaultVar);
            System.out.println(privateVar);
        }
    }
}
```

To invoke the previous example from another class, you would do the following:

```java
package com.example.project;

public class Main {
    public static void main(String[] args) {
        // Create an instance of the outer class
        Example example = new Example();
        // Create an instance of the inner class
        Example.InnerExample inner = example.new InnerExample();
        // Invoke the method of the inner class

        inner.accessOuterClassMembers();
    }
}
```

This is just a short introduction to help you understand the syntax. We will go into more detail about these topics in the sections on Methods and Object-Oriented Programming.
