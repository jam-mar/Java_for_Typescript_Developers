---
layout: default
title: 07.3 Jump Statements
parent: "Module 07: Control Statements"
nav_order: 3
---

# Jump Statements

## Continue

```java
public class JumpStatementDemo {
    public static void main(String[] args){
        System.out.println("Jump Statement Demo");
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
            if (i % 2 == 0) {
                continue;
            }
            System.out.println("This is an odd number: " + i);
        }
    }
}
```

## Break

```java
public class JumpStatementDemo {
    public static void main(String[] args){
        System.out.println("Jump Statement Demo");
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
            if (i == 3) {
                break;
            }
            System.out.println("This is not the break point: " + i);
        }
    }
}
```

## Break Nested Loop

The break statement will terminate the nearest enclosing loop or switch statement. In the case of nested loops, it will only break out of the innermost loop.

```java
public class JumpStatementDemo {
    public static void main(String[] args){
        System.out.println("Jump Statement Demo");
        outerLoop:
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
            for (int j = 0; j < 5; j++) {
                if (i == 2 && j == 3) {
                    break outerLoop;
                }
                System.out.println("Inner Loop - i: " + i + ", j: " + j);
            }
        }
    }
}
```
