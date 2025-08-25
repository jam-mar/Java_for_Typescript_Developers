---
layout: default
title: 06.3 Escape Sequences
parent: "Module 06: Strings in Java"
nav_order: 3
---

# Escape Sequences

Like Javascript you can use the backslash in Java to escape special characters in strings. Here are some common escape sequences:

- `\'` - Single quote
- `\"` - Double quote
- `\\` - Backslash
- `\n` - New line
- `\t` - Tab
- `\b` - Backspace
- `\r` - Carriage return

Example:

```java
String str = "He said, \"Hello, World!\"\nThis is a new line.";
System.out.println(str);
```

Output:

```
He said, "Hello, World!"
This is a new line.
```

## Key Differences from JavaScript

### 1. Octal Escape Sequences

Java supports octal escape sequences (e.g., `\123`), while JavaScript has deprecated them in strict mode:

```java
String octalExample = "Character: \101"; // Represents 'A'
System.out.println(octalExample); // Output: Character: A
```

### 2. Template Literals

JavaScript has template literals with `${}` syntax, but Java doesn't support this:

```javascript
// JavaScript - NOT available in Java
const name = "World";
const greeting = `Hello, ${name}!`;
```

In Java, you must use string concatenation or formatting methods instead.

### 3. Raw Strings

Java doesn't have raw string literals like JavaScript's template literals. All escape sequences are always processed.

## Unicode

Java has robust Unicode support, allowing you to represent characters from various languages and scripts. You can use Unicode escape sequences to include special characters in your strings.

A Unicode escape sequence is represented by `\u` followed by exactly four hexadecimal digits representing the character's Unicode code point.

### Unicode Examples

```java
String unicodeStr = "Unicode example: \u00A9 \u0041\u0042\u0043";
System.out.println(unicodeStr);
```

Output:

```
Unicode example: © ABC
```

### More Unicode Examples

```java
// Various Unicode characters
String symbols = "Greek: \u03B1\u03B2\u03B3"; // αβγ
String emoji = "Smiley: \u263A"; // ☺
String chinese = "Chinese: \u4E2D\u6587"; // 中文

System.out.println(symbols);
System.out.println(emoji);
System.out.println(chinese);
```

### Unicode vs JavaScript

JavaScript supports Unicode similarly but also allows:

- `\u{...}` syntax for code points beyond the Basic Multilingual Plane
- Surrogate pairs for characters above U+FFFF

Java handles characters above U+FFFF using surrogate pairs automatically, but the escape sequence syntax is limited to `\uXXXX` format.

## String Literal Restrictions

Unlike JavaScript, Java string literals:

- Cannot span multiple lines without escape sequences
- Must use `+` for concatenation across lines
- Process all escape sequences (no raw string equivalent)

```java
// Multi-line strings require explicit line breaks
String multiLine = "First line\n" +
                  "Second line\n" +
                  "Third line";
```

## Text Blocks

Java text blocks, standardized in JDK 15 (introduced as a preview feature in JDK 13), provide a convenient way to represent multi-line string literals in Java code. They simplify the creation of strings that span multiple lines and often contain special characters or structured text like HTML, JSON, or SQL queries, reducing the need for explicit escape sequences and concatenation.

In a text block, you don't need to escape newlines or use concatenation (+) for multiple lines. You also don't need to escape double quotes ("), only triple quotes ("""). This feature makes Java more competitive with JavaScript's template literals for handling large blocks of text.A text block starts with three double-quotes """ followed by a newline, and ends with three double-quotes. They address some of the limitations mentioned in the article.

```Java
String multiLine = """
First line
Second line
Third line
""";
```

### Delimiter:

A text block begins and ends with three double-quote characters ("""). The opening delimiter must be followed by a line terminator.
Multi-line support:
Text blocks are designed for multi-line strings, allowing content to be written across multiple lines without requiring \n or other line break escape sequences.

### Whitespace handling:

Incidental whitespace: Leading whitespace that is common to all non-blank lines within the text block is automatically removed, ensuring consistent indentation.
Trailing whitespace: All trailing whitespace on each line within the text block is automatically removed.

### Escape sequences:

Text blocks largely eliminate the need for common escape sequences like \n for newlines and \" for double quotes within the string. However, a backslash can still be used to escape characters or to prevent a line break in the resulting string when wrapping long lines in the code.

### Readability:

Text blocks significantly improve the readability of code containing complex, multi-line string literals by preserving the original formatting and reducing visual clutter from escape sequences.
Example:

```Java
String htmlContent = """
<html>
<body>
<h1>Hello, Java Text Blocks!</h1>
</body>
</html>
""";
System.out.println(htmlContent);

/// Output:
/// <html>
/// <body>
/// <h1>Hello, Java Text Blocks!</h1>
/// </body>
/// </html>
```
