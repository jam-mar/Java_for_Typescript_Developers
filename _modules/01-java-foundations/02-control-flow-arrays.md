---
layout: default
title: 1.2 Control Flow & Arrays
parent: "Module 1: Java Foundations"
nav_order: 2
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

---

## Loops

### For Loops

```java
// Traditional C-style for loop
for (int i = 0; i < 10; i++) {
    System.out.println("Count: " + i);
}

// Multiple variables in for loop
for (int i = 0, j = 10; i < j; i++, j--) {
    System.out.println(i + " : " + j);
}

// Infinite loop (be careful!)
for (;;) {
    // This runs forever unless you break
    if (someCondition) break;
}
```

### Enhanced For Loop (For-Each)

This is Java's equivalent to JavaScript's `for...of`:

```java
// Array iteration
int[] numbers = {1, 2, 3, 4, 5};
for (int num : numbers) {
    System.out.println(num);
}

// Collection iteration (we'll cover collections later)
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
for (String name : names) {
    System.out.println("Hello, " + name);
}
```

### While and Do-While Loops

```java
// While loop (same as JavaScript)
int count = 0;
while (count < 5) {
    System.out.println("Count: " + count);
    count++;
}

// Do-while loop (executes at least once)
int input;
do {
    System.out.print("Enter a number (0 to quit): ");
    input = scanner.nextInt();
    System.out.println("You entered: " + input);
} while (input != 0);
```

### Loop Control

```java
// Break and continue work the same as JavaScript
for (int i = 0; i < 10; i++) {
    if (i == 3) continue;  // Skip this iteration
    if (i == 7) break;     // Exit the loop
    System.out.println(i); // Prints: 0, 1, 2, 4, 5, 6
}

// Labeled breaks for nested loops (Java-specific feature)
outer: for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
        if (i == 1 && j == 1) {
            break outer;  // Breaks out of both loops
        }
        System.out.println(i + "," + j);
    }
}
```

---

## Arrays: Fixed-Size Collections

Arrays in Java are quite different from JavaScript arrays. They're fixed-size, typed collections.

### Array Declaration and Initialization

```java
// Declaration (creates reference, no array object yet)
int[] numbers;           // Preferred style
int numbers2[];          // C-style (valid but not recommended)

// Declaration with initialization
int[] scores = new int[5];        // Creates array of 5 integers (all 0)
String[] names = new String[3];   // Creates array of 3 strings (all null)

// Array literal initialization
int[] values = {1, 2, 3, 4, 5};
String[] colors = {"red", "green", "blue"};

// Alternative initialization syntax
int[] moreValues = new int[]{10, 20, 30};
```

### Array Properties and Access

```java
int[] numbers = {10, 20, 30, 40, 50};

// Length property (not a method like JavaScript!)
System.out.println("Length: " + numbers.length); // Note: no parentheses

// Accessing elements (same as JavaScript)
int first = numbers[0];    // 10
int last = numbers[numbers.length - 1]; // 50

// Modifying elements
numbers[2] = 99;  // Array becomes {10, 20, 99, 40, 50}

// Bounds checking - Java throws exception for invalid indices
try {
    int invalid = numbers[10]; // ArrayIndexOutOfBoundsException
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Index out of bounds!");
}
```

### Multi-dimensional Arrays

```java
// 2D array declaration
int[][] matrix = new int[3][4];  // 3 rows, 4 columns

// 2D array initialization
int[][] grid = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Accessing 2D array elements
int element = grid[1][2]; // Gets 6 (row 1, column 2)

// Iterating through 2D array
for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
        System.out.print(grid[i][j] + " ");
    }
    System.out.println(); // New line after each row
}

// Enhanced for loop with 2D arrays
for (int[] row : grid) {
    for (int element : row) {
        System.out.print(element + " ");
    }
    System.out.println();
}
```

### Jagged Arrays (Irregular Arrays)

```java
// Arrays with different row lengths
int[][] jagged = new int[3][];  // 3 rows, columns not specified
jagged[0] = new int[2];         // First row has 2 elements
jagged[1] = new int[4];         // Second row has 4 elements
jagged[2] = new int[1];         // Third row has 1 element

// Or initialize directly
int[][] triangle = {
    {1},
    {1, 1},
    {1, 2, 1},
    {1, 3, 3, 1}
};
```

---

## Array Utilities and Common Operations

### Arrays Class Utilities

```java
import java.util.Arrays;

int[] numbers = {5, 2, 8, 1, 9};

// Sorting
Arrays.sort(numbers);  // Modifies original array
System.out.println(Arrays.toString(numbers)); // [1, 2, 5, 8, 9]

// Searching (array must be sorted first)
int index = Arrays.binarySearch(numbers, 5); // Returns index of 5

// Copying arrays
int[] copy = Arrays.copyOf(numbers, numbers.length);
int[] partial = Arrays.copyOfRange(numbers, 1, 4); // Copy elements 1-3

// Filling arrays
int[] filled = new int[5];
Arrays.fill(filled, 42); // All elements become 42

// Comparing arrays
int[] other = {1, 2, 5, 8, 9};
boolean equal = Arrays.equals(numbers, other); // true

// Converting to string representation
System.out.println(Arrays.toString(numbers)); // [1, 2, 5, 8, 9]
```

### Common Array Patterns

```java
// Finding maximum element
int[] values = {3, 7, 1, 9, 4};
int max = values[0];
for (int i = 1; i < values.length; i++) {
    if (values[i] > max) {
        max = values[i];
    }
}

// Or using enhanced for loop
int max2 = values[0];
for (int value : values) {
    if (value > max2) {
        max2 = value;
    }
}

// Summing array elements
int sum = 0;
for (int value : values) {
    sum += value;
}

// Reversing an array
for (int i = 0; i < values.length / 2; i++) {
    int temp = values[i];
    values[i] = values[values.length - 1 - i];
    values[values.length - 1 - i] = temp;
}
```

---

## Array vs ArrayList Preview

{: .highlight }
**Coming from JavaScript:** JavaScript arrays are actually more like Java's `ArrayList` than Java arrays. Here's a quick preview:

```java
// Java Array - Fixed size, direct access
int[] array = new int[5];     // Size fixed at creation
// array.push(6);             // ❌ No such method

// Java ArrayList - Dynamic size, more like JS arrays
ArrayList<Integer> list = new ArrayList<>();
list.add(1);                  // ✅ Like array.push()
list.add(2);
int size = list.size();       // ✅ Like array.length
```

We'll explore `ArrayList` and other collections in a later module.

---

## Practical Examples

### Example 1: Grade Calculator

```java
public class GradeCalculator {
    public static void main(String[] args) {
        // Student grades
        double[] grades = {85.5, 92.0, 78.5, 96.0, 83.5};

        // Calculate average
        double sum = 0;
        for (double grade : grades) {
            sum += grade;
        }
        double average = sum / grades.length;

        // Determine letter grade
        char letterGrade;
        if (average >= 90) {
            letterGrade = 'A';
        } else if (average >= 80) {
            letterGrade = 'B';
        } else if (average >= 70) {
            letterGrade = 'C';
        } else if (average >= 60) {
            letterGrade = 'D';
        } else {
            letterGrade = 'F';
        }

        System.out.printf("Average: %.2f%n", average);
        System.out.println("Letter Grade: " + letterGrade);

        // Find highest and lowest grades
        double highest = grades[0];
        double lowest = grades[0];

        for (double grade : grades) {
            if (grade > highest) highest = grade;
            if (grade < lowest) lowest = grade;
        }

        System.out.printf("Highest: %.1f, Lowest: %.1f%n", highest, lowest);
    }
}
```

### Example 2: Matrix Operations

```java
public class MatrixDemo {
    public static void main(String[] args) {
        int[][] matrix1 = {
            {1, 2, 3},
            {4, 5, 6}
        };

        int[][] matrix2 = {
            {7, 8, 9},
            {1, 2, 3}
        };

        // Matrix addition
        int[][] result = addMatrices(matrix1, matrix2);
        printMatrix(result);
    }

    public static int[][] addMatrices(int[][] a, int[][] b) {
        int rows = a.length;
        int cols = a[0].length;
        int[][] result = new int[rows][cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                result[i][j] = a[i][j] + b[i][j];
            }
        }

        return result;
    }

    public static void printMatrix(int[][] matrix) {
        for (int[] row : matrix) {
            for (int element : row) {
                System.out.print(element + " ");
            }
            System.out.println();
        }
    }
}
```

---

## Hands-On Practice

{: .important }
**Try This:** Create a program that analyzes an array of integers:

```java
public class ArrayAnalyzer {
    public static void main(String[] args) {
        int[] data = {12, 5, 8, 130, 44, 25, 16, 9, 55};

        // TODO: Find and print:
        // 1. Array length
        // 2. Sum and average
        // 3. Maximum and minimum values
        // 4. Count of even and odd numbers
        // 5. Create a new array with values doubled
        // 6. Sort the original array and print it

        System.out.println("Array analysis complete!");
    }
}
```

<details markdown="1">
<summary>💡 Click to see solution</summary>

```java
import java.util.Arrays;

public class ArrayAnalyzer {
    public static void main(String[] args) {
        int[] data = {12, 5, 8, 130, 44, 25, 16, 9, 55};

        System.out.println("Original array: " + Arrays.toString(data));
        System.out.println("Array length: " + data.length);

        // Sum and average
        int sum = 0;
        for (int value : data) {
            sum += value;
        }
        double average = (double) sum / data.length;
        System.out.printf("Sum: %d, Average: %.2f%n", sum, average);

        // Maximum and minimum
        int max = data[0];
        int min = data[0];
        for (int value : data) {
            if (value > max) max = value;
            if (value < min) min = value;
        }
        System.out.printf("Maximum: %d, Minimum: %d%n", max, min);

        // Count even and odd
        int evenCount = 0, oddCount = 0;
        for (int value : data) {
            if (value % 2 == 0) {
                evenCount++;
            } else {
                oddCount++;
            }
        }
        System.out.printf("Even numbers: %d, Odd numbers: %d%n", evenCount, oddCount);

        // Create doubled array
        int[] doubled = new int[data.length];
        for (int i = 0; i < data.length; i++) {
            doubled[i] = data[i] * 2;
        }
        System.out.println("Doubled array: " + Arrays.toString(doubled));

        // Sort and print
        Arrays.sort(data);
        System.out.println("Sorted array: " + Arrays.toString(data));

        System.out.println("Array analysis complete!");
    }
}
```

</details>

---

## Key Differences from JavaScript

{: .highlight-title }

> Important Distinctions
>
> 1. **Boolean Conditions**: Must be actual `boolean` values, no truthy/falsy
> 2. **Array Size**: Fixed at creation time, use `.length` (property, not method)
> 3. **Array Types**: All elements must be the same type
> 4. **Bounds Checking**: Automatic - throws exception for invalid indices
> 5. **Enhanced For Loop**: Use `for (type var : collection)` instead of `for...of`
> 6. **Switch Fall-through**: Remember `break` statements

{: .fs-2 }
[Previous: 1.1 Java Basics - Types, Variables & Syntax](1.1-basics.md){: .btn .btn-outline }
[Next: 1.2 Control Flow & Arrays](1.2-control-flow-arrays.md){: .btn .btn-primary }
