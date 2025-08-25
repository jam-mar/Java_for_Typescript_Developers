---
layout: default
title: 07.1 Conditional Logic
parent: "Module 07: Control Statements"
nav_order: 1
---

## Control Flow: Familiar Territory with Java Twists

Most control flow structures in Java will feel familiar if you're coming from JavaScript or TypeScript. However, there are some key differences and Java-specific features worth highlighting.

---

## Conditional Statements

### If-Else Statements

```java
// Basic if-else (same syntax as JavaScript)
int age = 25;
if (age >= 18) {
    System.out.println("Adult");
} else if (age >= 13) {
    System.out.println("Teenager");
} else {
    System.out.println("Child");
}

// Ternary operator (same as JavaScript)
String status = age >= 18 ? "Adult" : "Minor";

// Multiple conditions
boolean hasLicense = true;
boolean hasInsurance = true;
if (age >= 18 && hasLicense && hasInsurance) {
    System.out.println("Can drive legally");
}
```

{: .note }
**Key Difference:** In Java, the condition must be a `boolean`. You can't use truthy/falsy values like in JavaScript!

```java
// JavaScript: truthy/falsy works
// if (someString) { ... }

// Java: must be explicit boolean
String someString = "hello";
if (someString != null && !someString.isEmpty()) {  // ✅ Correct
    System.out.println("String has content");
}

// if (someString) { ... }  // ❌ Won't compile!
```

### Switch Statements

Java has both traditional switch statements and modern switch expressions.

#### Traditional Switch (Java < 14)

```java
String dayOfWeek = "MONDAY";
String dayType;

switch (dayOfWeek) {
    case "MONDAY":
    case "TUESDAY":
    case "WEDNESDAY":
    case "THURSDAY":
    case "FRIDAY":
        dayType = "Weekday";
        break;  // Important! Prevents fall-through
    case "SATURDAY":
    case "SUNDAY":
        dayType = "Weekend";
        break;
    default:
        dayType = "Invalid day";
        break;
}
```

{: .warning }
**Fall-through Gotcha:** Without `break`, execution continues to the next case! This is different from JavaScript's behavior in many contexts.

#### Modern Switch Expressions (Java 14+)

```java
// Switch expression - more like JavaScript/TypeScript
String dayType = switch (dayOfWeek) {
    case "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY" -> "Weekday";
    case "SATURDAY", "SUNDAY" -> "Weekend";
    default -> "Invalid day";
};

// With yield for complex logic
String workload = switch (dayOfWeek) {
    case "MONDAY" -> {
        System.out.println("Starting the week!");
        yield "Heavy";
    }
    case "FRIDAY" -> {
        System.out.println("Almost weekend!");
        yield "Light";
    }
    default -> "Normal";
};
```
