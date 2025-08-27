---
layout: default
title: 03.1 Arrays
parent: "Module 03: Arrays"
nav_order: 1
---

## Arrays

Arrays in Java are similar to those in JS/TS. They are a type of object with elements of similiar data types that can be accessed via index. Like JS, they are zero indexed. However, Java arrays are fixed in size once created.

```java

public class ArraysDemo {
    public static void main(String[]args) {
        // There are two different ways to declare arrays variables
        int[] arr;
        // OR
        int arr2[];

        // To initialise the variable you can use the new keyword with the length of the array in square brackets. This initialises an array of length 10.
        arr = new int[10];
        // expected output 10
        System.out.println(arr.length);
    }
}
```

### Default values

Arrays containing primitives are initialised with a default value based on their type because each primitive stores a value.

```Java
public class ArraysDemo {
    public static void main(String[]args) {
        int[] arr;
        arr = new int[1];
        // expected output 0 (default value)
        System.out.println(arr[0]);

        double[] arr2;
        arr2 = new double[1];
        // expected output 0.0 (default value)
        System.out.println(arr2[0]);

        // Create an array of 10 booleans;
        boolean[] arr3 = new boolean[10];
        // expected output false;
        System.out.println(arr3[4]);
    }
}

```

### Array Literals

```Java
public class ArraysDemo {
    public static void main(String[]args) {
        int[] literalArray = {3,2,1};
        // Expected Output 3
        System.out.println(literalArray[0]);
     }
}
```

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
