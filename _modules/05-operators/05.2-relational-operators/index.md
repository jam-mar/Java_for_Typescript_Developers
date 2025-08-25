---
layout: default
title: 05.2 Assignment & Relational Operators
parent: "Module 05: Operators and Operands"
nav_order: 2
---

# Assignment & Relational Operators

## Assignment Operators

Assignment operators are used to assign values to variables. In Java, the primary assignment operator is the equals sign (`=`), but there are also compound assignment operators that combine an arithmetic operation with assignment.

### Simple Assignment

The simple assignment operator (`=`) is used to assign a value to a variable.

## Example

```java
int a = 5;
int b = 10;
a = b; // a is now 10
```

## Compound Assignment

In this example, the compound assignment operators (`+=`, `-=`, `*=`, `/=`, and `%=`) are used to perform arithmetic operations on `a` and assign the result back to `a`.

```java
int a = 5;
int b = 10;
a += b; // the value of a is its current value plus the value of b (15)
a -= b; // the value of a is its current value minus the value of b (5)
a *= b; // the value of a is its current value multiplied by the value of b (50)
a /= b; // the value of a is its current value divided by the value of b (5)
a %= b; // the value of a is its current value modulo the value of b (the remainder of 5 divided by 10 is 5)
```

## Relational Operators

Again these are similiar to JavaScript though the triple equals operator (`===`) is not present in Java because Java is a statically typed language and does not require type coercion like JavaScript to compare values.

- **Equal to (`==`)**: Checks if two values are equal.
- **Not equal to (`!=`)**: Checks if two values are not equal.
- **Greater than (`>`)**: Checks if the left operand is greater than the right.
- **Less than (`<`)**: Checks if the left operand is less than the right.
- **Greater than or equal to (`>=`)**: Checks if the left operand is greater than or equal to the right.
- **Less than or equal to (`<=`)**: Checks if the left operand is less than or equal to the right.

### Example

```java
int a = 5;
int b = 10;
boolean c = a == b; // c is false
boolean d = a != b; // d is true
boolean e = a > b;  // e is false
boolean f = a < b;  // f is true
boolean g = a >= b; // g is false
boolean h = a <= b; // h is true
```

In this example, the relational operators are used to compare the values of `a` and `b`.

### Ternary Operator

The ternary operator (also called the conditional operator) is Java's only operator that takes three operands. It provides a concise way to write simple conditional expressions.

### Syntax

```java
condition ? valueIfTrue : valueIfFalse
```

### Example

```java
int a = 5;
int b = 10;
int max = a > b ? a : b; // max is 10

// This is equivalent to:
int max;
if (a > b) {
    max = a;
} else {
    max = b;
}
```

### Comparison with JavaScript

The ternary operator works identically in Java and JavaScript:

**Java:**

```java
int score = 85;
String grade = score >= 90 ? "A" : score >= 80 ? "B" : "C";
```

**JavaScript:**

```javascript
let score = 85;
let grade = score >= 90 ? "A" : score >= 80 ? "B" : "C";
```
