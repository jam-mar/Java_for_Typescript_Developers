---
layout: default
title: 10.3 Recursive Methods
parent: "Module 10: Methods in Java"
nav_order: 3
---

# Recursive Methods

**Recursion is when a method calls itself to solve a problem by breaking it down into smaller, similar subproblems.**

Think of recursion like Russian nesting dolls (matryoshka) - each doll contains a smaller version of itself, until you reach the tiniest doll that contains nothing. Similarly, a recursive method solves a big problem by calling itself with a smaller version of the same problem, until it reaches a simple case it can solve directly.

## Why Use Recursion?

Recursion is particularly useful for problems that have a **self-similar structure** - where the solution to a large problem depends on solutions to smaller versions of the same problem. Examples include:

- **Mathematical calculations**: Factorials, Fibonacci sequences, exponents
- **Tree and graph traversal**: File systems, organizational charts, game trees
- **Divide-and-conquer algorithms**: Binary search, sorting algorithms
- **Parsing nested structures**: HTML/XML, mathematical expressions

Recursion often provides more elegant and intuitive solutions than iterative approaches for these types of problems.

## What Happens When Recursion Goes Wrong

Before we learn how to write recursion correctly, let's see what happens when we get it wrong. This example shows exactly what NOT to do:

```java
public class BadRecursionExample {
    public static void main(String[] args) {
        System.out.println("Starting bad recursion...");
        badFactorial(5);  // This will crash!
    }

    // DON'T DO THIS - No stop condition!
    static int badFactorial(int n) {
        System.out.println("Called with n = " + n);
        return n * badFactorial(n - 1);  // Calls itself forever!
    }
}
```

**What happens when you run this:**

```
Starting bad recursion...
Called with n = 5
Called with n = 4
Called with n = 3
Called with n = 2
Called with n = 1
Called with n = 0
Called with n = -1
Called with n = -2
... (continues forever until...)
Exception in thread "main" java.lang.StackOverflowError
```

### Why Does This Crash?

**The fundamental problem:** This method has no clearly defined stop condition. It calls itself indefinitely without any way to end the recursion.

Every time a method is called, Java creates a new **stack frame** in memory to store the method's variables and parameters. When a method calls itself recursively without a stop condition, these stack frames pile up infinitely until Java runs out of memory - this is called a **StackOverflowError**.

**The most important rule of recursion: You MUST have a clearly defined condition that stops the recursive calls.**

## Anatomy of a Correct Recursive Method

Now let's see how to do recursion properly. Every recursive method must have a **clearly defined stop condition** and a way to make progress toward that condition:

1. **Stop Condition (Base Case)**: A condition that stops the recursion - this is absolutely essential
2. **Recursive Case**: The method calling itself with parameters that move toward the stop condition

```java
public returnType recursiveMethod(parameters) {
    // Stop condition - this is REQUIRED
    if (stopping condition) {
        return simple solution;
    }

    // Recursive case - calls itself with parameters closer to the stop condition
    return recursiveMethod(parameters that make progress);
}
```

## Simple Example: Calculating Factorial

Let's start with a classic example - calculating the factorial of a number (n! = n × (n-1) × (n-2) × ... × 1).

**Mathematical definition:**

- 5! = 5 × 4 × 3 × 2 × 1 = 120
- 0! = 1 (by definition)

**Recursive thinking:**

- 5! = 5 × 4!
- 4! = 4 × 3!
- 3! = 3 × 2!
- 2! = 2 × 1!
- 1! = 1 × 0!
- 0! = 1 (base case)

### Recursive Implementation

```java
public class FactorialExample {
    public static void main(String[] args) {
        int number = 5;
        int result = factorial(number);
        System.out.println(number + "! = " + result);  // Output: 5! = 120
    }

    static int factorial(int n) {
        // Stop condition: factorial of 0 is 1
        if (n == 0) {
            return 1;
        }

        // Recursive case: n! = n × (n-1)!
        return n * factorial(n - 1);
    }
}
```

### Iterative (Non-Recursive) Implementation

The same problem can be solved without recursion using a simple loop:

```java
public class FactorialIterative {
    public static void main(String[] args) {
        int number = 5;
        int result = factorialIterative(number);
        System.out.println(number + "! = " + result);  // Output: 5! = 120
    }

    static int factorialIterative(int n) {
        int result = 1;

        // Multiply by each number from 1 to n
        for (int i = 1; i <= n; i++) {
            result = result * i;
        }

        return result;
    }
}
```

### Comparing the Two Approaches

**Recursive version:**

- Easy to read and understand
- Closely mirrors the mathematical definition
- Each call to `factorial(5)` creates 6 method invocations: factorial(5) → factorial(4) → factorial(3) → factorial(2) → factorial(1) → factorial(0)

**Iterative version:**

- Uses a simple loop
- Only one method call regardless of input size
- More efficient in terms of memory usage

**How it works step by step:**

```
factorial(5) calls factorial(4) and multiplies result by 5
factorial(4) calls factorial(3) and multiplies result by 4
factorial(3) calls factorial(2) and multiplies result by 3
factorial(2) calls factorial(1) and multiplies result by 2
factorial(1) calls factorial(0) and multiplies result by 1
factorial(0) returns 1 (base case reached!)

Then the results bubble back up:
factorial(1) = 1 × 1 = 1
factorial(2) = 2 × 1 = 2
factorial(3) = 3 × 2 = 6
factorial(4) = 4 × 6 = 24
factorial(5) = 5 × 24 = 120
```

## Another Example: Counting Down

Here's a simple example that demonstrates the flow of recursive calls:

```java
public class CountdownExample {
    public static void main(String[] args) {
        countdown(5);
    }

    static void countdown(int n) {
        // Base case: stop when we reach 0
        if (n == 0) {
            System.out.println("Blast off!");
            return;
        }

        // Print current number
        System.out.println(n);

        // Recursive case: call countdown with n-1
        countdown(n - 1);
    }
}
```

**Output:**

```
5
4
3
2
1
Blast off!
```

## Example: Calculating Powers

Let's solve x^n (x raised to the power n) recursively:

**Mathematical thinking:**

- 2^4 = 2 × 2^3
- 2^3 = 2 × 2^2
- 2^2 = 2 × 2^1
- 2^1 = 2 × 2^0
- 2^0 = 1 (base case)

```java
public class PowerExample {
    public static void main(String[] args) {
        int base = 2;
        int exponent = 4;
        int result = power(base, exponent);
        System.out.println(base + "^" + exponent + " = " + result);  // Output: 2^4 = 16
    }

    static int power(int base, int exponent) {
        // Base case: any number to the power of 0 is 1
        if (exponent == 0) {
            return 1;
        }

        // Recursive case: base^exponent = base × base^(exponent-1)
        return base * power(base, exponent - 1);
    }
}
```

## Important Guidelines for Recursion

### 1. Make Progress Toward the Base Case

Each recursive call should get closer to the base case:

```java
// DON'T DO THIS - No progress toward base case!
static int badRecursion(int n) {
    if (n == 0) return 1;
    return n * badRecursion(n);  // Calls itself with same value!
}
```

### 2. Handle Edge Cases

Consider what happens with invalid inputs:

```java
static int safeFactorial(int n) {
    // Handle negative numbers
    if (n < 0) {
        throw new IllegalArgumentException("Factorial undefined for negative numbers");
    }

    // Base case
    if (n == 0 || n == 1) {
        return 1;
    }

    // Recursive case
    return n * safeFactorial(n - 1);
}
```

## When to Use Recursion

**Use recursion when:**

- The problem has a naturally recursive structure
- The recursive solution is clearer than an iterative one
- You're working with tree-like or nested data structures

**Consider iteration instead when:**

- Performance is critical (recursion has overhead)
- The recursion depth might be very large (risk of stack overflow)
- A simple loop would be just as clear

## Summary

Recursion is a powerful technique where a method solves a problem by calling itself with simpler inputs. The key requirements are:

1. **Base case**: A stopping condition that returns a simple result
2. **Recursive case**: The method calling itself with parameters that move toward the base case
3. **Progress**: Each call must get closer to the base case

Recursion excels at solving problems with self-similar structure and often provides elegant solutions that closely mirror the mathematical or logical definition of the problem.
