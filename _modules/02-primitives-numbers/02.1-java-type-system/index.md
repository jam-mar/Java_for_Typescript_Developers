---
layout: default
title: 02.1 Java Type System
parent: "Module 02: Primitives & Numbers"
nav_order: 1
---

## Understanding Java's Type System

Java has two categories of types that work very differently:

### 1. Primitive Types (Value Types)

Stored directly on the stack, not objects, represent simple values.

| Type      | Size    | Range                           | JS Equivalent     |
| --------- | ------- | ------------------------------- | ----------------- |
| `byte`    | 1 byte  | -128 to 127                     | `number` (subset) |
| `short`   | 2 bytes | -32,768 to 32,767               | `number` (subset) |
| `int`     | 4 bytes | -2,147,483,648 to 2,147,483,647 | `number` (subset) |
| `long`    | 8 bytes | Very large integers             | `BigInt`          |
| `float`   | 4 bytes | 6-7 decimal digits precision    | `number` (subset) |
| `double`  | 8 bytes | 15-16 decimal digits precision  | `number`          |
| `boolean` | 1 bit   | `true` or `false`               | `boolean`         |
| `char`    | 2 bytes | Single Unicode character        | `string` (len 1)  |

### 2. Reference Types (Object Types)

Stored on the heap, includes `String`, arrays, and all custom classes.

```java
// Primitives - stored as values
int age = 25;
boolean isActive = true;

// Reference types - stored as object references
String name = "John";        // String is an object!
Integer boxedAge = 25;       // Wrapper class for int
```

---

## Variable Declaration and Naming

### Basic Variable Declaration

```java
// Basic syntax: [modifiers] type variableName = value;

// Primitive variables
int age = 25;
double price = 99.99;
boolean isActive = true;
char grade = 'A';

// Reference variables
String name = "John";
Integer boxedAge = 25;

// Constants (like const in JavaScript)
final String API_KEY = "secret123";
final int MAX_USERS = 1000;

// Multiple declarations
int x = 5, y = 10, z = 15;
int a, b, c; // Declare without initialization
a = b = c = 100; // Chain assignment
```

### Java Identifier Rules

Variable, method, and class names must follow these rules:

1. **Must start with:** letter, underscore (\_), or dollar sign ($)
2. **Can contain:** letters, digits, underscores, dollar signs
3. **Cannot be:** reserved keywords (`class`, `public`, `static`, etc.)
4. **Case-sensitive:** `myVar` and `myvar` are different

### Naming Conventions

Java has strict naming conventions that you should always follow:

- **camelCase:** Variables and methods → `myVariable`, `calculateTotal()`
- **PascalCase:** Class names → `MyClass`, `UserProfile`
- **SCREAMING_SNAKE_CASE:** Constants → `MAX_VALUE`, `API_KEY`

---

<div class="navigation-buttons">
    <div></div>
    <a href="{% link _modules/02-primitives-numbers/02.2-primitive-types-variables/index.md %}" class="btn btn-primary btn-nav btn-nav-next">Next: 2.2 Primitive Types →</a>
</div>
{: .fs-2 }
