---
layout: default
title: 07.1 Conditional Logic
parent: "Module 07: Control Statements"
nav_order: 1
---

# Conditional Logic: Making Decisions in Java

Control flow in Java shares many similarities with JavaScript and TypeScript, but with some important distinctions around type safety and boolean evaluation. Let's explore how to make decisions in your Java programs.

---

## If-Else Statements

### Basic Conditional Logic

```java
// Simple if-else structure
int temperature = 75;
if (temperature > 80) {
    System.out.println("It's hot outside!");
} else if (temperature > 60) {
    System.out.println("Nice weather today.");
} else if (temperature > 32) {
    System.out.println("It's cool outside.");
} else {
    System.out.println("Freezing!");
}
```

_Note: Whist is possible to write if / else statements without curly braces, it's a good practice to use them for clarity._

```java
// Ternary operator for simple assignments
String weatherDescription = temperature > 70 ? "warm" : "cool";
System.out.println("Today feels " + weatherDescription);
```

### Boolean Expressions and Logical Operators

```java
int age = 25;
boolean hasLicense = true;
boolean hasInsurance = true;
double bankBalance = 15000.0;

// Logical AND (&&)
if (age >= 18 && hasLicense && hasInsurance) {
    System.out.println("Eligible to rent a car");
}

// Logical OR (||)
if (age < 16 || !hasLicense) {
    System.out.println("Cannot drive alone");
}

// Logical NOT (!)
if (!hasInsurance) {
    System.out.println("Need to get insurance first");
}

// Complex boolean expressions
if ((age >= 25 || bankBalance > 10000) && hasLicense) {
    System.out.println("Qualified for premium car rental");
}
```

{: .note }
**Type Safety:** Java requires boolean expressions in conditionals. Unlike JavaScript, you cannot use truthy/falsy values directly.

### Java vs JavaScript: Boolean Evaluation

```java
// JavaScript allows truthy/falsy values:
// if (someString) { ... }        // Works in JS
// if (someNumber) { ... }        // Works in JS
// if (someObject) { ... }        // Works in JS

// Java requires explicit boolean conversion:
String message = "Hello";
int count = 5;
Object obj = new Object();

// Correct Java approach
if (message != null && !message.isEmpty()) {      // ✅ Explicit null/empty check
    System.out.println("Message exists");
}

if (count > 0) {                                  // ✅ Explicit numeric comparison
    System.out.println("Count is positive");
}

if (obj != null) {                                // ✅ Explicit null check
    System.out.println("Object exists");
}

// These won't compile in Java:
// if (message) { ... }                           // ❌ Compilation error
// if (count) { ... }                             // ❌ Compilation error
// if (obj) { ... }                               // ❌ Compilation error
```

### Nested Conditionals and Code Organization

```java
// Well-structured nested conditionals
public class UserValidator {
    public static String validateUser(int age, String email, boolean hasConsent) {
        // Early returns for cleaner code
        if (age < 13) {
            return "User too young";
        }

        if (email == null || email.isEmpty() || !email.contains("@")) {
            return "Invalid email address";
        }

        if (age < 18) {
            if (!hasConsent) {
                return "Parental consent required";
            }
            return "Minor user approved with consent";
        }

        return "Adult user approved";
    }
}
```

---

## Switch Statements

Java offers both traditional switch statements and modern switch expressions, giving you flexibility in how you handle multiple conditions.

### Traditional Switch Statements

```java
public class TraditionalSwitch {
    public static void demonstrateSwitch() {
        DayOfWeek today = DayOfWeek.MONDAY;
        String schedule;

        switch (today) {
            case MONDAY:
                schedule = "Team meeting at 9 AM";
                System.out.println("Start of work week");
                break;

            case TUESDAY:
            case WEDNESDAY:
            case THURSDAY:
                schedule = "Regular work day";
                break;

            case FRIDAY:
                schedule = "Project review and planning";
                System.out.println("Almost weekend!");
                break;

            case SATURDAY:
            case SUNDAY:
                schedule = "Weekend - time to relax";
                break;

            default:
                schedule = "Unknown day";
                break;
        }

        System.out.println("Today's schedule: " + schedule);
    }
}
```

{: .warning }
**Fall-through Behavior:** Without `break` statements, execution continues to the next case. This can be useful but is often a source of bugs. Always include `break` unless you specifically want fall-through behavior.

### Modern Switch Expressions (Java 14+)

Switch expressions provide a more concise and less error-prone alternative:

```java
public class ModernSwitch {
    public static void demonstrateSwitchExpressions() {
        DayOfWeek today = DayOfWeek.FRIDAY;

        // Simple switch expression
        String dayType = switch (today) {
            case MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY -> "Weekday";
            case SATURDAY, SUNDAY -> "Weekend";
        };

        // Switch expression with complex logic using yield
        String workload = switch (today) {
            case MONDAY -> {
                System.out.println("Planning the week ahead");
                yield "Heavy workload";
            }
            case TUESDAY, WEDNESDAY, THURSDAY -> "Steady workload";
            case FRIDAY -> {
                System.out.println("Wrapping up the week");
                yield "Light workload";
            }
            case SATURDAY, SUNDAY -> "No work - rest time!";
        };

        System.out.println("Day type: " + dayType);
        System.out.println("Expected workload: " + workload);
    }

    // Switch expressions in methods
    public static int getQuarterFromMonth(int month) {
        return switch (month) {
            case 1, 2, 3 -> 1;
            case 4, 5, 6 -> 2;
            case 7, 8, 9 -> 3;
            case 10, 11, 12 -> 4;
            default -> throw new IllegalArgumentException("Invalid month: " + month);
        };
    }
}
```

### Switch with Different Data Types

```java
public class SwitchDataTypes {
    // Switch with enums (recommended)
    enum Priority { LOW, MEDIUM, HIGH, CRITICAL }

    public static String getActionForPriority(Priority priority) {
        return switch (priority) {
            case LOW -> "Handle when convenient";
            case MEDIUM -> "Handle within the day";
            case HIGH -> "Handle within the hour";
            case CRITICAL -> "Handle immediately";
        };
    }

    // Switch with strings
    public static double getDiscountRate(String customerType) {
        return switch (customerType.toUpperCase()) {
            case "PREMIUM" -> 0.15;
            case "GOLD" -> 0.10;
            case "SILVER" -> 0.05;
            case "REGULAR" -> 0.02;
            default -> 0.0;
        };
    }

    // Switch with integers
    public static String getGradeDescription(int score) {
        return switch (score / 10) {  // Integer division
            case 10, 9 -> "Excellent (A)";
            case 8 -> "Good (B)";
            case 7 -> "Satisfactory (C)";
            case 6 -> "Needs Improvement (D)";
            default -> "Failing (F)";
        };
    }
}
```

---

## Practical Examples

### Input Validation

```java
public class ValidationExamples {
    public static boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }

        // Simple email validation
        return email.contains("@") &&
               email.indexOf("@") > 0 &&
               email.lastIndexOf("@") < email.length() - 1;
    }

    public static String categorizeAge(int age) {
        if (age < 0) {
            return "Invalid age";
        } else if (age < 13) {
            return "Child";
        } else if (age < 20) {
            return "Teenager";
        } else if (age < 65) {
            return "Adult";
        } else {
            return "Senior";
        }
    }
}
```

### Business Logic with Conditionals

```java
public class BusinessLogic {
    public static double calculateShipping(double orderTotal, String customerType, String destination) {
        double baseShipping = 5.99;

        // Free shipping for large orders
        if (orderTotal >= 50.0) {
            baseShipping = 0.0;
        }

        // Customer type discounts
        double discount = switch (customerType.toUpperCase()) {
            case "PREMIUM" -> 1.0;      // Free shipping
            case "GOLD" -> 0.5;         // 50% off shipping
            case "SILVER" -> 0.25;      // 25% off shipping
            default -> 0.0;             // No discount
        };

        double shippingCost = baseShipping * (1.0 - discount);

        // International shipping surcharge
        if (!destination.equalsIgnoreCase("DOMESTIC")) {
            shippingCost += 10.0;
        }

        return Math.max(0.0, shippingCost);
    }
}
```

---

## Best Practices

### 1. Use Switch Expressions When Possible

```java
// Prefer this (Java 14+)
String result = switch (status) {
    case ACTIVE -> "User is active";
    case INACTIVE -> "User is inactive";
    case PENDING -> "User registration pending";
};

// Over this
String result;
switch (status) {
    case ACTIVE:
        result = "User is active";
        break;
    case INACTIVE:
        result = "User is inactive";
        break;
    case PENDING:
        result = "User registration pending";
        break;
}
```

### 2. Handle All Cases

```java
// Always include default case or handle all enum values
public enum Status { ACTIVE, INACTIVE, PENDING }

String message = switch (status) {
    case ACTIVE -> "Ready to go";
    case INACTIVE -> "Currently disabled";
    case PENDING -> "Awaiting approval";
    // No default needed - all enum values covered
};
```

### 3. Keep Conditions Readable

```java
// Good: Clear and readable
boolean canVote = age >= 18 && isRegistered && !isFelon;

// Better: Extract complex conditions
private boolean isEligibleToVote(int age, boolean isRegistered, boolean isFelon) {
    return age >= VOTING_AGE && isRegistered && !isFelon;
}
```

### 4. Use Early Returns to Reduce Nesting

```java
// Avoid deep nesting
public String processUser(User user) {
    if (user == null) {
        return "Error: User is null";
    }

    if (!user.isActive()) {
        return "Error: User is inactive";
    }

    if (user.getEmail() == null) {
        return "Error: No email provided";
    }

    // Main logic here
    return "User processed successfully";
}
```

### Peformance Considerations: If/Else vs Switch

| Switch                                                                                           | If/ Else                                                                 |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| Generally faster for many cases                                                                  | Can test expressions based on ranges of values of conditions             |
| More readable with many cases                                                                    | Can become complex and hard to read                                      |
| Better performance for multi way branching. Compiler creates a jump table for switch statements. | Each if statement is evaluated in sequence, which can be less efficient. |
