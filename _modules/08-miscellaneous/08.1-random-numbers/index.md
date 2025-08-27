---
layout: default
title: 08.1 Random Numbers
parent: "Module 08: Miscellaneous Java Concepts"
nav_order: 1
---

# Generating Random Numbers in Java

While completely random numbers are difficult to achieve, Java provides a robust way to generate pseudo-random numbers. You can use the `java.util.Random` class to generate random numbers of different types, such as integers, doubles, and booleans.

This creates a new instance of Java's Random class, which is part of the java.util package. The Random class is used to generate pseudo-random numbers for various purposes, such as simulations, games, or randomized testing. By calling new Random(), you get an object (r) that can produce random integers, doubles, booleans, and more using its methods like nextInt(), nextDouble(), etc. If you don't provide a seed value, the generator uses the current time as the seed, ensuring different results each run. This is a common way to introduce randomness into Java programs.

```java
public class RandomDemo {
    public static void main(String[] args){
        // Instantiate a new Random Class
        Random r = new Random();
        System.out.println("Random Integer: " + r.nextInt());
        System.out.println("Random Integer (0-100): " + r.nextInt(100 + 1)); // 0 to 100
        System.out.println("Random Double: " + r.nextDouble());
        System.out.println("Random Boolean: " + r.nextBoolean());
    }
}
```
