---
layout: default
title: 07.4 Labels
parent: "Module 07: Control Statements"
nav_order: 4
---

# Labels

The `goto` statement is a reserved word, but should not be used as it makes code hard to read and test. Use labels instead.

Labels allow you to name loops and use those names with break and continue statements. This can make your code more readable and help you manage complex loop structures.

```java
public class LabelsDemo {
    public static void main(String[] args){
        System.out.println("labels");
        loop1: for (int i = 0; i < 5; i++) {
            System.out.println("Outer Loop - Iteration: " + i);
            loop2: for (int j = 0; j < 5; j++) {
                if (j == 3) {
                    System.out.println("Inner Loop - Breaking to Outer Loop");
                    break loop1;
                }
                System.out.println("Inner Loop - i: " + i + ", j: " + j);
            }
        }
    }
}
```
