---
layout: default
title: 05.1 Arithmetic Operators
parent: "Module 05: Operators and Operands"
nav_order: 1
---

---

layout: default
title: 05.1 Arithmetic Operators
parent: "Module 05: Operators and Operands"
nav_order: 1

---

# Arithmetic Operators

Java provides several types of arithmetic operators that allow you to perform mathematical operations on values. These operators can be categorized based on how many operands they work with: unary (one operand), binary (two operands), and ternary (three operands).

## Unary Arithmetic Operators

Unary arithmetic operators operate on a single operand. Java includes several unary operators for different purposes.

### Basic Unary Operators

- **Unary Plus (`+`)**: Indicates a positive value (though this is redundant since numbers are positive by default)
- **Unary Minus (`-`)**: Negates the value of the operand

```java
int a = 5;    // positive by default
int b = +5;   // explicitly positive (redundant)
int c = -a;   // c is -5 (negated value of a)
```

### Increment and Decrement Operators

Java also provides increment (`++`) and decrement (`--`) operators that increase or decrease a variable's value by one. These operators can be used in two ways:

- **Prefix notation**: The operator comes before the variable (`++a`, `--a`)
- **Postfix notation**: The operator comes after the variable (`a++`, `a--`)

The key difference lies in when the operation occurs relative to when the value is used in an expression.

#### Pre-increment/Pre-decrement

With prefix operators, the variable is modified first, then its new value is used in the expression:

```java
int x = 10;
int y = ++x; // x becomes 11, then y gets the value 11
// Result: x = 11, y = 11

int a = 5;
int b = --a; // a becomes 4, then b gets the value 4
// Result: a = 4, b = 4
```

#### Post-increment/Post-decrement

With postfix operators, the current value is used in the expression first, then the variable is modified:

```java
int x = 10;
int y = x++; // y gets the current value 10, then x becomes 11
// Result: x = 11, y = 10

int a = 5;
int b = a--; // b gets the current value 5, then a becomes 4
// Result: a = 4, b = 5
```

## Binary Arithmetic Operators

Binary arithmetic operators work with two operands and perform the standard mathematical operations:

- **Addition (`+`)**: Adds two operands
- **Subtraction (`-`)**: Subtracts the second operand from the first
- **Multiplication (`*`)**: Multiplies two operands
- **Division (`/`)**: Divides the first operand by the second
- **Modulus (`%`)**: Returns the remainder after division

### Example

```java
int a = 15;
int b = 4;

int sum = a + b;        // sum is 19
int difference = a - b; // difference is 11
int product = a * b;    // product is 60
int quotient = a / b;   // quotient is 3 (integer division)
int remainder = a % b;  // remainder is 3 (15 ÷ 4 = 3 remainder 3)
```

### Special Note: String Concatenation

Like JavaScript, the `+` operator is overloaded in Java. When used with strings, it performs concatenation instead of addition:

```java
String greeting = "Hello" + " " + "World"; // greeting is "Hello World"
int num = 5;
String message = "The number is: " + num;  // message is "The number is: 5"
```
