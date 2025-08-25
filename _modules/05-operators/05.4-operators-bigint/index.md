---
layout: default
title: 05.4 Operators with integers and floating point numbers & Big Decimal types
parent: "Module 05: Operators and Operands"
nav_order: 4
---

# Operators with integers and floating point numbers & Big Decimal types

Java provides a rich set of operators to work with numbers. Understanding how they behave with different numeric types—like integers, floating-point numbers, and `BigDecimal`—is essential for writing accurate and bug-free code. Additionally, Java offers bitwise operators for low-level manipulation of data. In Java, you can use the same operators for both integer and floating-point numbers, but be aware of the differences in how they are handled.

## Integer Operators

For integer types (e.g., `int`, `long`), the operators work as expected:

```java
int a = 5;
int b = 10;
int sum = a + b;         // sum is 15
int difference = a - b;  // difference is -5
int product = a * b;     // product is 50
int quotient = a / b;    // quotient is 0
int remainder = a % b;   // remainder is 5
```

Be aware of integer division, which truncates the decimal part:

### Integer Arithmetic

For `int` and `long` types, operations are exact but have limitations. The most common pitfall is **integer division**, which truncates (discards) any fractional part.

**Example: The Taxi Fare Problem** 🚕
Imagine splitting a $20.00 fare among 3 passengers.

```java
int taxiFare = 20;
int passengerCount = 3;

// Integer division discards the remainder.
int unfairFarePerPassenger = taxiFare / passengerCount; // Result is 6
// If each passenger pays $6, the driver only gets $18, not the full $20!
System.out.println("Unfair fare: $" + unfairFarePerPassenger); // Output: Unfair fare: $6
```

A quick fix is to cast one of the numbers to a double to force floating-point division:

```java
double fairFarePerPassenger = (double) taxiFare / passengerCount;
System.out.println("Fair fare: $" + fairFarePerPassenger); // Output: Fair fare: $6.666666666666667
```

While this is more accurate, double introduces its own set of problems, especially for financial calculations

### Floating-Point Arithmetic

For floating-point types (e.g., `float`, `double`), the operators also work as expected, but be cautious of precision issues:

```java
double x = 5.0;
double y = 10.0;
double sum = x + y;         // sum is 15.0
double difference = x - y;  // difference is -5.0
double product = x * y;     // product is 50.0
double quotient = x / y;    // quotient is 0.5
```

For float and double types, division works as expected, but these types suffer from precision errors. They cannot represent all decimal values perfectly in binary.

```java
// Basic operations work as you'd expect
double x = 10.0;
double y = 4.0;
System.out.println(x / y); // Output: 2.5
```

```java
// But precision issues are common
System.out.println(0.1 + 0.2); // Output: 0.30000000000000004
This tiny error can compound in complex calculations, making double and float unsuitable for situations that demand exactness, like handling money.
```

### High-Precision Math with BigDecimal

For precise decimal arithmetic, especially in financial or scientific applications, you should always use the java.math.BigDecimal class. It avoids floating-point inaccuracies entirely.

Key Practices:

Use the String Constructor: Always create BigDecimal from a String to avoid passing in an already-imprecise double value.

Use Methods for Math: You cannot use standard operators like + or \*. You must use methods like .add() and .multiply().

Specify Rounding: When dividing, you must specify a scale (number of decimal places) and a rounding mode if the result could have a non-terminating decimal.

#### Example: Solving the Taxi Fare Problem Correctly ✅

```java
import java.math.BigDecimal;
import java.math.RoundingMode;

BigDecimal rideFare = new BigDecimal("20.00");
BigDecimal passengerCount = new BigDecimal("3");

// Divide, specifying 2 decimal places and rounding up to ensure the driver gets the full amount.
BigDecimal roundedFarePerPassenger = rideFare.divide(
passengerCount,
2,
RoundingMode.CEILING
);

System.out.println("Truly fair fare: $" + roundedFarePerPassenger); // Output: Truly fair fare: $6.67
Basic BigDecimal Operations:

Java

BigDecimal a = new BigDecimal("10.00");
BigDecimal b = new BigDecimal("4.00");

BigDecimal sum = a.add(b); // 14.00
BigDecimal product = a.multiply(b); // 40.00
BigDecimal quotient = a.divide(b); // 2.50
```
