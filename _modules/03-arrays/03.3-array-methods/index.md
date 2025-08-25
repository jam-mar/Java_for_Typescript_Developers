---
layout: default
title: 03.4 Array Methods
parent: "Module 03: Primitive Data Types, Variables & Arrays"
nav_order: 4
---

## Array Utilities and Common Operations

### Inspecting the value of arrays

Use the toString() array method from the Arrays class to log out the values of in an array

```Java
public class ArraysDemo {
    public static void main(String[]args) {
	  int[] myArray = { 3,2,1 };
	  // expected output: null
	  System.out.println(java.util.Arrays.toString(myArray));
    }
}
```

```Java
// Or import the Arrays class to access the Arrays class methods directly.
import java.util.Arrays;

public class ArraysDemo {
    public static void main(String[]args) {
        int[] myArray = { 3,2,1 };
        // expected output: [3, 2, 1]
        System.out.println(Arrays.toString(myArray));
    }
}
```

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
[Next: 1.3 Methods & Scope](1.3-methods-scope.md){: .btn .btn-outline }
