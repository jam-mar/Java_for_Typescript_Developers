---
layout: default
title: 05.5 Bitwise Operations
parent: "Module 05: Operators and Operands"
nav_order: 5
---

# Bitwise Operations

Java provides bitwise operators that perform operations on individual bits of integer types. These operators work at the binary level and are useful for low-level programming, bit manipulation, and performance optimization.

## Bitwise AND (&)

Performs logical AND on each pair of corresponding bits. Returns 1 only if both bits are 1.

```java
int a = 12;  // 1100 in binary
int b = 10;  // 1010 in binary
int result = a & b;  // 1000 in binary = 8
System.out.println(result); // Output: 8
```

## Bitwise OR (|)

Performs logical OR on each pair of corresponding bits. Returns 1 if at least one bit is 1.

```java
int a = 12;  // 1100 in binary
int b = 10;  // 1010 in binary
int result = a | b;  // 1110 in binary = 14
System.out.println(result); // Output: 14
```

## Bitwise XOR (^)

Performs exclusive OR on each pair of corresponding bits. Returns 1 if bits are different.

```java
int a = 12;  // 1100 in binary
int b = 10;  // 1010 in binary
int result = a ^ b;  // 0110 in binary = 6
System.out.println(result); // Output: 6
```

## Bitwise NOT (~)

Unary operator that inverts all bits. Changes 1 to 0 and 0 to 1.

```java
int a = 12;  // 1100 in binary
int result = ~a;  // ...11110011 in binary = -13
System.out.println(result); // Output: -13
```

## Left Shift (<<)

Shifts bits to the left by specified positions. Equivalent to multiplying by 2^n.

```java
int a = 5;   // 101 in binary
int result = a << 2;  // 10100 in binary = 20
System.out.println(result); // Output: 20
```

## Right Shift (>>)

Shifts bits to the right by specified positions. Preserves sign bit for signed numbers.

```java
int a = 20;  // 10100 in binary
int result = a >> 2;  // 101 in binary = 5
System.out.println(result); // Output: 5

int negative = -20;
int negResult = negative >> 2;  // Sign bit preserved
System.out.println(negResult); // Output: -5
```

## Unsigned Right Shift (>>>)

Shifts bits to the right without preserving the sign bit. Fills with zeros.

```java
int a = -20;
int result = a >>> 2;
System.out.println(result); // Output: 1073741819
```

## Common Use Cases

- **Flags and permissions**: Using bitwise operations to set, clear, and check flags
- **Performance optimization**: Bitwise operations are faster than arithmetic operations
- **Bit manipulation algorithms**: Efficient solutions for certain programming problems
- **Working with binary data**: Processing raw binary data or protocols
