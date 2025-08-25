---
layout: default
title: 01.3 First Java Program
parent: "Module 01: Introduction & Setup"
nav_order: 3
---

## Your First Java Program

Let's write your first Java program and compare it directly to JavaScript and TypeScript so you can see the similarities and differences.

{: .highlight }
**Goal**: Write a simple "Hello World" program in Java and understand how it compares to JavaScript/TypeScript.

---

## Hello World in Java

### Step 1: Create the Project

In Eclipse:

1. **File** → **New** → **Java Project**
2. **Name**: `HelloWorld`
3. **Finish**

### Step 2: Create the Java Class

1. **Right-click** on `HelloWorld` project
2. **New** → **Class**
3. **Package**: `com.example`
4. **Name**: `HelloWorld`
5. **Check**: "public static void main"
6. **Finish**

### Step 3: Write Your First Java Code

Replace the generated code with:

```java
package com.example;

public class HelloWorld {
    public static void main(String[] args) {
        // Simple greeting
        System.out.println("Hello, World!");
        System.out.println("Welcome to Java!");

        // Variables
        String name = "Java Developer";
        int year = 2024;
        boolean isLearning = true;

        // Output with variables
        System.out.println("Hello, " + name);
        System.out.println("Year: " + year);
        System.out.println("Learning Java: " + isLearning);

        // Simple calculation
        int a = 10;
        int b = 5;
        int sum = a + b;
        System.out.println(a + " + " + b + " = " + sum);
    }
}
```

### Step 4: Run the Program

1. **Right-click** on `HelloWorld.java`
2. **Run As** → **Java Application**

**Output:**

```
Hello, World!
Welcome to Java!
Hello, Java Developer
Year: 2024
Learning Java: true
10 + 5 = 15
```

---

## The Same Program in JavaScript

```javascript
// Simple greeting
console.log("Hello, World!");
console.log("Welcome to JavaScript!");

// Variables
let name = "JavaScript Developer";
let year = 2024;
let isLearning = true;

// Output with variables
console.log("Hello, " + name);
console.log("Year: " + year);
console.log("Learning JavaScript: " + isLearning);

// Simple calculation
let a = 10;
let b = 5;
let sum = a + b;
console.log(a + " + " + b + " = " + sum);
```

---

## The Same Program in TypeScript

```typescript
// Simple greeting
console.log("Hello, World!");
console.log("Welcome to TypeScript!");

// Variables with types
const name: string = "TypeScript Developer";
const year: number = 2024;
const isLearning: boolean = true;

// Output with variables
console.log("Hello, " + name);
console.log("Year: " + year);
console.log("Learning TypeScript: " + isLearning);

// Simple calculation
const a: number = 10;
const b: number = 5;
const sum: number = a + b;
console.log(a + " + " + b + " = " + sum);
```

---

## Key Differences Explained

### 1. Program Structure

| Java                        | JavaScript         | TypeScript         |
| --------------------------- | ------------------ | ------------------ |
| Must be in a class          | No class needed    | No class needed    |
| `public static void main()` | Code runs directly | Code runs directly |
| Package declaration         | No packages        | Optional modules   |

### 2. Variable Declarations

```java
// Java - must declare types
String name = "John";
int age = 25;
boolean isStudent = true;
```

```javascript
// JavaScript - no types
let name = "John";
let age = 25;
let isStudent = true;
```

```typescript
// TypeScript - types are optional but recommended
const name: string = "John";
const age: number = 25;
const isStudent: boolean = true;
```

### 3. Output/Printing

```java
// Java
System.out.println("Hello World");
```

```javascript
// JavaScript
console.log("Hello World");
```

```typescript
// TypeScript (same as JavaScript)
console.log("Hello World");
```

### 4. Running the Code

| Java                                | JavaScript                       | TypeScript                 |
| ----------------------------------- | -------------------------------- | -------------------------- |
| 1. Compile: `javac HelloWorld.java` | 1. Run directly: `node hello.js` | 1. Compile: `tsc hello.ts` |
| 2. Run: `java HelloWorld`           |                                  | 2. Run: `node hello.js`    |

---

## Understanding Java Syntax

Let's break down the Java program line by line:

```java
package com.example;
```

- **Package**: Groups related classes (like folders)
- **Similar to**: ES6 modules or namespaces

```java
public class HelloWorld {
```

- **Class**: Container for your code (must match filename)
- **public**: Can be accessed from anywhere
- **Similar to**: `class HelloWorld` in JavaScript/TypeScript

```java
public static void main(String[] args) {
```

- **public**: Method can be called from anywhere
- **static**: Belongs to the class, not an instance
- **void**: Doesn't return anything
- **main**: Special method name - where program starts
- **String[] args**: Command line arguments
- **Similar to**: Top-level code in JavaScript

```java
System.out.println("Hello World");
```

- **System.out**: Built-in object for output
- **println**: Print with a new line
- **Similar to**: `console.log()` in JavaScript

---

## Try These Variations

### 1. Using Variables

```java
public class Variables {
    public static void main(String[] args) {
        // Different data types
        String message = "Hello";
        int number = 42;
        double decimal = 3.14;
        boolean flag = true;

        System.out.println("Message: " + message);
        System.out.println("Number: " + number);
        System.out.println("Decimal: " + decimal);
        System.out.println("Flag: " + flag);
    }
}
```

### 2. Simple Math

```java
public class SimpleMath {
    public static void main(String[] args) {
        int x = 10;
        int y = 3;

        System.out.println("Addition: " + x + " + " + y + " = " + (x + y));
        System.out.println("Subtraction: " + x + " - " + y + " = " + (x - y));
        System.out.println("Multiplication: " + x + " * " + y + " = " + (x * y));
        System.out.println("Division: " + x + " / " + y + " = " + (x / y));
        System.out.println("Remainder: " + x + " % " + y + " = " + (x % y));
    }
}
```

### 3. String Operations

```java
public class StringDemo {
    public static void main(String[] args) {
        String firstName = "John";
        String lastName = "Doe";
        String fullName = firstName + " " + lastName;

        System.out.println("First name: " + firstName);
        System.out.println("Last name: " + lastName);
        System.out.println("Full name: " + fullName);
        System.out.println("Length: " + fullName.length());
        System.out.println("Uppercase: " + fullName.toUpperCase());
    }
}
```

---

## Common Beginner Mistakes

### 1. Forgetting Semicolons

```java
String name = "John"  // ❌ Missing semicolon
String name = "John"; // ✅ Correct
```

### 2. Wrong Class Name

```java
// File: HelloWorld.java
public class HelloWorld { } // ✅ Correct - matches filename

// File: HelloWorld.java
public class MyProgram { }  // ❌ Wrong - doesn't match filename
```

### 3. Case Sensitivity

```java
string name = "John";  // ❌ Should be String (capital S)
String name = "John";  // ✅ Correct

system.out.println();  // ❌ Should be System (capital S)
System.out.println();  // ✅ Correct
```

### 4. Missing main Method

```java
public class HelloWorld {
    // ❌ No main method - program won't run
}

public class HelloWorld {
    public static void main(String[] args) {  // ✅ Correct
        System.out.println("Hello World");
    }
}
```

---

## Practice Exercises

### Exercise 1: Personal Info

Create a program that prints:

- Your name
- Your favorite programming language
- The current year
- Whether you're enjoying learning Java

### Exercise 2: Simple Calculator

Write a program that:

- Declares two numbers
- Calculates and prints their sum, difference, product, and quotient

### Exercise 3: String Playground

Create a program that:

- Takes your first and last name
- Combines them into a full name
- Prints the full name in uppercase and lowercase
- Shows the length of your full name

---

## Key Takeaways

{: .highlight-title }

> Java vs JavaScript/TypeScript
>
> 1. **Structure**: Java needs classes and main method, JS/TS can run directly
> 2. **Types**: Java requires type declarations, JavaScript doesn't, TypeScript is optional
> 3. **Compilation**: Java compiles to bytecode, JavaScript runs directly, TypeScript compiles to JavaScript
> 4. **Syntax**: Very similar for basic operations (variables, math, strings)
> 5. **Output**: `System.out.println()` vs `console.log()`

---

## What's Next?

In **1.4 Comparing Java to JavaScript/TypeScript**, we'll dive deeper into:

- When to use each language
- Performance differences
- Type safety benefits
- Ecosystem comparisons

You now know how to write and run basic Java programs! The syntax is similar to what you already know, with some additional structure required. 🚀

---

{: .fs-2 }
[← Previous: 1.2 Development Environment]({% link _modules/01-introduction/01.2-development-environment/index.md %}){: .btn .btn-outline }
[Next: 1.4 Comparing Java to JavaScript/TypeScript →]({% link _modules/01-introduction/01.4-comparing-js-ts-java/index.md %}){: .btn .btn-primary }
