---
layout: default
title: 10.2 Parameter Passing
parent: "Module 10: Methods in Java"
nav_order: 2
---

# Parameter Passing in Java

**Key Point: Java ALWAYS passes parameters by value. This is true for both primitives and objects.**

There is widespread misinformation claiming that Java passes primitives by value and objects by reference. This is incorrect. Understanding how Java actually works is crucial for writing correct code. Misunderstanding this is a common source of bugs.

## How Java Parameter Passing Works

Java uses **pass by value** for all parameters. However, the behavior appears different for primitives versus objects because of what the "value" actually is:

- **For primitives**: The value is the actual data (like the number 5)
- **For objects**: The value is a copy of the reference (memory address) pointing to the object

## Pass by Value with Primitives

When you pass a primitive variable to a method, Java copies the actual value. Changes to the parameter inside the method do not affect the original variable.

### Example: Primitive Parameter

```java
public class PrimitiveExample {
    public static void main(String[] args) {
        int num = 10;
        System.out.println("Before method call: " + num);  // Output: 10

        modifyPrimitive(num);

        System.out.println("After method call: " + num);   // Output: 10 (unchanged)
    }

    static void modifyPrimitive(int value) {
        value = 20;  // This only changes the copy, not the original
        System.out.println("Inside method: " + value);     // Output: 20
    }
}
```

**Output:**

```txt
Before method call: 10
Inside method: 20
After method call: 10
```

To actually change the original variable, you must return the new value and reassign it:

```java
public class PrimitiveReturnExample {
    public static void main(String[] args) {
        int num = 10;
        System.out.println("Before: " + num);              // Output: 10

        num = modifyPrimitive(num);  // Reassign the returned value

        System.out.println("After: " + num);               // Output: 20
    }

    static int modifyPrimitive(int value) {
        value = 20;
        return value;  // Return the modified value
    }
}
```

## Pass by Value with Objects

When you pass an object to a method, Java copies the reference (memory address), not the object itself. Both the original reference and the copy point to the same object in memory.

### Example: Object Parameter

```java
public class ObjectExample {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3};
        System.out.println("Before method call: " + numbers[0]);  // Output: 1

        modifyArray(numbers);

        System.out.println("After method call: " + numbers[0]);   // Output: 10 (changed!)
    }

    static void modifyArray(int[] array) {
        // 'array' is a copy of the reference, but points to the same object
        array[0] = 10;  // This modifies the original object
        System.out.println("Inside method: " + array[0]);        // Output: 10
    }
}
```

**Output:**

```
Before method call: 1
Inside method: 10
After method call: 10
```

### Important: You Cannot Change the Reference Itself

Since the reference is passed by value (copied), you cannot make the original reference point to a different object:

```java
public class ReferenceReassignmentExample {
    public static void main(String[] args) {
        int[] original = {1, 2, 3};
        System.out.println("Before: " + original[0]);      // Output: 1

        tryToReassign(original);

        System.out.println("After: " + original[0]);       // Output: 1 (unchanged!)
    }

    static void tryToReassign(int[] array) {
        array = new int[]{10, 20, 30};  // This only changes the copy of the reference
        System.out.println("Inside method: " + array[0]);  // Output: 10
    }
}
```

**Output:**

```text
Before: 1
Inside method: 10
After: 1
```

## Summary

**Java always uses pass by value:**

1. **Primitives**: The actual value is copied. Changes to the parameter don't affect the original variable.

2. **Objects**: The reference (memory address) is copied. The copy points to the same object, so:
   - Changes to the object's contents affect the original object
   - Changes to the reference itself (reassigning it) do not affect the original reference

**Common Misconception**: "Java passes objects by reference" - This is false. Java passes a copy of the reference by value, which is fundamentally different from true pass by reference.
