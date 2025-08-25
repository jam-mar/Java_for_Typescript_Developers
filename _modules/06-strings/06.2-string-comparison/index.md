---
layout: default
title: 06.2 String Comparison
parent: "Module 06: Strings in Java"
nav_order: 2
---

# String Comparison

You can compare strings by reference or by value in Java. Understanding the difference is crucial for proper string handling.

```java
public class StringComparisonExample {
    public static void main(String[] args) {
        String str1 = "Java";
        String str2 = "Java";
        String str3 = new String("Java");

        // Using == to compare references
        System.out.println("Using == to compare references:");
        System.out.println("str1 == str2: " + (str1 == str2)); // true
        System.out.println("str1 == str3: " + (str1 == str3)); // false (str3 is a new object in memory)

        // Using equals() to compare content
        System.out.println("\nUsing equals() to compare content:");
        System.out.println("str1.equals(str2): " + str1.equals(str2)); // true
        System.out.println("str1.equals(str3): " + str1.equals(str3)); // true
    }
}
```

## Comparison Methods

### Reference vs. Content Comparison

In Java, comparing the content of strings is primarily achieved using the `equals()` method or, for case-insensitive comparisons, the `equalsIgnoreCase()` method. The `==` operator should generally be avoided for content comparison as it checks for object reference equality (whether two variables point to the same object in memory), not content equality.

### 1. equals() method

This method compares the character sequences of two strings and returns `true` if they are identical, otherwise `false`. It is case-sensitive.

```java
String str1 = "hello";
String str2 = "hello";
String str3 = "world";

System.out.println(str1.equals(str2)); // true
System.out.println(str1.equals(str3)); // false
```

### 2. equalsIgnoreCase() method

This method is similar to `equals()` but performs a case-insensitive comparison. It returns `true` if the strings are identical, ignoring case differences.

```java
String str1 = "hello";
String str2 = "HELLO";

System.out.println(str1.equalsIgnoreCase(str2)); // true
```

### 3. compareTo() method

This method compares two strings lexicographically (based on Unicode values of characters). It returns an integer value:

- `0` if the strings are equal
- A negative value if the calling string is lexicographically less than the argument string
- A positive value if the calling string is lexicographically greater than the argument string

```java
String str1 = "Apple";
String str2 = "Banana";
String str3 = "Apple";

System.out.println(str1.compareTo(str2)); // A negative value (e.g., -1)
System.out.println(str2.compareTo(str1)); // A positive value (e.g., 1)
System.out.println(str1.compareTo(str3)); // 0
```

### 4. contentEquals() method

This method compares the content of a String with a CharSequence (which can be a String, StringBuffer, or StringBuilder). It is useful when comparing a String with mutable character sequences.

```java
String str = "example";
StringBuffer sb = new StringBuffer("example");

System.out.println(str.contentEquals(sb)); // true
```

## Memory Management in String Comparison

### String Pool

Java employs a memory optimization technique called the "String Pool" (also known as the "String Constant Pool"). When a string literal is encountered, Java first checks if an identical string already exists in the pool. If a match is found, a reference to the existing String object in the pool is returned, promoting memory efficiency by reusing objects. If no match is found, a new String object is created in the pool, and a reference to it is returned.

To compare by reference, you can use the `==` operator, which checks if two references point to the same object in memory. When string literals are declared, Java utilizes a String Literal Pool to optimize memory usage. If identical string literals are encountered, they often refer to the same object in this pool, leading to `==` returning `true`.

```java
String s1 = "Java";
String s2 = "Java";
System.out.println(s1 == s2); // true
```

### New String Objects

Creating a String object using `new String("...")` explicitly creates a new object in memory, even if its content is identical to an existing string literal or another String object.

```java
String s1 = "Java";
String s2 = new String("Java");
System.out.println(s1 == s2); // now this will be false because the new String() creates a different object in memory
```

This can be useful when you want to ensure that you are comparing the actual content of the strings rather than their references.

### Key Takeaway: Content vs. Reference

While `==` checks for reference equality, the `equals()` method is used for content equality (comparing the actual character sequence). For most string comparison scenarios where you need to determine if two strings have the same value, `equals()` is the recommended method.

## Best Practices

1. **Use `equals()` for content comparison** - This is what you want 99% of the time
2. **Use `equalsIgnoreCase()` for case-insensitive comparisons** - This is useful when you want to compare strings without considering their case
3. **Use `compareTo()` for sorting or ordering strings**
4. **Avoid `==` for string content comparison** - Only use it when you specifically need reference equality
5. **Consider null safety** - Use `Objects.equals(str1, str2)` or check for null before calling `equals()`
