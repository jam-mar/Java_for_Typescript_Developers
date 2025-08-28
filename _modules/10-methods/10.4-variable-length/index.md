---
layout: default
title: 10.4 Variable-Length Arguments
parent: "Module 10: Methods in Java"
nav_order: 4
---

# Variable-Length Arguments (Varargs)

**Variable-length arguments (varargs) allow you to pass any number of arguments to a method without creating an array explicitly.**

## Why Use Varargs?

Instead of creating multiple overloaded methods or forcing users to create arrays, varargs let one method handle different numbers of parameters:

```java
// Without varargs - tedious
static int sum(int a, int b) { return a + b; }
static int sum(int a, int b, int c) { return a + b + c; }

// With varargs - one method handles all cases
static int sum(int... numbers) {
    int total = 0;
    for (int num : numbers) total += num;
    return total;
}

// Clean usage
int result1 = sum(1, 2);           // 2 arguments
int result2 = sum(1, 2, 3, 4, 5);  // 5 arguments
int result3 = sum();               // 0 arguments - returns 0
```

## Basic Syntax

Use three dots (`...`) after the parameter type:

```java
static returnType methodName(Type... parameterName) {
    // parameterName is treated as an array
}
```

## Simple Example

```java
public class VarargsExample {
    public static void main(String[] args) {
        printNumbers(1, 2, 3);      // Output: 1 2 3
        printNumbers(10, 20);       // Output: 10 20
        printNumbers();             // Output: No numbers provided
    }

    static void printNumbers(int... numbers) {
        if (numbers.length == 0) {
            System.out.println("No numbers provided");
            return;
        }

        for (int num : numbers) {
            System.out.print(num + " ");
        }
        System.out.println();
    }
}
```

## Critical Rule: Varargs Must Be Last Parameter

**✅ Correct:**

```java
static void logMessage(String level, int priority, String... messages) {
    // This compiles fine
}
```

**❌ Wrong - Compilation Error:**

```java
static void badMethod(String... messages, int priority) {
    // Compilation error: varargs parameter must be last
}
```

**Compiler Error:**

```
error: varargs parameter must be last
static void badMethod(String... messages, int priority) {
                              ^
```

## Practical Example

```java
public class StringFormatter {
    static String format(String template, Object... values) {
        String result = template;
        for (int i = 0; i < values.length; i++) {
            result = result.replace("{" + i + "}", values[i].toString());
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(format("Hello {0}!", "World"));
        // Output: Hello World!

        System.out.println(format("{0} scored {1} points", "Alice", 95));
        // Output: Alice scored 95 points
    }
}
```

## Java vs JavaScript/TypeScript

Both use `...` but work differently:

**Java Varargs:**

```java
static int sum(int... numbers) {  // Defines varargs parameter
    int total = 0;
    for (int num : numbers) total += num;
    return total;
}
sum(1, 2, 3);  // Pass individual arguments
```

**JavaScript/TypeScript:**

```typescript
function sum(...numbers: number[]): number {
  // Rest parameter
  return numbers.reduce((a, b) => a + b, 0);
}
sum(1, 2, 3); // Individual arguments
sum(...[1, 2, 3]); // Spread operator - spreads array elements
```

**Key Difference:** JavaScript has both rest parameters (`...args`) and spread operator (`...array`). Java only has varargs.

## Important Rules

1. **Only one varargs parameter per method**
2. **Must be the last parameter**
3. **Treated as an array inside the method**
4. **Can accept zero arguments**

## When to Use Varargs

**Use varargs when:**

- You need flexible number of similar parameters
- All parameters serve the same purpose

**Avoid when:**

- You always expect a fixed number of parameters
- Parameters have different meanings

## Summary

Varargs provide a clean way to accept flexible numbers of parameters using `Type... name` syntax. Remember: varargs must always be the last parameter, and they're treated as arrays within the method.
