---
layout: default
title: 03.3 Array Methods
parent: "Module 03: Arrays"
nav_order: 3
---

# Array Methods and Utilities

Java provides powerful utilities for working with arrays through the `java.util.Arrays` class and built-in array operations.

## Displaying Array Contents

The most common need when working with arrays is to see their contents. Java arrays don't have a meaningful `toString()` method by default.

```java
public class ArraysDemo {
    public static void main(String[] args) {
        int[] myArray = {3, 2, 1};

        // This won't work as expected
        System.out.println(myArray); // Prints memory address

        // Use Arrays.toString() instead
        System.out.println(java.util.Arrays.toString(myArray)); // [3, 2, 1]
    }
}
```

For cleaner code, import the Arrays class:

```java
import java.util.Arrays;

public class ArraysDemo {
    public static void main(String[] args) {
        int[] myArray = {3, 2, 1};
        System.out.println(Arrays.toString(myArray)); // [3, 2, 1]
    }
}
```

## Essential Arrays Class Methods

The `Arrays` class provides static methods for common array operations:

```java
import java.util.Arrays;

public class ArrayUtilities {
    public static void main(String[] args) {
        int[] numbers = {5, 2, 8, 1, 9};

        // Sorting (modifies original array)
        Arrays.sort(numbers);
        System.out.println("Sorted: " + Arrays.toString(numbers)); // [1, 2, 5, 8, 9]

        // Binary search (array must be sorted)
        int index = Arrays.binarySearch(numbers, 5);
        System.out.println("Index of 5: " + index); // 2

        // Copying arrays
        int[] fullCopy = Arrays.copyOf(numbers, numbers.length);
        int[] partialCopy = Arrays.copyOfRange(numbers, 1, 4); // indices 1-3

        // Filling arrays with a value
        int[] filled = new int[5];
        Arrays.fill(filled, 42);
        System.out.println("Filled: " + Arrays.toString(filled)); // [42, 42, 42, 42, 42]

        // Comparing arrays for equality
        int[] other = {1, 2, 5, 8, 9};
        boolean areEqual = Arrays.equals(numbers, other);
        System.out.println("Arrays equal: " + areEqual); // true
    }
}
```

## Working with Multi-dimensional Arrays

For 2D arrays, use specialized methods:

```java
import java.util.Arrays;

public class MatrixDemo {
    public static void main(String[] args) {
        int[][] matrix = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        // Display 2D array
        System.out.println("Matrix:");
        for (int[] row : matrix) {
            System.out.println(Arrays.toString(row));
        }

        // Or use deepToString for nested arrays
        System.out.println("Deep string: " + Arrays.deepToString(matrix));

        // Matrix operations example
        int[][] result = addMatrices(matrix, matrix);
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
            System.out.println(Arrays.toString(row));
        }
    }
}
```

## Hands-On Practice

{: .important }
**Try This:** Create a comprehensive array analyzer that demonstrates multiple array operations:

```java
public class ArrayAnalyzer {
    public static void main(String[] args) {
        int[] data = {12, 5, 8, 130, 44, 25, 16, 9, 55};

        // TODO: Implement the following analysis:
        // 1. Display original array and its length
        // 2. Calculate sum and average
        // 3. Find maximum and minimum values
        // 4. Count even and odd numbers
        // 5. Create a doubled array
        // 6. Sort and display the sorted array

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

        // 1. Display original array
        System.out.println("Original array: " + Arrays.toString(data));
        System.out.println("Array length: " + data.length);

        // 2. Sum and average
        int sum = 0;
        for (int value : data) {
            sum += value;
        }
        double average = (double) sum / data.length;
        System.out.printf("Sum: %d, Average: %.2f%n", sum, average);

        // 3. Maximum and minimum
        int max = data[0];
        int min = data[0];
        for (int value : data) {
            max = Math.max(max, value);
            min = Math.min(min, value);
        }
        System.out.printf("Maximum: %d, Minimum: %d%n", max, min);

        // 4. Count even and odd
        int evenCount = 0, oddCount = 0;
        for (int value : data) {
            if (value % 2 == 0) {
                evenCount++;
            } else {
                oddCount++;
            }
        }
        System.out.printf("Even numbers: %d, Odd numbers: %d%n", evenCount, oddCount);

        // 5. Create doubled array
        int[] doubled = new int[data.length];
        for (int i = 0; i < data.length; i++) {
            doubled[i] = data[i] * 2;
        }
        System.out.println("Doubled array: " + Arrays.toString(doubled));

        // 6. Sort original array
        Arrays.sort(data);
        System.out.println("Sorted array: " + Arrays.toString(data));

        System.out.println("Array analysis complete!");
    }
}
```

</details>

## Key Differences from JavaScript Arrays

{: .highlight-title }

> Important Distinctions
>
> **Static vs Dynamic**: Java arrays have fixed size; JavaScript arrays are dynamic
>
> **Type Safety**: Java arrays hold only one type; JavaScript arrays are mixed-type
>
> **Method Location**: Java uses `Arrays.method(array)`, JavaScript uses `array.method()`
>
> **Length Property**: Java uses `.length` (field), JavaScript uses `.length` (property)
>
> **Bounds Checking**: Java throws exceptions for invalid indices; JavaScript returns `undefined`

{: .fs-2 }
[Previous: 03.2 Multi-dimensional Arrays](../03.2-multidimensional-arrays/index.md){: .btn .btn-outline }
[Next: Module 04: Object-Oriented Programming](../../04-oop/index.md){: .btn .btn-outline }
