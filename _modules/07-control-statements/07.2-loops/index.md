---
layout: default
title: 07.2 loops
parent: "Module 07: Control Statements"
nav_order: 2
---

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
