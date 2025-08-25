---
layout: default
title: 05.3 Logical Operators
parent: "Module 05: Operators and Operands"
nav_order: 3
---

# Logical Operators

Logical operators are used to combine multiple boolean expressions. In Java, the primary logical operators are:

- **Logical AND (`&`)**: Returns true if both operands are true (evaluates both operands).
- **Logical Short Circuit AND (`&&`)**: Returns true if both operands are true (stops evaluation if first operand is false).
- **Logical OR (`|`)**: Returns true if at least one operand is true (evaluates both operands).
- **Logical Short Circuit OR (`||`)**: Returns true if at least one operand is true (stops evaluation if first operand is true).
- **Logical NOT (`!`)**: Reverses the logical state of its operand.
- **Logical XOR (`^`)**: Returns true if one of the operands is true.

## Example

```java
- **Logical AND (`&`)**: Returns true if both operands are true (evaluates both operands).
- **Logical Short Circuit AND (`&&`)**: Returns true if both operands are true (stops evaluation if first operand is false).
- **Logical OR (`|`)**: Returns true if at least one operand is true (evaluates both operands).
- **Logical Short Circuit OR (`||`)**: Returns true if at least one operand is true (stops evaluation if first operand is true).
- **Logical NOT (`!`)**: Reverses the logical state of its operand.
```

- **Logical XOR (`^`)**: Returns true if one of the operands is true.

## Example

```java
boolean a = true;
boolean b = false;
boolean c = a && b; // c is false
boolean d = a || b; // d is true
boolean e = !a;     // e is false
```

Note in the following example that attempting to evaluate both operands in a logical AND operation with a single `&` or the single or `|` can lead to unexpected behavior if the first operand is false:

```java
System.out.println(false & (5 / 0 == 0));// runtime error because the and operator returns true only if both operands are true.
System.out.println(false && (5 / 0 == 0));// prints false, because the first operand is false so the second operand is not evaluated.
System.out.println(true | (5 / 0 == 0));// runtime error because the or operator returns true if at least one operand is true so the second operand can not be evaluated.
System.out.println(true || (5 / 0 == 0));// prints true, because the first operand is true so the second operand is not evaluated.
```

In Javascript

```javascript
console.log(true & (5 / 0 == 0)); // returns 0 because true is coerced to 1 and (5 / 0 == 0) is also coerced to 0, so logical AND is 1 & 0 = 0
console.log(false && 5 / 0 == 0); // prints false, because the first operand is false so the second operand is not evaluated.
console.log(true | (5 / 0 == 0)); // returns 1 because true is coerced to 1 and (5 / 0 == 0) is also coerced to 0, so the result of logical OR is 1 | 0 = 1
console.log(true || 5 / 0 == 0); // prints true, because the first operand is true so the second operand is not evaluated.
```

Therefore it is good practice to use the short-circuit operators (`&&` and `||`) in situations where the second operand may cause an error if evaluated.

In this example, the logical operators are used to combine and manipulate boolean values.
