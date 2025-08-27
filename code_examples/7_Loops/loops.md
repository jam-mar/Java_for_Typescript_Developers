---
layout: default
title: 07.3 Enhanced For Loops
parent: "Module 07: Control Statements"
nav_order: 3
---

---

layout: default
title: 07.3 Enhanced For Loops
parent: "Module 07: Control Statements"
nav_order: 3

---

# Enhanced For Loops: Elegant Iteration

The enhanced for loop (also called "for-each" loop) was introduced in Java 5 and provides a cleaner, more readable way to iterate through arrays and collections. It eliminates common pitfalls like off-by-one errors and makes code more maintainable.

---

## Understanding Enhanced For Loops

### Basic Syntax and Concept

The enhanced for loop follows this pattern:

```java
for (ElementType element : collection) {
    // Use element here
}
```

This is equivalent to JavaScript's `for...of` loop:

```javascript
// JavaScript equivalent
for (const element of collection) {
  // Use element here
}
```

### Simple Examples

```java
public class BasicEnhancedForLoops {
    public static void arrayIteration() {
        // Traditional for loop
        int[] numbers = {10, 20, 30, 40, 50};
        System.out.println("Traditional for loop:");
        for (int i = 0; i < numbers.length; i++) {
            System.out.println("numbers[" + i + "] = " + numbers[i]);
        }

        // Enhanced for loop - cleaner and safer
        System.out.println("\nEnhanced for loop:");
        for (int number : numbers) {
            System.out.println("number = " + number);
        }
    }

    public static void stringArrayExample() {
        String[] fruits = {"Apple", "Banana", "Orange", "Grapes", "Mango"};

        System.out.println("Available fruits:");
        for (String fruit : fruits) {
            System.out.println("- " + fruit);
        }
    }
}
```

---

## Working with Different Data Types

### Primitive Arrays

```java
public class PrimitiveArrayIteration {
    public static void numericArrays() {
        // Integer array
        int[] scores = {95, 87, 92, 78, 85, 90};
        int total = 0;

        System.out.println("Student scores:");
        for (int score : scores) {
            System.out.println("Score: " + score);
            total += score;
        }

        double average = (double) total / scores.length;
        System.out.println("Average score: " + String.format("%.1f", average));

        // Double array
        double[] prices = {19.99, 25.50, 12.75, 8.99, 45.00};
        double sum = 0.0;

        for (double price : prices) {
            sum += price;
        }
        System.out.println("Total cost: $" + String.format("%.2f", sum));
    }

    public static void characterArrayProcessing() {
        char[] letters = {'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd'};

        // Count vowels
        String vowels = "aeiouAEIOU";
        int vowelCount = 0;

        for (char letter : letters) {
            if (vowels.indexOf(letter) != -1) {
                vowelCount++;
            }
        }

        System.out.println("Text: " + new String(letters));
        System.out.println("Vowel count: " + vowelCount);
    }

    public static void booleanArrayExample() {
        boolean[] testResults = {true, false, true, true, false, true, true, false};

        int passed = 0;
        int failed = 0;

        for (boolean result : testResults) {
            if (result) {
                passed++;
            } else {
                failed++;
            }
        }

        System.out.println("Test Results Summary:");
        System.out.println("Passed: " + passed);
        System.out.println("Failed: " + failed);
        System.out.println("Success rate: " + (passed * 100.0 / testResults.length) + "%");
    }
}
```

### Object Arrays

```java
public class ObjectArrayIteration {
    // Custom class for demonstration
    static class Student {
        private String name;
        private int age;
        private double gpa;

        public Student(String name, int age, double gpa) {
            this.name = name;
            this.age = age;
            this.gpa = gpa;
        }

        // Getters
        public String getName() { return name; }
        public int getAge() { return age; }
        public double getGpa() { return gpa; }

        @Override
        public String toString() {
            return String.format("%s (Age: %d, GPA: %.2f)", name, age, gpa);
        }
    }

    public static void studentArrayExample() {
        Student[] students = {
            new Student("Alice", 20, 3.8),
            new Student("Bob", 19, 3.2),
            new Student("Charlie", 21, 3.9),
            new Student("Diana", 20, 3.6),
            new Student("Eve", 22, 3.4)
        };

        System.out.println("Student Roster:");
        for (Student student : students) {
            System.out.println(student);
        }

        // Calculate statistics
        double totalGpa = 0.0;
        int totalAge = 0;
        Student highestGpa = students[0];

        for (Student student : students) {
            totalGpa += student.getGpa();
            totalAge += student.getAge();

            if (student.getGpa() > highestGpa.getGpa()) {
                highestGpa = student;
            }
        }

        System.out.println("\nClass Statistics:");
        System.out.println("Average GPA: " + String.format("%.2f", totalGpa / students.length));
        System.out.println("Average Age: " + String.format("%.1f", (double) totalAge / students.length));
        System.out.println("Highest GPA: " + highestGpa.getName() + " (" + highestGpa.getGpa() + ")");
    }
}
```

---

## Multi-Dimensional Arrays

### Two-Dimensional Arrays

```java
public class MultiDimensionalArrays {
    public static void twoDimensionalExample() {
        // Grade matrix: [student][subject]
        int[][] grades = {
            {85, 92, 78, 90}, // Student 1: Math, Science, English, History
            {90, 88, 85, 92}, // Student 2
            {78, 85, 90, 87}, // Student 3
            {95, 91, 89, 94}  // Student 4
        };

        String[] subjects = {"Math", "Science", "English", "History"};

        System.out.println("Grade Report:");
        System.out.println("=".repeat(50));

        int studentNum = 1;
        for (int[] studentGrades : grades) {
            System.out.println("Student " + studentNum + ":");

            int total = 0;
            for (int i = 0; i < studentGrades.length; i++) {
                System.out.println("  " + subjects[i] + ": " + studentGrades[i]);
                total += studentGrades[i];
            }

            double average = (double) total / studentGrades.length;
            System.out.println("  Average: " + String.format("%.1f", average));
            System.out.println();
            studentNum++;
        }
    }

    public static void matrixOperations() {
        int[][] matrix1 = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        int[][] matrix2 = {
            {9, 8, 7},
            {6, 5, 4},
            {3, 2, 1}
        };

        // Matrix addition using enhanced for loops with indices
        int[][] result = new int[matrix1.length][matrix1[0].length];

        for (int i = 0; i < matrix1.length; i++) {
            for (int j = 0; j < matrix1[i].length; j++) {
                result[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }

        System.out.println("Matrix Addition Result:");
        for (int[] row : result) {
            for (int value : row) {
                System.out.printf("%4d", value);
            }
            System.out.println();
        }
    }

    public static void jaggedArrayExample() {
        // Jagged array - different row sizes
        int[][] jaggedArray = {
            {1, 2},
            {3, 4, 5},
            {6, 7, 8, 9},
            {10}
        };

        System.out.println("Jagged Array:");
        int rowNumber = 1;
        for (int[] row : jaggedArray) {
            System.out.print("Row " + rowNumber + ": ");
            for (int value : row) {
                System.out.print(value + " ");
            }
            System.out.println("(length: " + row.length + ")");
            rowNumber++;
        }
    }
}
```

---

## Collection Iteration

### Lists and Arrays

```java
import java.util.*;

public class CollectionIteration {
    public static void listExamples() {
        List<String> colors = Arrays.asList("Red", "Green", "Blue", "Yellow", "Purple");

        System.out.println("Colors in the list:");
        for (String color : colors) {
            System.out.println("- " + color.toUpperCase());
        }

        // ArrayList with dynamic content
        List<Integer> fibonacci = new ArrayList<>();
        fibonacci.add(0);
        fibonacci.add(1);

        // Generate first 10 Fibonacci numbers
        for (int i = 2; i < 10; i++) {
            int next = fibonacci.get(i - 1) + fibonacci.get(i - 2);
            fibonacci.add(next);
        }

        System.out.println("\nFibonacci sequence:");
        for (Integer number : fibonacci) {
            System.out.print(number + " ");
        }
        System.out.println();
    }

    public static void setIteration() {
        // HashSet - unordered unique elements
        Set<String> uniqueWords = new HashSet<>(
            Arrays.asList("apple", "banana", "apple", "cherry", "banana", "date")
        );

        System.out.println("Unique words (HashSet):");
        for (String word : uniqueWords) {
            System.out.println("- " + word);
        }

        // TreeSet - ordered unique elements
        Set<Integer> orderedNumbers = new TreeSet<>(
            Arrays.asList(5, 2, 8, 1, 9, 2, 5, 3)
        );

        System.out.println("\nOrdered unique numbers (TreeSet):");
        for (Integer number : orderedNumbers) {
            System.out.print(number + " ");
        }
        System.out.println();
    }

    public static void queueIteration() {
        Queue<String> taskQueue = new LinkedList<>();
        taskQueue.offer("Send emails");
        taskQueue.offer("Review documents");
        taskQueue.offer("Attend meeting");
        taskQueue.offer("Update website");

        System.out.println("Tasks in queue:");
        int priority = 1;
        for (String task : taskQueue) {
            System.out.println(priority + ". " + task);
            priority++;
        }
    }
}
```

### Maps and Complex Collections

```java
import java.util.*;

public class MapIteration {
    public static void basicMapIteration() {
        Map<String, Integer> inventory = new HashMap<>();
        inventory.put("Apples", 50);
        inventory.put("Bananas", 30);
        inventory.put("Oranges", 25);
        inventory.put("Grapes", 40);

        System.out.println("Inventory Report:");
        System.out.println("=".repeat(30));

        // Iterate over entries (key-value pairs)
        for (Map.Entry<String, Integer> entry : inventory.entrySet()) {
            String item = entry.getKey();
            Integer quantity = entry.getValue();
            String status = quantity > 35 ? "Well stocked" : "Low stock";

            System.out.printf("%-10s: %3d units (%s)%n", item, quantity, status);
        }

        // Iterate over keys only
        System.out.println("\nAll items:");
        for (String item : inventory.keySet()) {
            System.out.println("- " + item);
        }

        // Iterate over values only
        int totalQuantity = 0;
        for (Integer quantity : inventory.values()) {
            totalQuantity += quantity;
        }
        System.out.println("\nTotal items in inventory: " + totalQuantity);
    }

    public static void nestedCollectionIteration() {
        // Map of lists - students by grade level
        Map<String, List<String>> studentsByGrade = new HashMap<>();
        studentsByGrade.put("Freshman", Arrays.asList("Alice", "Bob", "Charlie"));
        studentsByGrade.put("Sophomore", Arrays.asList("Diana", "Eve", "Frank"));
        studentsByGrade.put("Junior", Arrays.asList("Grace", "Henry"));
        studentsByGrade.put("Senior", Arrays.asList("Ivy", "Jack", "Kate", "Liam"));

        System.out.println("Students by Grade Level:");
        System.out.println("=".repeat(40));

        for (Map.Entry<String, List<String>> entry : studentsByGrade.entrySet()) {
            String grade = entry.getKey();
            List<String> students = entry.getValue();

            System.out.println(grade + " (" + students.size() + " students):");
            for (String student : students) {
                System.out.println("  - " + student);
            }
            System.out.println();
        }
    }

    public static void complexDataProcessing() {
        // List of maps - representing database-like records
        List<Map<String, Object>> employees = Arrays.asList(
            Map.of("name", "Alice", "department", "Engineering", "salary", 75000, "years", 3),
            Map.of("name", "Bob", "department", "Marketing", "salary", 65000, "years", 2),
            Map.of("name", "Charlie", "department", "Engineering", "salary", 85000, "years", 5),
            Map.of("name", "Diana", "department", "Sales", "salary", 70000, "years", 4)
        );

        System.out.println("Employee Analysis:");
        System.out.println("=".repeat(50));

        double totalSalary = 0;
        Map<String, Integer> departmentCounts = new HashMap<>();

        for (Map<String, Object> employee : employees) {
            String name = (String) employee.get("name");
            String department = (String) employee.get("department");
            Integer salary = (Integer) employee.get("salary");
            Integer years = (Integer) employee.get("years");

            System.out.printf("%-10s | %-12s | $%,6d | %d years%n",
                name, department, salary, years);

            totalSalary += salary;
            departmentCounts.put(department,
                departmentCounts.getOrDefault(department, 0) + 1);
        }

        System.out.println("\nSummary:");
        System.out.println("Average salary: $" + String.format("%,.0f", totalSalary / employees.size()));

        System.out.println("Department distribution:");
        for (Map.Entry<String, Integer> entry : departmentCounts.entrySet()) {
            System.out.println("  " + entry.getKey() + ": " + entry.getValue() + " employees");
        }
    }
}
```

---

## Advanced Techniques

### Custom Iterable Objects

```java
import java.util.*;

public class CustomIterableExample {
    // Custom class that implements Iterable
    static class NumberRange implements Iterable<Integer> {
        private final int start;
        private final int end;
        private final int step;

        public NumberRange(int start, int end, int step) {
            this.start = start;
            this.end = end;
            this.step = step;
        }

        public NumberRange(int start, int end) {
            this(start, end, 1);
        }

        @Override
        public Iterator<Integer> iterator() {
            return new Iterator<Integer>() {
                private int current = start;

                @Override
                public boolean hasNext() {
                    return current < end;
                }

                @Override
                public Integer next() {
                    if (!hasNext()) {
                        throw new NoSuchElementException();
                    }
                    int result = current;
                    current += step;
                    return result;
                }
            };
        }
    }

    public static void customIterableDemo() {
        System.out.println("Custom Range Examples:");

        // Range from 1 to 10
        NumberRange range1 = new NumberRange(1, 10);
        System.out.print("Range 1-10: ");
        for (Integer number : range1) {
            System.out.print(number + " ");
        }
        System.out.println();

        // Range with custom step
        NumberRange range2 = new NumberRange(0, 20, 3);
        System.out.print("Range 0-20 (step 3): ");
        for (Integer number : range2) {
            System.out.print(number + " ");
        }
        System.out.println();

        // Even numbers from 2 to 20
        NumberRange evenNumbers = new NumberRange(2, 21, 2);
        System.out.print("Even numbers 2-20: ");
        for (Integer number : evenNumbers) {
            System.out.print(number + " ");
        }
        System.out.println();
    }
}
```

### Performance Considerations

```java
import java.util.*;

public class PerformanceComparison {
    public static void compareIterationMethods() {
        List<Integer> largeList = new ArrayList<>();
        for (int i = 0; i < 1000000; i++) {
            largeList.add(i);
        }

        // Method 1: Enhanced for loop (recommended)
        long startTime = System.nanoTime();
        long sum1 = 0;
        for (Integer number : largeList) {
            sum1 += number;
        }
        long enhancedForTime = System.nanoTime() - startTime;

        // Method 2: Traditional for loop with get()
        startTime = System.nanoTime();
        long sum2 = 0;
        for (int i = 0; i < largeList.size(); i++) {
            sum2 += largeList.get(i);
        }
        long traditionalForTime = System.nanoTime() - startTime;

        // Method 3: Iterator (what enhanced for loop uses internally)
        startTime = System.nanoTime();
        long sum3 = 0;
        Iterator<Integer> iterator = largeList.iterator();
        while (iterator.hasNext()) {
            sum3 += iterator.next();
        }
        long iteratorTime = System.nanoTime() - startTime;

        System.out.println("Performance Comparison (1M elements):");
        System.out.println("Enhanced for loop: " + enhancedForTime / 1_000_000 + " ms");
        System.out.println("Traditional for loop: " + traditionalForTime / 1_000_000 + " ms");
        System.out.println("Iterator: " + iteratorTime / 1_000_000 + " ms");
        System.out.println("All sums equal: " + (sum1 == sum2 && sum2 == sum3));
    }

    public static void arrayVsListPerformance() {
        int size = 1000000;

        // Array
        int[] array = new int[size];
        for (int i = 0; i < size; i++) {
            array[i] = i;
        }

        // ArrayList
        List<Integer> list = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            list.add(i);
        }

        // Array iteration
        long startTime = System.nanoTime();
        long arraySum = 0;
        for (int number : array) {
            arraySum += number;
        }
        long arrayTime = System.nanoTime() - startTime;

        // List iteration
        startTime = System.nanoTime();
        long listSum = 0;
        for (Integer number : list) {
            listSum += number;
        }
        long listTime = System.nanoTime() - startTime;

        System.out.println("\nArray vs List Iteration:");
        System.out.println("Array time: " + arrayTime / 1_000_000 + " ms");
        System.out.println("List time: " + listTime / 1_000_000 + " ms");
        System.out.println("Array is " + String.format("%.1fx", (double) listTime / arrayTime) + " faster");
    }
}
```

---

## Common Patterns and Best Practices

### Safe Iteration Patterns

```java
import java.util.*;

public class SafeIterationPatterns {
    public static void avoidConcurrentModification() {
        List<String> items = new ArrayList<>(Arrays.asList("apple", "banana", "cherry", "date"));

        // WRONG: This will throw ConcurrentModificationException
        /*
        for (String item : items) {
            if (item.startsWith("b")) {
                items.remove(item); // Don't do this!
            }
        }
        */

        // CORRECT: Use iterator for safe removal
        Iterator<String> iterator = items.iterator();
        while (iterator.hasNext()) {
            String item = iterator.next();
            if (item.startsWith("b")) {
                iterator.remove(); // Safe removal
            }
        }

        // CORRECT: Use removeIf (Java 8+)
        List<String> items2 = new ArrayList<>(Arrays.asList("apple", "banana", "cherry", "date"));
        items2.removeIf(item -> item.startsWith("c"));

        // CORRECT: Collect items to remove, then remove them
        List<String> items3 = new ArrayList<>(Arrays.asList("apple", "banana", "cherry", "date"));
        List<String> toRemove = new ArrayList<>();

        for (String item : items3) {
            if (item.length() > 5) {
                toRemove.add(item);
            }
        }
        items3.removeAll(toRemove);

        System.out.println("Final items: " + items3);
    }

    public static void nullSafeIteration() {
        List<String> potentiallyNullList = null;
        String[] potentiallyNullArray = null;

        // Safe iteration with null checks
        if (potentiallyNullList != null) {
            for (String item : potentiallyNullList) {
                System.out.println(item);
            }
        }

        if (potentiallyNullArray != null) {
            for (String item : potentiallyNullArray) {
                if (item != null) { // Additional null check for array elements
                    System.out.println(item.toUpperCase());
                }
            }
        }

        // Using Optional for safer code (Java 8+)
        Optional<List<String>> optionalList = Optional.ofNullable(potentiallyNullList);
        optionalList.ifPresent(list -> {
            for (String item : list) {
                System.out.println(item);
            }
        });
    }
}
```

### Filtering and Transformation Patterns

```java
import java.util.*;

public class FilteringPatterns {
    public static void filteringExamples() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

        // Filter even numbers
        List<Integer> evenNumbers = new ArrayList<>();
        for (Integer number : numbers) {
            if (number % 2 == 0) {
                evenNumbers.add(number);
            }
        }
        System.out.println("Even numbers: " + evenNumbers);

        // Transform and filter in one pass
        List<String> evenSquareStrings = new ArrayList<>();
        for (Integer number : numbers) {
            if (number % 2 == 0) {
                int square = number * number;
                evenSquareStrings.add("Square of " + number + " is " + square);
            }
        }
        System.out.println("Even squares:");
        for (String description : evenSquareStrings) {
            System.out.println("  " + description);
        }
    }

    public static void groupingPattern() {
        List<String> words = Arrays.asList("apple", "banana", "cherry", "apricot", "blueberry", "avocado");

        // Group words by first letter
        Map<Character, List<String>> wordGroups = new HashMap<>();

        for (String word : words) {
            char firstLetter = word.charAt(0);
            wordGroups.computeIfAbsent(firstLetter, k -> new ArrayList<>()).add(word);
        }

        System.out.println("Words grouped by first letter:");
        for (Map.Entry<Character, List<String>> entry : wordGroups.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}
```

---

## When NOT to Use Enhanced For Loops

### Scenarios Requiring Traditional For Loops

```java
import java.util.*;

public class WhenNotToUseEnhancedFor {
    public static void indexRequiredScenarios() {
        String[] names = {"Alice", "Bob", "Charlie", "Diana"};

        // Need index for numbering
        System.out.println("Numbered list:");
        for (int i = 0; i < names.length; i++) {
            System.out.println((i + 1) + ". " + names[i]);
        }

        // Need to modify array elements
        int[] scores = {85, 92, 78, 90, 88};
        System.out.println("Original scores: " + Arrays.toString(scores));

        // Apply curve (add 5 points to each score)
        for (int i = 0; i < scores.length; i++) {
            scores[i] += 5; // Enhanced for loop can't do this
        }
        System.out.println("Curved scores: " + Arrays.toString(scores));

        // Parallel array processing
        String[] students = {"Alice", "Bob", "Charlie"};
        int[] grades = {85, 92, 78};

        System.out.println("Student grades:");
        for (int i = 0; i < students.length; i++) {
            System.out.println(students[i] + ": " + grades[i]);
        }
    }

    public static void backwardIterationExample() {
        List<String> items = new ArrayList<>(Arrays.asList("first", "second", "third", "fourth"));

        // Remove items while iterating (backward to avoid index issues)
        for (int i = items.size() - 1; i >= 0; i--) {
            if (items.get(i).contains("d")) {
                System.out.println("Removing: " + items.get(i));
                items.remove(i);
            }
        }
        System.out.println("Remaining items: " + items);
    }

    public static void partialIterationExample() {
        int[] data = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

        // Process only middle portion
        System.out.println("Processing middle elements (indices 3-7):");
        for (int i = 3; i < 7; i++) {
            System.out.println("data[" + i + "] = " + data[i]);
        }

        // Skip every other element
        System.out.println("Every other element:");
```
