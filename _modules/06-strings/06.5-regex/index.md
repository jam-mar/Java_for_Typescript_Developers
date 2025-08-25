---
layout: default
title: 06.5 Regular Expressions
parent: "Module 06: Strings in Java"
nav_order: 5
---

# Regular Expressions

While regular expressions (regex) in JavaScript and Java share a common foundation, there are key differences in their implementation, API, and available features.

---

## 1. Global Flag (JavaScript Specific)

**JavaScript:**

- Features the `g` (global) flag, which allows a regex to find all matches within a string, rather than stopping after the first match.
- Applied directly to the regex literal: `/pattern/g`.

**Java:**

- Does not have a direct equivalent flag.
- To find all matches, you must create a `Matcher` object and repeatedly call its `find()` method within a loop.

---

## 2. Lookbehind Assertions

**JavaScript (ES2018+):**

- **Fully supports** both positive lookbehind `(?<=...)` and negative lookbehind `(?<!...)`.
- This feature is now standard in all modern JavaScript environments.

**Java:**

- Has long offered robust, full support for both positive and negative lookbehind assertions.

---

## 3. Unicode and POSIX Character Classes

**Java:**

- Supports POSIX character classes like `\p{Alpha}`, `\p{Digit}`, and `\p{sc=Greek}` for matching specific Unicode character properties.

**JavaScript (ES2018+):**

- **Also supports** these via **Unicode property escapes**, which have the same `\p{...}` syntax.
- To enable this feature, the regex must use the `u` (unicode) flag. For example: `/\p{Alpha}/u`.

---

## 4. API and Class Structure

**Java:**

- Uses a formal, object-oriented API with the `java.util.regex` package.
- Relies on two main classes: `Pattern` (for compiling a regex) and `Matcher` (for performing match operations on a string).

**JavaScript:**

- Uses the built-in `RegExp` object for creating and manipulating regular expressions.
- Functionality is also integrated directly into `String` methods like `.match()`, `.replace()`, `.search()`, and `.split()`.

---

## 5. Backtracking Control

**Java:**

- Offers advanced features for controlling the regex engine's backtracking behavior, such as **atomic groups** `(?>...)` and **possessive quantifiers** `*+`, `++`.
- These are crucial for optimizing performance on complex patterns and preventing ReDoS (Regular Expression Denial of Service) attacks.

**JavaScript:**

- Has limited native control over backtracking and does not support atomic groups or possessive quantifiers.
- This can make it more susceptible to ReDoS vulnerabilities with inefficiently written, complex patterns.

---

## Summary

While the core regex syntax is largely consistent, the implementation philosophies differ. Java provides a powerful, feature-rich API with fine-grained control, especially for performance-critical applications. JavaScript's implementation is simpler and more tightly integrated with string methods. Although historically lagging, modern JavaScript has closed the feature gap significantly by adding full support for lookbehind and Unicode property escapes.
