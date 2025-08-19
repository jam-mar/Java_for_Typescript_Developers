---
layout: default
title: 1.1 Java Basics - Types, Variables & Syntax
parent: "Module 1: Java Foundations"
nav_order: 1
---

## Welcome to Java! 🚀

Coming from JavaScript or TypeScript, you're about to enter a world that's both familiar and refreshingly different. Java brings **compile-time safety**, **explicit types**, and **structured object-orientation** that will make your backend code more predictable and maintainable.

{: .highlight }
**Key Mindset Shift:** In JavaScript, you discover errors at runtime. In Java, you catch most errors at compile time. This trade-off of initial verbosity for long-term reliability is Java's superpower.

---

## Static vs Dynamic Typing: Your New Safety Net

### The JavaScript Way (Dynamic)

```javascript
// JavaScript - Types determined at runtime
let user = "John";
user = { name: "John", age: 30 }; // ✅ Works fine
user = 42; // ✅ Also works fine
console.log(user.name); // 💥 Runtime error if user is 42
```

### The Java Way (Static)

```java
// Java - Types declared and enforced at compile time
String user = "John";
// user = 42; // ❌ Compile error! Cannot assign int to String

// If you need different types, be explicit
Object user = "John";
user = 42; // ✅ Now this works, but you lose type safety
```

{: .note }
**TypeScript Connection:** If you've used TypeScript, Java's type system will feel familiar but more strict. Java doesn't have `any` or gradual typing - it's all or nothing!

---

## Variables and Primitive Types

### Declaring Variables

```java
// Java variable declarations follow: [modifiers] type variableName = value;

// Primitives (stored on the stack, not objects)
int age = 25;
double price = 99.99;
boolean isActive = true;
char grade = 'A';

// Reference types (stored on the heap, are objects)
String name = "John";
Integer boxedAge = 25; // Wrapper class for int

// Final variables (like const in JavaScript)
final String API_KEY = "secret123";
// API_KEY = "newSecret"; // ❌ Compile error! Cannot reassign final variable
final List<String> items = new ArrayList<>(); // Reference is final, but contents can change

// Multiple variable declarations
int x = 5, y = 10, z = 15;
int a, b, c; // Declare without initialization
a = b = c = 5; // Chain assignment
```

### Java Identifier Rules

Java identifiers (names for variables, methods, classes, etc.) must follow these rules:

1. Must start with a letter, underscore (\_), or dollar sign ($)
2. Can contain letters, digits, underscores, and dollar signs
3. Cannot be a reserved keyword (e.g., `class`, `public`, `static`)
4. Case-sensitive (e.g., `myVar` and `myvar` are different)

### Naming Conventions

1. **camelCase**: Variables and methods (e.g., `myVariable`, `calculateTotal`)
2. **PascalCase**: Class names (e.g., `MyClass`, `UserProfile`)
3. **UPPERCASE**: Constants (e.g., `MAX_VALUE`, `API_KEY`)

---

## Primitive Data Types

| Data Type | Size    | Range                                                   | JavaScript Equivalent |
| --------- | ------- | ------------------------------------------------------- | --------------------- |
| `byte`    | 1 byte  | -128 to 127                                             | `number` (subset)     |
| `short`   | 2 bytes | -32,768 to 32,767                                       | `number` (subset)     |
| `int`     | 4 bytes | -2,147,483,648 to 2,147,483,647                         | `number` (subset)     |
| `long`    | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | `BigInt`              |
| `float`   | 4 bytes | 6-7 decimal digits precision                            | `number` (subset)     |
| `double`  | 8 bytes | 15-16 decimal digits precision                          | `number`              |
| `boolean` | 1 bit   | `true` or `false`                                       | `boolean`             |
| `char`    | 2 bytes | Single Unicode character                                | `string` (length 1)   |

### Literal Values

```java
// Integer literals
int decimal = 42;
int binary = 0b101010;  // Binary literal (Java 7+)
int octal = 052;        // Octal literal
int hex = 0x2A;         // Hexadecimal literal
long bigNumber = 42L;   // Long literal (L suffix)

// Floating-point literals
float pi = 3.14F;       // Float literal (F suffix required)
double e = 2.718;       // Double literal (default for decimals)
double scientific = 1.23e-4; // Scientific notation

// Character literals
char letter = 'A';
char unicode = '\u0041'; // Unicode escape (also 'A')
char newline = '\n';     // Escape sequences

// Boolean literals
boolean isTrue = true;
boolean isFalse = false;
```

---

## String Type and Operations

{: .warning }
**Gotcha Alert:** `String` in Java is a reference type, not a primitive. Strings are immutable - operations create new String objects!

```java
String greeting = "Hello";
String name = "World";

// String concatenation
String message = greeting + ", " + name + "!"; // Creates new String objects

// String comparison - NEVER use == for content comparison!
String a = "hello";
String b = "hello";
String c = new String("hello");

System.out.println(a == b);       // true (string literals are interned)
System.out.println(a == c);       // false (different objects)
System.out.println(a.equals(c));  // true (same content) ✅ Use this!
```

### Common String Methods

```java
String text = "  Hello World  ";

// Length and character access
text.length();           // 15 (includes spaces)
text.charAt(2);          // 'H'

// Case conversion
text.toUpperCase();      // "  HELLO WORLD  "
text.toLowerCase();      // "  hello world  "

// Whitespace handling
text.trim();            // "Hello World"
text.strip();           // "Hello World" (Java 11+, handles Unicode)

// Substring operations
text.substring(2, 7);   // "Hello" (start inclusive, end exclusive)
text.substring(2);      // "Hello World  " (from index to end)

// Search operations
text.indexOf("World");  // 8
text.contains("Hello"); // true
text.startsWith("  H"); // true
text.endsWith("  ");    // true

// String replacement
text.replace(" ", "_"); // "__Hello_World__"
text.replaceAll("\\s+", "_"); // "_Hello_World_" (regex)

// String splitting
String csv = "apple,banana,cherry";
String[] fruits = csv.split(","); // ["apple", "banana", "cherry"]
```

---

## Type Casting and Conversion

### Implicit Widening (Automatic)

```java
// Smaller types automatically convert to larger types
int smallInt = 42;
long bigInt = smallInt;     // int → long
double decimal = bigInt;    // long → double

// Casting hierarchy: byte → short → int → long → float → double
//                           char → int
```

### Explicit Narrowing (Manual)

```java
// Must explicitly cast when going from larger to smaller type
double pi = 3.14159;
int approximation = (int) pi;  // 3 (truncation, not rounding!)

// Be careful with data loss
long bigValue = 2147483648L;   // Bigger than int range
int overflow = (int) bigValue; // -2147483648 (overflow!)

// Safe casting with bounds checking
if (bigValue <= Integer.MAX_VALUE && bigValue >= Integer.MIN_VALUE) {
    int safeValue = (int) bigValue;
}
```

### String Conversions

```java
// Primitive to String
int number = 42;
String str1 = String.valueOf(number);  // "42" (preferred)
String str2 = Integer.toString(number); // "42"
String str3 = "" + number;             // "42" (works but not ideal)

// String to primitive
String numberStr = "123";
int parsed = Integer.parseInt(numberStr);     // 123
double parsedDouble = Double.parseDouble("3.14"); // 3.14

// Handle parsing errors
try {
    int invalid = Integer.parseInt("not a number");
} catch (NumberFormatException e) {
    System.out.println("Invalid number format");
}
```

---

## Your First Java Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        // Variables and basic operations
        String name = "Java Developer";
        int year = 2024;
        double version = 21.0;

        System.out.println("Welcome, " + name);
        System.out.printf("Java %,.1f in %d%n", version, year);

        // Basic input (we'll cover Scanner later)
        if (args.length > 0) {
            System.out.println("Command line argument: " + args[0]);
        }
    }
}
```

### Running Your Program

1. Save as `HelloWorld.java` (filename must match class name!)
2. Compile: `javac HelloWorld.java` (creates `HelloWorld.class`)
3. Run: `java HelloWorld` (note: no `.class` extension)

{: .note }
**Key Differences from JavaScript:**

- Every executable statement must be inside a class
- Class names must match filename (case-sensitive)
- `main` method is the entry point (like a special function)
- Semicolons are mandatory
- Case-sensitive throughout

---

## Hands-On Practice

{: .important }
**Try This:** Create a variable showcase program that demonstrates different types and operations:

```java
public class VariableShowcase {
    public static void main(String[] args) {
        // TODO: Create variables of different primitive types
        // TODO: Perform type casting operations
        // TODO: Demonstrate String operations
        // TODO: Show the difference between == and .equals() for Strings

        System.out.println("Variable Showcase Complete!");
    }
}
```

<details markdown="1">
<summary>💡 Click to see solution</summary>

```java
public class VariableShowcase {
    public static void main(String[] args) {
        // Primitive types demonstration
        byte smallByte = 127;
        short smallShort = 32000;
        int regularInt = 2_000_000; // Underscores for readability (Java 7+)
        long bigLong = 9_000_000_000L;

        float pi = 3.14159F;
        double e = 2.718281828;

        boolean isJavaFun = true;
        char firstLetter = 'J';

        // Type casting demonstration
        System.out.println("=== Type Casting ===");
        double decimal = 9.87;
        int truncated = (int) decimal;  // Explicit casting
        System.out.printf("%.2f truncated to int: %d%n", decimal, truncated);

        // Implicit casting
        int smallerNumber = 42;
        double largerNumber = smallerNumber; // Automatic widening
        System.out.printf("int %d becomes double %.1f%n", smallerNumber, largerNumber);

        // String operations demonstration
        System.out.println("=== String Operations ===");
        String greeting = "Hello";
        String target = "Java";
        String message = greeting + ", " + target + "!";
        System.out.println("Concatenated: " + message);

        // String comparison gotcha
        String str1 = "test";
        String str2 = "test";
        String str3 = new String("test");

        System.out.println("str1 == str2: " + (str1 == str2));         // true
        System.out.println("str1 == str3: " + (str1 == str3));         // false
        System.out.println("str1.equals(str3): " + str1.equals(str3)); // true

        // String methods showcase
        String sample = "  Java Programming  ";
        System.out.println("Original: '" + sample + "'");
        System.out.println("Trimmed: '" + sample.trim() + "'");
        System.out.println("Upper: '" + sample.toUpperCase() + "'");
        System.out.println("Length: " + sample.length());

        System.out.println("Variable Showcase Complete!");
    }
}
```

</details>

---

## Key Takeaways

{: .highlight-title }

> Essential Concepts
>
> 1. **Static Typing**: All variables must have declared types, checked at compile time
> 2. **Primitive vs Reference**: Primitives are values, objects are references
> 3. **String Gotchas**: Use `.equals()` for content comparison, not `==`
> 4. **Type Safety**: Explicit casting required when narrowing types
> 5. **Immutability**: Strings are immutable - operations create new objects

---

## What's Next?

In **1.2 Control Flow & Arrays**, we'll explore:

- Conditional statements and loops (focusing on Java-specific differences)
- Array declaration, initialization, and manipulation
- Enhanced for loops and iteration patterns
- Common pitfalls when coming from JavaScript

---

{: .fs-2 }
[Next: 1.2 Control Flow & Arrays](1.2-control-flow-arrays.md){: .btn .btn-primary }
