---
layout: default
title: 07.2 Loops
parent: "Module 07: Control Statements"
nav_order: 2
---

# Loops

## Types of Loops

There are several types of loops in Java:

- For loops
- While loops
- Do-while loops
- For with conditions loop
- For each loop
- Nested Loops
- Jump statements
- Labels

### While loops

```java
public class WhileLoops {
    public static void main(String[] args) {
        int counter = 0;
        while (counter < 10) {
            System.out.println("Count: " + counter);
            counter++;
        }
    }
    // infinite loop example
    public static void infiniteLoop() {
        while (true) {
            System.out.println("This will run forever");
        }
    }
}
```

### Do-While Loops

```java
public class DoWhileLoops {
    public static void main(String[] args) {
        int counter = 0;
        do {
            System.out.println("Count: " + counter);
            counter++;
        } while (counter < 10);
    }
}
```

### For Loops

```java
public class forLoops {
    public static void basicLoop() {
        // Standard counting loop
        for (int i = 0; i < 10; i++) {
        System.out.println("Count: " + i);
        }
    // Prints: Count: 0, Count: 1, ..., Count: 9
    }

    public static void nestedLoops() {
        // Multiplication table
        System.out.println("Multiplication Table:");
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= 10; j++) {
                System.out.printf("%4d", i * j);
            }
            System.out.println(); // New line after each row
        }
    }

    public static void forLoopWithMultipleVariables() {
        // Looping with multiple variables
        for (int i = 0, j = 10; i < 10; i++, j--) {
            System.out.println("i: " + i + ", j: " + j);
        }
    }
}

```

### For Each Loops

The enhanced for loop (also called "for-each" loop) was introduced in Java 5 and provides a cleaner, more readable way to iterate through arrays and collections. It eliminates common pitfalls like off-by-one errors and makes code more maintainable.

---

## Understanding Enhanced For Loops

### Basic Syntax and Concept

The enhanced for loop follows this pattern:

```java
for (ElementType element : collection) {
    // Use element here
}
```

This is equivalent to JavaScript's `for...of` loop:

```javascript
// JavaScript equivalent
for (const element of collection) {
  // Use element here
}
```
