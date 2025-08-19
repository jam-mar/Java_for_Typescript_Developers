---
layout: default
title: 1.3 Methods, Scope & Recursion
parent: "Module 1: Java Foundations"
nav_order: 3
---

## Java Methods: Functions with Structure

Methods in Java are equivalent to functions in JavaScript, but with more explicit structure and compile-time checking. Every method must declare its return type, parameters, and access level.

---

## Method Syntax and Structure

### Basic Method Declaration

```java
// Method structure: [access] [static] returnType methodName(parameters) { body }

public class Calculator {
    // Instance method
    public double add(double a, double b) {
        return a + b;
    }

    // Static method (belongs to class, not instance)
    public static double multiply(double x, double y) {
        return x * y;
    }

    // Method with no return value
    public void printResult(double result) {
        System.out.println("Result: " + result);
    }

    // Private helper method
    private boolean isPositive(double number) {
        return number > 0;
    }
}
```

### Access Modifiers in Methods

| Modifier    | Visibility                | When to Use                            |
| ----------- | ------------------------- | -------------------------------------- |
| `public`    | Accessible everywhere     | Public API methods                     |
| `private`   | Same class only           | Helper methods, implementation details |
| `protected` | Same package + subclasses | Methods for inheritance                |
| `default`   | Same package              | Package-private utilities              |

```java
public class BankAccount {
    private double balance;

    // Public interface
    public void deposit(double amount) {
        if (isValidAmount(amount)) {  // Calls private helper
            balance += amount;
        }
    }

    public double getBalance() {
        return balance;
    }

    // Private helper - implementation detail
    private boolean isValidAmount(double amount) {
        return amount > 0 && amount <= 10000;
    }

    // Protected - for subclasses
    protected void logTransaction(String type, double amount) {
        System.out.printf("%s: $%.2f%n", type, amount);
    }
}
```

---

## Static vs Instance Methods

This is a key concept that doesn't exist in JavaScript - the distinction between methods that belong to the class vs. methods that belong to instances.

### Static Methods

```java
public class MathUtils {
    // Static methods belong to the class, not instances
    public static double calculateCircleArea(double radius) {
        return Math.PI * radius * radius;  // Using Math.PI (also static)
    }

    public static int factorial(int n) {
        if (n <= 1) return 1;
        return n * factorial(n - 1);
    }

    public static void main(String[] args) {
        // Call static methods using class name
        double area = MathUtils.calculateCircleArea(5.0);
        int fact = MathUtils.factorial(5);

        System.out.println("Area: " + area);
        System.out.println("Factorial: " + fact);
    }
}
```

### Instance Methods

```java
public class Counter {
    private int count = 0;  // Instance variable

    // Instance methods operate on instance data
    public void increment() {
        count++;  // Modifies this instance's count
    }

    public void increment(int amount) {  // Method overloading
        count += amount;
    }

    public int getValue() {
        return count;
    }

    public void reset() {
        count = 0;
    }

    public static void main(String[] args) {
        // Must create instances to use instance methods
        Counter c1 = new Counter();
        Counter c2 = new Counter();

        c1.increment();     // c1 count becomes 1
        c2.increment(5);    // c2 count becomes 5

        System.out.println("c1: " + c1.getValue()); // 1
        System.out.println("c2: " + c2.getValue()); // 5
    }
}
```

{: .note }
**JavaScript Comparison:** Static methods are like properties on the constructor function, while instance methods are like methods on the prototype.

```javascript
// JavaScript equivalent
class Counter {
  constructor() {
    this.count = 0;
  }
  increment() {
    this.count++;
  } // Instance method
  static utility() {
    return "helper";
  } // Static method
}

Counter.utility(); // Call static method
new Counter().increment(); // Call instance method
```

---

## Method Overloading

Java supports method overloading - multiple methods with the same name but different parameter lists. The compiler chooses which method to call based on the arguments.

```java
public class Printer {
    // Different parameter types
    public void print(String message) {
        System.out.println("String: " + message);
    }

    public void print(int number) {
        System.out.println("Integer: " + number);
    }

    public void print(double number) {
        System.out.println("Double: " + number);
    }

    // Different number of parameters
    public void print(String message, int count) {
        for (int i = 0; i < count; i++) {
            System.out.println(message);
        }
    }

    // Different parameter order
    public void print(int count, String message) {
        System.out.println("Repeating " + count + " times: " + message);
    }

    public static void main(String[] args) {
        Printer p = new Printer();

        p.print("Hello");           // Calls print(String)
        p.print(42);                // Calls print(int)
        p.print(3.14);              // Calls print(double)
        p.print("Hi", 3);           // Calls print(String, int)
        p.print(2, "Bye");          // Calls print(int, String)
    }
}
```

### Overloading Rules

```java
public class OverloadingExamples {
    // ✅ Valid overloads - different parameter lists
    public void method(int x) { }
    public void method(double x) { }
    public void method(int x, int y) { }
    public void method(String x) { }

    // ❌ Invalid - can't overload by return type alone
    // public int method(int x) { }      // Compile error!
    // public void method(int x) { }     // Already exists

    // ❌ Invalid - parameter names don't matter for overloading
    // public void method(int y) { }     // Same as method(int x)

    // ✅ Valid - different parameter order counts as different
    public void process(String name, int age) { }
    public void process(int age, String name) { }
}
```

---

## Variable Arguments (Varargs)

Java supports variable-length argument lists, similar to JavaScript's rest parameters.

```java
public class VarargsExample {
    // Varargs parameter (must be last parameter)
    public static int sum(int... numbers) {  // int... = array of ints
        int total = 0;
        for (int num : numbers) {
            total += num;
        }
        return total;
    }

    // Combining regular parameters with varargs
    public static void greet(String greeting, String... names) {
        for (String name : names) {
            System.out.println(greeting + ", " + name + "!");
        }
    }

    public static void main(String[] args) {
        // Can call with any number of arguments
        System.out.println(sum());              // 0
        System.out.println(sum(5));             // 5
        System.out.println(sum(1, 2, 3));       // 6
        System.out.println(sum(1, 2, 3, 4, 5)); // 15

        greet("Hello", "Alice", "Bob", "Charlie");

        // Can also pass an array
        int[] values = {10, 20, 30};
        System.out.println(sum(values));        // 60
    }
}
```

{: .note }
**JavaScript Comparison:** This is similar to rest parameters in JavaScript:

```javascript
// JavaScript
function sum(...numbers) {
  return numbers.reduce((a, b) => a + b, 0);
}
```

---

## Variable Scope and Lifetime

Understanding scope is crucial for writing maintainable code. Java has clear scope rules that prevent many common JavaScript errors.

### Local Variable Scope

```java
public class ScopeExample {
    private int instanceVar = 10;  // Instance variable - class scope
    private static int classVar = 20;  // Class variable - class scope

    public void demonstrateScope() {
        int localVar = 30;  // Local variable - method scope

        // Block scope
        if (true) {
            int blockVar = 40;  // Block scope - only visible in this block
            System.out.println("In block: " + blockVar);
            System.out.println("Can access local: " + localVar);
            System.out.println("Can access instance: " + instanceVar);
        }

        // System.out.println(blockVar);  // ❌ Compile error! Out of scope

        // Loop variable scope
        for (int i = 0; i < 3; i++) {  // i is only visible in the loop
            int loopLocal = i * 10;
            System.out.println("Loop: " + loopLocal);
        }

        // System.out.println(i);       // ❌ Compile error! i out of scope
        // System.out.println(loopLocal); // ❌ Compile error! Out of scope
    }

    public void anotherMethod() {
        // Can access instance and class variables
        System.out.println("Instance: " + instanceVar);
        System.out.println("Class: " + classVar);

        // Cannot access localVar from demonstrateScope()
        // System.out.println(localVar); // ❌ Compile error!
    }
}
```

### Variable Shadowing

```java
public class ShadowingExample {
    private int value = 100;  // Instance variable

    public void shadowDemo(int value) {  // Parameter shadows instance variable
        int value2 = 200;  // Local variable

        System.out.println("Parameter value: " + value);        // Parameter
        System.out.println("Instance value: " + this.value);    // Instance variable
        System.out.println("Local value2: " + value2);

        // Block creates another scope level
        if (true) {
            int value3 = 300;
            // int value2 = 400;  // ❌ Error! Can't redeclare in same scope

            System.out.println("Block value3: " + value3);
            System.out.println("Can still access parameter: " + value);
            System.out.println("Can still access instance: " + this.value);
        }
    }
}
```

### Final Variables and Effectively Final

```java
public class FinalVariables {
    public void finalDemo() {
        final int CONSTANT = 42;        // Must be initialized
        // CONSTANT = 50;               // ❌ Compile error! Cannot reassign

        int effectivelyFinal = 100;     // Not declared final...
        // effectivelyFinal = 200;      // ...but if you don't modify it, it's "effectively final"

        // Can use effectively final variables in lambda expressions
        // (We'll cover lambdas later, but this shows the concept)
        Runnable task = () -> {
            System.out.println(CONSTANT);         // ✅ Final variable
            System.out.println(effectivelyFinal); // ✅ Effectively final
        };
    }
}
```

---

## Recursion in Java

Recursion works the same way as in JavaScript, but with Java's strong typing and explicit return types.

### Basic Recursion Examples

```java
public class RecursionExamples {
    // Classic factorial
    public static long factorial(int n) {
        // Base case
        if (n <= 1) {
            return 1;
        }
        // Recursive case
        return n * factorial(n - 1);
    }

    // Fibonacci sequence
    public static int fibonacci(int n) {
        if (n <= 1) {
            return n;
        }
        return fibonacci(n - 1) + fibonacci(n - 2);
    }

    // Sum of array elements
    public static int sumArray(int[] arr, int index) {
        // Base case: reached end of array
        if (index >= arr.length) {
            return 0;
        }
        // Recursive case: current element + sum of rest
        return arr[index] + sumArray(arr, index + 1);
    }

    // String reversal
    public static String reverse(String str) {
        // Base case: empty or single character
        if (str.length() <= 1) {
            return str;
        }
        // Recursive case: last char + reverse of substring
        return str.charAt(str.length() - 1) + reverse(str.substring(0, str.length() - 1));
    }
}
```

### More Advanced Recursion

```java
public class AdvancedRecursion {
    // Binary search (recursive implementation)
    public static int binarySearch(int[] arr, int target, int left, int right) {
        // Base case: not found
        if (left > right) {
            return -1;
        }

        int mid = left + (right - left) / 2;  // Avoid overflow

        // Base case: found
        if (arr[mid] == target) {
            return mid;
        }

        // Recursive cases
        if (target < arr[mid]) {
            return binarySearch(arr, target, left, mid - 1);  // Search left half
        } else {
            return binarySearch(arr, target, mid + 1, right); // Search right half
        }
    }

    // Tower of Hanoi
    public static void hanoi(int n, char source, char destination, char auxiliary) {
        if (n == 1) {
            System.out.printf("Move disk 1 from %c to %c%n", source, destination);
            return;
        }

        // Move n-1 disks from source to auxiliary
        hanoi(n - 1, source, auxiliary, destination);

        // Move the largest disk from source to destination
        System.out.printf("Move disk %d from %c to %c%n", n, source, destination);

        // Move n-1 disks from auxiliary to destination
        hanoi(n - 1, auxiliary, destination, source);
    }

    // Calculate power (x^n) efficiently
    public static double power(double x, int n) {
        // Base cases
        if (n == 0) return 1.0;
        if (n == 1) return x;

        // Handle negative exponents
        if (n < 0) {
            return 1.0 / power(x, -n);
        }

        // Optimize: x^n = (x^(n/2))^2 when n is even
        if (n % 2 == 0) {
            double half = power(x, n / 2);
            return half * half;
        } else {
            return x * power(x, n - 1);
        }
    }
}
```

### Tail Recursion and Optimization

Java doesn't automatically optimize tail recursion like some functional languages, but understanding the concept is valuable:

```java
public class TailRecursion {
    // Regular recursion - not tail recursive
    public static int factorial(int n) {
        if (n <= 1) return 1;
        return n * factorial(n - 1);  // Operation after recursive call
    }

    // Tail recursive version using accumulator
    public static int factorialTail(int n) {
        return factorialHelper(n, 1);
    }

    private static int factorialHelper(int n, int accumulator) {
        if (n <= 1) {
            return accumulator;
        }
        return factorialHelper(n - 1, n * accumulator);  // Recursive call is last operation
    }

    // Fibonacci with memoization to avoid exponential time complexity
    private static Map<Integer, Integer> fibCache = new HashMap<>();

    public static int fibonacciMemo(int n) {
        if (n <= 1) return n;

        if (fibCache.containsKey(n)) {
            return fibCache.get(n);
        }

        int result = fibonacciMemo(n - 1) + fibonacciMemo(n - 2);
        fibCache.put(n, result);
        return result;
    }
}
```

---

## Practical Examples

### Example 1: String Processing Utility

```java
public class StringUtils {
    // Check if string is palindrome (recursive)
    public static boolean isPalindrome(String str) {
        // Clean the string: remove spaces and convert to lowercase
        String cleaned = str.replaceAll("\\s+", "").toLowerCase();
        return isPalindromeHelper(cleaned, 0, cleaned.length() - 1);
    }

    private static boolean isPalindromeHelper(String str, int left, int right) {
        // Base case: single character or empty
        if (left >= right) {
            return true;
        }

        // Check if characters match
        if (str.charAt(left) != str.charAt(right)) {
            return false;
        }

        // Recursive case: check inner substring
        return isPalindromeHelper(str, left + 1, right - 1);
    }

    // Count occurrences of character in string
    public static int countChar(String str, char target) {
        return countCharHelper(str, target, 0);
    }

    private static int countCharHelper(String str, char target, int index) {
        if (index >= str.length()) {
            return 0;
        }

        int count = (str.charAt(index) == target) ? 1 : 0;
        return count + countCharHelper(str, target, index + 1);
    }
}
```

### Example 2: Mathematical Operations

```java
public class MathOperations {
    // Greatest Common Divisor (Euclidean algorithm)
    public static int gcd(int a, int b) {
        if (b == 0) {
            return Math.abs(a);
        }
        return gcd(b, a % b);
    }

    // Least Common Multiple
    public static int lcm(int a, int b) {
        return Math.abs(a * b) / gcd(a, b);
    }

    // Check if number is prime (optimized)
    public static boolean isPrime(int n) {
        if (n <= 1) return false;
        if (n <= 3) return true;
        if (n % 2 == 0 || n % 3 == 0) return false;

        return isPrimeHelper(n, 5);
    }

    private static boolean isPrimeHelper(int n, int divisor) {
        if (divisor * divisor > n) {
            return true;  // No divisors found
        }

        if (n % divisor == 0 || n % (divisor + 2) == 0) {
            return false;  // Found a divisor
        }

        return isPrimeHelper(n, divisor + 6);  // Check next potential divisors
    }
}
```

---

## Hands-On Practice

{: .important }
**Try This:** Create a comprehensive utility class with various methods:

```java
public class ArrayUtilities {
    // TODO: Implement these methods

    // 1. Static method to find maximum value in array
    public static int findMax(int[] arr) {
        // Use recursion
    }

    // 2. Method overloading for different array types
    public static double findMax(double[] arr) {
        // Overloaded version for double arrays
    }

    // 3. Recursive method to calculate sum
    public static int sum(int[] arr, int index) {
        // Base case and recursive case
    }

    // 4. Method with varargs to create array
    public static int[] createArray(int... values) {
        // Return new array with given values
    }

    // 5. Recursive binary search
    public static int search(int[] sortedArr, int target, int left, int right) {
        // Return index of target or -1 if not found
    }

    public static void main(String[] args) {
        // Test your methods here
        int[] numbers = {5, 2, 8, 1, 9, 3};
        // Test all your methods
    }
}
```

<details markdown="1">
<summary>💡 Click to see solution</summary>

```java
public class ArrayUtilities {
    // 1. Static method to find maximum value in array (recursive)
    public static int findMax(int[] arr) {
        if (arr == null || arr.length == 0) {
            throw new IllegalArgumentException("Array cannot be null or empty");
        }
        return findMaxHelper(arr, 0, arr[0]);
    }

    private static int findMaxHelper(int[] arr, int index, int currentMax) {
        if (index >= arr.length) {
            return currentMax;
        }

        int newMax = Math.max(currentMax, arr[index]);
        return findMaxHelper(arr, index + 1, newMax);
    }

    // 2. Method overloading for different array types
    public static double findMax(double[] arr) {
        if (arr == null || arr.length == 0) {
            throw new IllegalArgumentException("Array cannot be null or empty");
        }
        return findMaxHelper(arr, 0, arr[0]);
    }

    private static double findMaxHelper(double[] arr, int index, double currentMax) {
        if (index >= arr.length) {
            return currentMax;
        }

        double newMax = Math.max(currentMax, arr[index]);
        return findMaxHelper(arr, index + 1, newMax);
    }

    // 3. Recursive method to calculate sum
    public static int sum(int[] arr, int index) {
        if (index >= arr.length) {
            return 0;
        }
        return arr[index] + sum(arr, index + 1);
    }

    // 4. Method with varargs to create array
    public static int[] createArray(int... values) {
        return values.clone();  // Return a copy of the varargs array
    }

    // 5. Recursive binary search
    public static int search(int[] sortedArr, int target, int left, int right) {
        if (left > right) {
            return -1;  // Not found
        }

        int mid = left + (right - left) / 2;

        if (sortedArr[mid] == target) {
            return mid;  // Found
        } else if (target < sortedArr[mid]) {
            return search(sortedArr, target, left, mid - 1);  // Search left
        } else {
            return search(sortedArr, target, mid + 1, right); // Search right
        }
    }

    // Convenience method for binary search
    public static int search(int[] sortedArr, int target) {
        return search(sortedArr, target, 0, sortedArr.length - 1);
    }

    public static void main(String[] args) {
        // Test the methods
        int[] numbers = {5, 2, 8, 1, 9, 3};
        double[] doubles = {5.5, 2.2, 8.8, 1.1, 9.9, 3.3};

        System.out.println("Original array: " + java.util.Arrays.toString(numbers));

        // Test findMax
        System.out.println("Max int: " + findMax(numbers));
        System.out.println("Max double: " + findMax(doubles));

        // Test sum
        System.out.println("Sum: " + sum(numbers, 0));

        // Test createArray with varargs
        int[] created = createArray(10, 20, 30, 40, 50);
        System.out.println("Created array: " + java.util.Arrays.toString(created));

        // Test binary search (need sorted array)
        java.util.Arrays.sort(numbers);
        System.out.println("Sorted array: " + java.util.Arrays.toString(numbers));
        System.out.println("Search for 8: index " + search(numbers, 8));
        System.out.println("Search for 7: index " + search(numbers, 7)); // Not found
    }
}
```

</details>

---

## Key Takeaways

{: .highlight-title }

> Essential Method Concepts
>
> 1. **Method Signature**: Return type, name, and parameters define a method uniquely
> 2. **Static vs Instance**: Static methods belong to class, instance methods to objects
> 3. **Method Overloading**: Same name, different parameters - resolved at compile time
> 4. **Scope Rules**: Java has strict, predictable scope rules that prevent many errors
> 5. **Recursion**: Powerful technique, but watch for stack overflow and performance
> 6. **Access Modifiers**: Control visibility and encapsulation properly

---

## What's Next?

In **1.4 Object-Oriented Programming**, we'll dive deep into:

- Classes, objects, and constructors
- Inheritance and polymorphism
- Abstract classes and interfaces
- Encapsulation best practices
- Design patterns and OOP principles

---

{: .fs-2 }
[Previous: 1.2 Control Flow & Arrays](1.2-control-flow-arrays.md){: .btn .btn-outline }
[Next: 1.4 Object-Oriented Programming](1.4-oop-fundamentals.md){: .btn .btn-primary }
