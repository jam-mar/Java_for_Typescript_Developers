---
layout: default
title: 1.1 The Language
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
final List<String> items = new ArrayList<>(); // List is final, but contents can change
```

### Primitive vs Reference Types Quick Guide

| JavaScript | Java Primitive            | Java Reference      |
| ---------- | ------------------------- | ------------------- |
| `number`   | `int`, `double`, `float`  | `Integer`, `Double` |
| `string`   | `char` (single character) | `String`            |
| `boolean`  | `boolean`                 | `Boolean`           |

{: .warning }
**Gotcha Alert:** `String` in Java is a reference type, not a primitive. This means `==` compares references, not values. Use `.equals()` for value comparison!

```java
String a = "hello";
String b = "hello";
String c = new String("hello");

System.out.println(a == b);       // true (string literals are interned)
System.out.println(a == c);       // false (different objects)
System.out.println(a.equals(c));  // true (same value)
```

---

## Hello World

Go to [w3schools](https://www.w3schools.com/java/tryjava.asp?filename=demo_helloworld)

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

To compile and run this program locally

1. Go to the code_examples [Java folder](https://github.com/jam-mar/Java_for_TypeScript_Developers/tree/main/code_examples/01-java-foundations/01-the-language).
2. You will see the `Main.java` file.
3. Compile the program using the command: `javac Main.java`. A `Main.class` file will be generated.
4. Run the program using the command: `java Main`
5. You should see the output: `Hello World`

## Object-Oriented Programming: Structure and Encapsulation

### Classes and Objects

```java
// A simple Java class
public class User {
    // Instance variables (fields)
    private String name;
    private int age;
    private boolean isActive;

    // Constructor
    public User(String name, int age) {
        this.name = name;
        this.age = age;
        this.isActive = true;
    }

    // Getter methods
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    // Setter methods
    public void setAge(int age) {
        if (age >= 0) {
            this.age = age;
        }
    }

    // Instance method
    public void activate() {
        this.isActive = true;
    }
}
```

### JavaScript/TypeScript Comparison

```typescript
// TypeScript class (similar structure)
class User {
  private name: string;
  private age: number;
  private isActive: boolean = true;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  getName(): string {
    return this.name;
  }

  setAge(age: number): void {
    if (age >= 0) {
      this.age = age;
    }
  }

  activate(): void {
    this.isActive = true;
  }
}
```

{: .highlight }
The structure is remarkably similar! Java just requires explicit access modifiers (`public`, `private`) and type declarations everywhere.

---

## Access Modifiers: Controlling Visibility

| Modifier                | Visibility                | JavaScript Equivalent            |
| ----------------------- | ------------------------- | -------------------------------- |
| `private`               | Same class only           | `#privateField` (private fields) |
| `default` (no modifier) | Same package              | Module-level exports             |
| `protected`             | Same package + subclasses | No direct equivalent             |
| `public`                | Everywhere                | `export`                         |

```java
public class BankAccount {
    private double balance;           // Only this class can access
    protected String accountType;     // This class and subclasses
    public String accountNumber;      // Anyone can access
    String bankName;                  // Package-private (default)
}
```

---

## Methods: Functions with Structure

### Method Syntax

```java
// Method structure: [modifiers] returnType methodName(parameters) { body }
public static void main(String[] args) {
    // Static method - belongs to the class, not instance
}

public String getFormattedName() {
    // Instance method - needs an object to be called
    return this.name.toUpperCase();
}

private void validateAge(int age) {
    // Private helper method
    if (age < 0) {
        throw new IllegalArgumentException("Age cannot be negative");
    }
}
```

### Method Overloading

```java
public class Calculator {
    // Same method name, different parameters
    public int add(int a, int b) {
        return a + b;
    }

    public double add(double a, double b) {
        return a + b;
    }

    public int add(int a, int b, int c) {
        return a + b + c;
    }
}
```

{: .note }
**TypeScript Connection:** This is like having multiple function signatures in TypeScript, but Java chooses the method at compile time based on the argument types.

---

## Inheritance: Building on Existing Code

```java
// Base class
public abstract class Vehicle {
    protected String brand;
    protected int year;

    public Vehicle(String brand, int year) {
        this.brand = brand;
        this.year = year;
    }

    // Abstract method - must be implemented by subclasses
    public abstract void start();

    // Concrete method - inherited by all subclasses
    public void displayInfo() {
        System.out.println(brand + " " + year);
    }
}

// Derived class
public class Car extends Vehicle {
    private int doors;

    public Car(String brand, int year, int doors) {
        super(brand, year); // Call parent constructor
        this.doors = doors;
    }

    @Override
    public void start() {
        System.out.println("Car engine started");
    }

    // Method overriding
    @Override
    public void displayInfo() {
        super.displayInfo(); // Call parent method
        System.out.println("Doors: " + doors);
    }
}
```

### Interfaces: Contracts for Classes

```java
// Interface defines what a class can do
public interface Drawable {
    void draw(); // Implicitly public and abstract

    // Default method (Java 8+)
    default void highlight() {
        System.out.println("Highlighting...");
    }

    // Static method (Java 8+)
    static void printVersion() {
        System.out.println("Drawing API v2.0");
    }
}

// Class implementing interface
public class Circle implements Drawable {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    public void draw() {
        System.out.println("Drawing circle with radius: " + radius);
    }
}
```

---

## Control Flow: Familiar Territory

### Conditional Statements

```java
// If-else (same as JavaScript)
if (age >= 18) {
    System.out.println("Adult");
} else if (age >= 13) {
    System.out.println("Teenager");
} else {
    System.out.println("Child");
}

// Switch statement (enhanced in Java 14+)
switch (dayOfWeek) {
    case "MONDAY":
    case "TUESDAY":
        System.out.println("Weekday");
        break;
    case "SATURDAY":
    case "SUNDAY":
        System.out.println("Weekend");
        break;
    default:
        System.out.println("Invalid day");
}

// Switch expression (Java 14+) - more like JavaScript
String dayType = switch (dayOfWeek) {
    case "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY" -> "Weekday";
    case "SATURDAY", "SUNDAY" -> "Weekend";
    default -> "Invalid day";
};
```

### Loops

```java
// Traditional for loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// Enhanced for loop (for-each) - like for...of in JavaScript
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
for (String name : names) {
    System.out.println(name);
}

// While loop (same as JavaScript)
while (condition) {
    // loop body
}
```

---

## Hands-On Practice

{: .important }
**Try This:** Create a simple `BankAccount` class with the following requirements:

1. Private fields for `balance` and `accountNumber`
2. Constructor that sets initial balance and account number
3. Methods for `deposit()`, `withdraw()`, and `getBalance()`
4. Validation to prevent negative balances

```java
public class BankAccount {
    // Your implementation here
    private double balance;
    private String accountNumber;

    public BankAccount(String accountNumber, double initialBalance) {
        // TODO: Implement constructor
    }

    public void deposit(double amount) {
        // TODO: Implement deposit logic
    }

    public boolean withdraw(double amount) {
        // TODO: Implement withdraw logic with validation
        // Return true if successful, false otherwise
    }

    public double getBalance() {
        // TODO: Return current balance
    }
}
```

<details>
<summary>💡 Click to see solution</summary>

```java
public class BankAccount {
    private double balance;
    private String accountNumber;

    public BankAccount(String accountNumber, double initialBalance) {
        this.accountNumber = accountNumber;
        this.balance = initialBalance >= 0 ? initialBalance : 0;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            this.balance += amount;
        }
    }

    public boolean withdraw(double amount) {
        if (amount > 0 && amount <= this.balance) {
            this.balance -= amount;
            return true;
        }
        return false;
    }

    public double getBalance() {
        return this.balance;
    }

    @Override
    public String toString() {
        return String.format("BankAccount{number='%s', balance=%.2f}",
                           accountNumber, balance);
    }
}
```

</details>

---

## Key Takeaways

{: .highlight-title }

> Main Concepts to Remember
>
> 1. **Static Typing**: Types are checked at compile time, preventing many runtime errors
> 2. **Explicit Access Control**: Use `private`, `protected`, and `public` to control visibility
> 3. **Object-Oriented Structure**: Everything is organized into classes and objects
> 4. **Inheritance and Interfaces**: Build complex systems through well-defined contracts
> 5. **Compile-Time Safety**: The compiler is your friend - it catches errors early

{: .warning }
**Common Pitfalls for JS/TS Developers:**

- Forgetting to use `.equals()` for string comparison
- Mixing up static and instance methods
- Not understanding the difference between primitives and objects
- Forgetting that arrays and collections need explicit type declarations

---

## What's Next?

Now that you understand Java's core language features, you're ready to explore the broader ecosystem. In [Lesson 1.2: The Ecosystem]({% link _modules/01-java-foundations/02-the-ecosystem.md %}), we'll dive into:

- How the JVM works compared to the Node.js event loop
- Build tools (Maven/Gradle) vs package managers (npm/yarn)
- The Java Development Kit (JDK) and runtime environment

The language foundation you've just learned will serve as the bedrock for everything we build in this course!

---

{: .fs-2 }
[Previous: Module 1 Overview]({% link _modules/01-java-foundations/index.md %}){: .btn .btn-outline }
[Next: Lesson 1.2 - The Ecosystem]({% link _modules/01-java-foundations/02-the-ecosystem.md %}){: .btn .btn-primary }
