---
layout: default
title: 06.1 Strings
parent: "Module 06: Strings in Java"
nav_order: 1
---

# Strings

Most data manipulation in Java involves strings, which are sequences of characters. Java provides a rich set of classes and methods for working with strings, making it easy to perform common tasks such as searching, replacing, and formatting text.
Type:
A string literal is always of type String and represents a reference to an instance of the String class.

Unlike Javascript where string literals can be created with either single or double quotes, in Java, string literals must be enclosed in double quotes.

## Creating Strings: The two ways

Java has two main ways to create strings:

1. String Literals: You can create a string by enclosing text in double quotes.
2. String Objects: You can create a string using the `new` keyword and the `String` constructor.

```java
String str1 = "Hello, World!";
String str2 = new String("Hello, World!");
```

In Java, the distinction between string literals and String objects created with new String() lies primarily in their memory allocation and how they are handled by the Java Virtual Machine (JVM).

### Key Differences Summarized

| Feature             | String Literal ("abc")                 | String Object (new String("abc"))      |
| ------------------- | -------------------------------------- | -------------------------------------- |
| Creation            | Direct assignment                      | Using new keyword                      |
| Memory Location     | String Constant Pool (interned)        | Heap memory (new object each time)     |
| Memory Optimization | Efficient, reuses existing literals    | Less efficient, creates new objects    |
| == Comparison       | Compares references (memory addresses) | Compares references (memory addresses) |
| equals() Comparison | Compares content                       | Compares content                       |

- String literals are generally preferred for efficiency and memory optimization when dealing with fixed string values, as they leverage the String Constant Pool.
- String objects created with new String() are used when a truly distinct object instance is required, even if its content might be identical to another string. However, for most common use cases, string literals are the more efficient and recommended approach.

We will talk about the issues related to string comparison in the next section.

### Escape Sequences

String literals can include escape sequences to represent special characters (e.g., \n for a newline, \t for a tab, \" for a double quote).

```java
public class EscapeSequenceExample {
    public static void main(String[] args) {
        String text = "Hello, World!\nWelcome to Java programming.";
        System.out.println(text);
    }
}
```

### Concatenation

Multiple string literals can be concatenated using the + operator, which results in a new String object.

```java
public class ConcatenationExample {
    public static void main(String[] args) {
        String part1 = "Hello, ";
        String part2 = "World!";
        String message = part1 + part2;
        System.out.println(message);
    }
}
```

### Example

```java
public class StringLiteralExample {
    public static void main(String[] args) {
        // Declaring a string using a string literal
        String greeting = "Hello, World!";
        System.out.println(greeting);

        // String literals are interned and refer to the same object if content is identical
        String s1 = "Java";
        String s2 = "Java";
        System.out.println(s1 == s2); // This will print true due to string interning

        // Concatenating string literals
        String message = "Welcome " + "to " + "Java!";
        System.out.println(message);
    }
}
```

### Common String Methods

Java provides a rich set of methods for manipulating strings. Here are some commonly used string methods:

1. **length()**: Returns the length of the string.

   ```java
   String text = "Hello";
   int length = text.length();
   ```

2. **charAt(int index)**: Returns the character at the specified index.

   ```java
   char firstChar = text.charAt(0);
   ```

3. **substring(int beginIndex, int endIndex)**: Returns a new string that is a substring of the original string.

   ```java
   String sub = text.substring(1, 4);
   ```

4. **indexOf(String str)**: Returns the index of the first occurrence of the specified substring.

   ```java
   int index = text.indexOf("l");
   ```

5. **toUpperCase()**: Converts the string to uppercase.

   ```java
   String upper = text.toUpperCase();
   ```

6. **toLowerCase()**: Converts the string to lowercase.

   ```java
   String lower = text.toLowerCase();
   ```

7. **trim()**: Removes leading and trailing whitespace.

   ```java
   String trimmed = text.trim();
   ```

8. **replace(String oldChar, String newChar)**: Replaces all occurrences of a substring with another substring.

   ```java
   String replaced = text.replace("l", "p");
   ```

9. **split(String regex)**: Splits the string into an array of substrings based on a delimiter.

   ```java
   String[] parts = text.split(" ");
   ```

10. **contains(String str)**: Checks if the string contains the specified substring.

    ```java
    boolean hasHello = text.contains("Hello");
    ```

11. **isEmpty()**: Checks if the string is empty.

    ```java
    boolean isEmpty = text.isEmpty();
    ```

12. **equals(Object anObject)**: Compares the string to another object for equality.

    ```java
    boolean isEqual = text.equals("Hello");
    ```

#### Example

```java
public class StringMethodsExample {
    public static void main(String[] args) {
        String text = " Hello, World! ";

        // isEmpty() expected: false
        boolean isEmpty = text.isEmpty();

        // trim()
        String trimmed = text.trim();

        // equals()
        boolean isEqual = text.equals("Hello");
    }
}
```

### Strings as Arrays

In Java, strings can be treated as arrays of characters. This means you can access individual characters using their index, similar to how you would with an array.

```java
public class StringAsArrayExample {
    public static void main(String[] args) {
        String text = "Hello";
        char firstChar = text.charAt(0); // Accessing the first character
        System.out.println("First character: " + firstChar);// Output: H
        System.out.println(Arrays.toString(text.toCharArray())); // Output: [H, e, l, l, o]
    }
}
```

_Remember no matter how you manipulate a string, the original string object remains unchanged because strings in Java are immutable. Each method call creates and returns a reference to a new string object._
