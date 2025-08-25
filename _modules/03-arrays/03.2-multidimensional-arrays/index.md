---
layout: default
title: 03.4 Multi-dimensional Arrays
parent: "Module 03: Primitive Data Types, Variables & Arrays"
nav_order: 4
---

### Multi-dimensional Array Literals

Technically they are no such things are multi-dimensional arrays. However we can create this by creating an array of arrays. You can think of these like a table where we can reference values by their row and index

```Java
public class ArraysDemo {
    public static void main(String[]args) {
        int[][] matrix = {
        { 1, 2, 3 },
        { 4, 5, 6 }
    };
    // The first index is row and the second one col. So the 2nd row (1 index), at the 3rd position (2 index) is 6;
    System.out.println(matrix[1][2]);
    }
}
```

### Multi-dimensional Arrays Without Values

You can instantiate multi dimensional arrays without using literals just be declaring the size. For example:

```Java
public class ArraysDemo {
    public static void main(String[]args) {
        int[][] matrix = new int[10][];
        // expected output: null because arrays are reference types not primitives.
        System.out.println(matrix[0]);
    }
}
```
