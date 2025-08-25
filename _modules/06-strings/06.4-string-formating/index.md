---
layout: default
title: 06.4 String Formatting
parent: "Module 06: Strings in Java"
nav_order: 4
---

# String Formatting

String formatting provides a powerful and flexible way to create structured strings by embedding values within a template. Java accomplishes this primarily through the `String.format()` static method and the `System.out.printf()` method, which share the same formatting syntax inherited from C's `printf`.

This approach is highly valuable for producing clean, aligned, and locale-specific output, especially for numbers, dates, and text.

---

## 🔢 Core Concepts: Format Specifiers

The core of Java's formatting is the **format specifier**, which acts as a placeholder in the string. Each specifier starts with a `%` and ends with a **conversion character** that defines the type of data to be formatted.

The basic structure is: `%[flags][width][.precision]conversion`

- `%s`: Formats strings.
- `%d`: Formats decimal integers (byte, short, int, long).
- `%f`: Formats floating-point numbers (float, double).
- `%c`: Formats characters.
- `%b`: Formats booleans.
- `%n`: Inserts a platform-independent newline character.
- `%%`: Inserts a literal percent sign `%`.

### String and Text Blocks

You can use format specifiers within any string, but they are especially readable when combined with Java's **Text Blocks** (introduced in Java 15).

```java
String name = "Alice";
String location = "Wonderland";
int visitCount = 5;

// Using a Text Block as a template
String greetingTemplate = """
Hello, %s!
Welcome to %s.
This is your visit number %d.
""";

// The format method replaces placeholders with actual values
String formattedGreeting = String.format(greetingTemplate, name, location, visitCount);
System.out.println(formattedGreeting);
/*
Hello, Alice!
Welcome to Wonderland.
This is your visit number 5.
*/
```
