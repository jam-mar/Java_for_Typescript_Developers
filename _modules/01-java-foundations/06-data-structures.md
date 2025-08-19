---
layout: default
title: 1.6 Java Data Structures & Collections
nav_order: 6
---

## Java Collections Framework Overview

Coming from JavaScript, you're used to flexible arrays and objects. Java provides a rich Collections Framework that offers type-safe, performance-optimized data structures with specific use cases.

{: .highlight }
**Key Difference:** JavaScript has arrays and objects. Java has specialized collections for different scenarios - Lists for ordered data, Sets for uniqueness, Maps for key-value pairs, and more.

---

## The Collections Hierarchy

```
                    Collection<E>
                   /      |      \
                  /       |       \
            List<E>    Set<E>    Queue<E>
               |         |         |
        ┌─────────┐ ┌─────────┐ ┌─────────┐
        │ArrayList│ │ HashSet │ │ArrayDeque│
        │LinkedList│ │TreeSet  │ │PriorityQ│
        │ Vector  │ │LinkedHS │ │LinkedList│
        └─────────┘ └─────────┘ └─────────┘

                    Map<K,V>
                      |
                ┌─────────────┐
                │  HashMap    │
                │  TreeMap    │
                │  LinkedHashM│
                │ ConcurrentHM│
                └─────────────┘
```

---

## Lists: Ordered Collections

### ArrayList - Dynamic Arrays

```java
import java.util.*;

public class ArrayListDemo {
    public static void main(String[] args) {
        // ArrayList is like JavaScript arrays but type-safe
        List<String> fruits = new ArrayList<>();  // Diamond operator

        // Adding elements (like JS push)
        fruits.add("apple");
        fruits.add("banana");
        fruits.add("cherry");
        fruits.add(1, "orange");  // Insert at index (like JS splice)

        System.out.println("Fruits: " + fruits);  // [apple, orange, banana, cherry]

        // Accessing elements
        String first = fruits.get(0);              // Like JS array[0]
        String last = fruits.get(fruits.size() - 1); // Like JS array[array.length - 1]

        // Modifying elements
        fruits.set(1, "grape");  // Replace orange with grape

        // Removing elements
        fruits.remove("banana");     // Remove by value
        fruits.remove(0);            // Remove by index

        // Size and checks
        int size = fruits.size();           // Like JS array.length
        boolean isEmpty = fruits.isEmpty();  // Like JS array.length === 0
        boolean contains = fruits.contains("cherry");  // Like JS array.includes()

        // Iteration (multiple ways)

        // 1. Enhanced for loop (like JS for...of)
        for (String fruit : fruits) {
            System.out.println(fruit);
        }

        // 2. Traditional for loop (like JS for loop)
        for (int i = 0; i < fruits.size(); i++) {
            System.out.println(i + ": " + fruits.get(i));
        }

        // 3. Iterator pattern
        Iterator<String> iterator = fruits.iterator();
        while (iterator.hasNext()) {
            String fruit = iterator.next();
            System.out.println(fruit);
            // iterator.remove(); // Safe removal during iteration
        }

        // 4. Streams (like JS array methods)
        fruits.stream()
            .filter(fruit -> fruit.startsWith("c"))    // Like JS .filter()
            .map(String::toUpperCase)                   // Like JS .map()
            .forEach(System.out::println);              // Like JS .forEach()

        // Converting to array
        String[] array = fruits.toArray(new String[0]);

        // Creating from array
        List<String> fromArray = Arrays.asList("a", "b", "c");
        List<String> mutableFromArray = new ArrayList<>(Arrays.asList("x", "y", "z"));

        // Java 9+ factory methods
        List<String> immutableList = List.of("red", "green", "blue");  // Immutable
        // immutableList.add("yellow");  // ❌ UnsupportedOperationException
    }
}
```

### LinkedList - Doubly Linked List

```java
import java.util.*;

public class LinkedListDemo {
    public static void main(String[] args) {
        // LinkedList: Better for frequent insertions/deletions in middle
        LinkedList<Integer> numbers = new LinkedList<>();

        // LinkedList implements both List and Deque interfaces

        // List operations
        numbers.add(10);
        numbers.add(20);
        numbers.add(30);

        // Deque operations (double-ended queue)
        numbers.addFirst(5);     // Add to beginning
        numbers.addLast(40);     // Add to end

        System.out.println("Numbers: " + numbers);  // [5, 10, 20, 30, 40]

        // Queue operations
        numbers.offer(50);       // Add to end (like addLast)
        Integer first = numbers.poll();  // Remove and return first element
        Integer peeked = numbers.peek(); // Look at first without removing

        // Stack operations
        numbers.push(100);       // Add to beginning (like addFirst)
        Integer popped = numbers.pop();  // Remove from beginning

        System.out.println("After queue/stack ops: " + numbers);

        // Performance comparison
        demonstratePerformance();
    }

    private static void demonstratePerformance() {
        List<Integer> arrayList = new ArrayList<>();
        List<Integer> linkedList = new LinkedList<>();

        // ArrayList: Fast random access, slow insertion in middle
        long start = System.nanoTime();
        for (int i = 0; i < 100000; i++) {
            arrayList.add(0, i);  // Insert at beginning - slow for ArrayList
        }
        long arrayListTime = System.nanoTime() - start;

        // LinkedList: Slow random access, fast insertion anywhere
        start = System.nanoTime();
        for (int i = 0; i < 100000; i++) {
            linkedList.add(0, i);  // Insert at beginning - fast for LinkedList
        }
        long linkedListTime = System.nanoTime() - start;

        System.out.printf("ArrayList insertion time: %d ns%n", arrayListTime);
        System.out.printf("LinkedList insertion time: %d ns%n", linkedListTime);
    }
}
```

---

## Sets: Unique Collections

### HashSet - Fast Lookup, No Order

```java
import java.util.*;

public class HashSetDemo {
    public static void main(String[] args) {
        // HashSet: Like JavaScript Set, but type-safe
        Set<String> uniqueWords = new HashSet<>();

        // Adding elements
        uniqueWords.add("java");
        uniqueWords.add("python");
        uniqueWords.add("javascript");
        uniqueWords.add("java");  // Duplicate - won't be added

        System.out.println("Unique words: " + uniqueWords);  // Order not guaranteed
        System.out.println("Size: " + uniqueWords.size());   // 3, not 4

        // Checking membership
        boolean hasJava = uniqueWords.contains("java");  // Like JS set.has()

        // Removing elements
        boolean removed = uniqueWords.remove("python");  // Like JS set.delete()

        // Set operations
        Set<String> programmingLangs = Set.of("java", "c++", "python", "go");
        Set<String> webLangs = Set.of("javascript", "typescript", "java", "php");

        // Union (combine sets)
        Set<String> union = new HashSet<>(programmingLangs);
        union.addAll(webLangs);
        System.out.println("Union: " + union);

        // Intersection (common elements)
        Set<String> intersection = new HashSet<>(programmingLangs);
        intersection.retainAll(webLangs);
        System.out.println("Intersection: " + intersection);  // [java]

        // Difference (elements in first but not second)
        Set<String> difference = new HashSet<>(programmingLangs);
        difference.removeAll(webLangs);
        System.out.println("Difference: " + difference);

        // Creating from array/list
        String[] languages = {"java", "python", "java", "c++"};
        Set<String> uniqueLangs = new HashSet<>(Arrays.asList(languages));
        System.out.println("From array: " + uniqueLangs);  // Duplicates removed
    }
}
```

### TreeSet - Sorted Set

```java
import java.util.*;

public class TreeSetDemo {
    public static void main(String[] args) {
        // TreeSet: Automatically sorted, slower than HashSet
        Set<Integer> sortedNumbers = new TreeSet<>();

        sortedNumbers.add(42);
        sortedNumbers.add(15);
        sortedNumbers.add(67);
        sortedNumbers.add(23);
        sortedNumbers.add(15);  // Duplicate

        System.out.println("Sorted numbers: " + sortedNumbers);  // [15, 23, 42, 67]

        // TreeSet-specific operations
        TreeSet<Integer> treeSet = new TreeSet<>(sortedNumbers);

        System.out.println("First (smallest): " + treeSet.first());    // 15
        System.out.println("Last (largest): " + treeSet.last());       // 67
        System.out.println("Lower than 30: " + treeSet.lower(30));     // 23
        System.out.println("Higher than 30: " + treeSet.higher(30));   // 42

        // Range operations
        Set<Integer> subset = treeSet.subSet(20, 50);  // [23, 42]
        System.out.println("Subset [20, 50): " + subset);

        // Custom sorting with Comparator
        Set<String> wordsByLength = new TreeSet<>(Comparator.comparing(String::length));
        wordsByLength.addAll(Arrays.asList("elephant", "cat", "dog", "butterfly"));
        System.out.println("Words by length: " + wordsByLength);  // [cat, dog, elephant, butterfly]
    }
}
```

---

## Maps: Key-Value Pairs

### HashMap - Fast Key-Value Storage

```java
import java.util.*;

public class HashMapDemo {
    public static void main(String[] args) {
        // HashMap: Like JavaScript Object/Map
        Map<String, Integer> wordCounts = new HashMap<>();

        // Adding key-value pairs
        wordCounts.put("hello", 5);
        wordCounts.put("world", 3);
        wordCounts.put("java", 10);

        // Getting values
        Integer count = wordCounts.get("hello");     // 5
        Integer missing = wordCounts.get("missing"); // null

        // Safe getting with default
        Integer defaultCount = wordCounts.getOrDefault("missing", 0);  // 0

        // Checking keys and values
        boolean hasKey = wordCounts.containsKey("java");      // true
        boolean hasValue = wordCounts.containsValue(10);      // true

        // Updating values
        wordCounts.put("hello", 6);  // Update existing
        wordCounts.putIfAbsent("new", 1);  // Only if key doesn't exist

        // Atomic operations
        wordCounts.merge("hello", 1, Integer::sum);  // Add 1 to existing value
        wordCounts.compute("java", (key, value) -> value * 2);  // Double the value

        System.out.println("Word counts: " + wordCounts);

        // Iteration patterns

        // 1. Iterate over entries (like JS Object.entries())
        for (Map.Entry<String, Integer> entry : wordCounts.entrySet()) {
            System.out.printf("%s: %d%n", entry.getKey(), entry.getValue());
        }

        // 2. Iterate over keys (like JS Object.keys())
        for (String word : wordCounts.keySet()) {
            System.out.printf("%s: %d%n", word, wordCounts.get(word));
        }

        // 3. Iterate over values (like JS Object.values())
        for (Integer count : wordCounts.values()) {
            System.out.println("Count: " + count);
        }

        // 4. Stream iteration
        wordCounts.entrySet().stream()
            .filter(entry -> entry.getValue() > 5)
            .forEach(entry -> System.out.println(entry.getKey() + " appears frequently"));

        // Practical example: counting characters
        String text = "hello world";
        Map<Character, Integer> charCounts = new HashMap<>();

        for (char c : text.toCharArray()) {
            if (c != ' ') {  // Skip spaces
                charCounts.merge(c, 1, Integer::sum);
            }
        }

        System.out.println("Character counts: " + charCounts);

        // Creating maps with initial values
        Map<String, String> capitals = Map.of(
            "USA", "Washington",
            "UK", "London",
            "France", "Paris"
        );  // Immutable map

        // Mutable map with initial values
        Map<String, String> mutableCapitals = new HashMap<>(capitals);
        mutableCapitals.put("Germany", "Berlin");
    }
}
```

### TreeMap - Sorted Map

```java
import java.util.*;

public class TreeMapDemo {
    public static void main(String[] args) {
        // TreeMap: Sorted by keys
        Map<String, Integer> sortedGrades = new TreeMap<>();

        sortedGrades.put("Charlie", 85);
        sortedGrades.put("Alice", 92);
        sortedGrades.put("Bob", 78);
        sortedGrades.put("Diana", 95);

        System.out.println("Grades (sorted by name): " + sortedGrades);
        // {Alice=92, Bob=78, Charlie=85, Diana=95}

        // TreeMap-specific operations
        TreeMap<String, Integer> treeMap = new TreeMap<>(sortedGrades);

        System.out.println("First entry: " + treeMap.firstEntry());    // Alice=92
        System.out.println("Last entry: " + treeMap.lastEntry());      // Diana=95

        // Range operations
        Map<String, Integer> subMap = treeMap.subMap("Bob", "Diana");   // Bob, Charlie
        System.out.println("Bob to Diana: " + subMap);

        // Custom sorting by values
        Map<String, Integer> gradesByScore = new TreeMap<>(
            (name1, name2) -> sortedGrades.get(name1).compareTo(sortedGrades.get(name2))
        );
        gradesByScore.putAll(sortedGrades);
        System.out.println("Sorted by grade: " + gradesByScore);
    }
}
```

---

## Queues and Deques

### Queue Interface and Implementations

```java
import java.util.*;

public class QueueDemo {
    public static void main(String[] args) {
        // Queue: FIFO (First In, First Out)
        Queue<String> queue = new LinkedList<>();

        // Adding elements (enqueue)
        queue.offer("first");    // Preferred method
        queue.offer("second");
        queue.offer("third");

        System.out.println("Queue: " + queue);  // [first, second, third]

        // Examining head without removal
        String head = queue.peek();  // "first", null if empty

        // Removing elements (dequeue)
        String removed = queue.poll();  // "first", null if empty
        System.out.println("Removed: " + removed);
        System.out.println("Queue after poll: " + queue);  // [second, third]

        // Alternative methods (throw exceptions on failure)
        queue.add("fourth");     // Like offer(), but throws exception if fails
        String element = queue.element();  // Like peek(), but throws exception if empty
        String removed2 = queue.remove();  // Like poll(), but throws exception if empty

        demonstratePriorityQueue();
        demonstrateDeque();
    }

    private static void demonstratePriorityQueue() {
        // PriorityQueue: Elements ordered by priority
        Queue<Integer> priorityQueue = new PriorityQueue<>();  // Min heap by default

        priorityQueue.offer(30);
        priorityQueue.offer(10);
        priorityQueue.offer(50);
        priorityQueue.offer(20);

        System.out.println("Priority queue: " + priorityQueue);  // Internal order

        // Elements come out in priority order
        while (!priorityQueue.isEmpty()) {
            System.out.print(priorityQueue.poll() + " ");  // 10 20 30 50
        }
        System.out.println();

        // Custom priority (max heap)
        Queue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        maxHeap.addAll(Arrays.asList(30, 10, 50, 20));

        while (!maxHeap.isEmpty()) {
            System.out.print(maxHeap.poll() + " ");  // 50 30 20 10
        }
        System.out.println();

        // Custom objects with priority
        Queue<Task> taskQueue = new PriorityQueue<>(Comparator.comparing(Task::getPriority));
        taskQueue.offer(new Task("Low priority task", 3));
        taskQueue.offer(new Task("High priority task", 1));
        taskQueue.offer(new Task("Medium priority task", 2));

        while (!taskQueue.isEmpty()) {
            System.out.println(taskQueue.poll());
        }
    }

    private static void demonstrateDeque() {
        // Deque: Double-ended queue (can add/remove from both ends)
        Deque<String> deque = new ArrayDeque<>();

        // Add to both ends
        deque.addFirst("middle");
        deque.addFirst("first");
        deque.addLast("last");

        System.out.println("Deque: " + deque);  // [first, middle, last]

        // Remove from both ends
        String first = deque.removeFirst();  // "first"
        String last = deque.removeLast();    // "last"

        System.out.println("After removal: " + deque);  // [middle]

        // Use as stack (LIFO)
        Deque<String> stack = new ArrayDeque<>();
        stack.push("bottom");
        stack.push("middle");
        stack.push("top");

        while (!stack.isEmpty()) {
            System.out.print(stack.pop() + " ");  // top middle bottom
        }
        System.out.println();
    }

    static class Task {
        private String description;
        private int priority;

        public Task(String description, int priority) {
            this.description = description;
            this.priority = priority;
        }

        public int getPriority() { return priority; }

        @Override
        public String toString() {
            return String.format("Task{desc='%s', priority=%d}", description, priority);
        }
    }
}
```

---

## Collection Utilities and Algorithms

### Collections Class

```java
import java.util.*;

public class CollectionsUtilDemo {
    public static void main(String[] args) {
        List<Integer> numbers = new ArrayList<>(Arrays.asList(5, 2, 8, 1, 9, 3));

        // Sorting
        Collections.sort(numbers);  // Natural order
        System.out.println("Sorted: " + numbers);

        Collections.sort(numbers, Collections.reverseOrder());  // Reverse order
        System.out.println("Reverse sorted: " + numbers);

        // Shuffling
        Collections.shuffle(numbers);
        System.out.println("Shuffled: " + numbers);

        // Searching (binary search - list must be sorted)
        Collections.sort(numbers);
        int index = Collections.binarySearch(numbers, 5);
        System.out.println("Index of 5: " + index);

        // Min/Max
        int min = Collections.min(numbers);
        int max = Collections.max(numbers);
        System.out.printf("Min: %d, Max: %d%n", min, max);

        // Frequency
        List<String> words = Arrays.asList("apple", "banana", "apple", "cherry", "apple");
        int appleCount = Collections.frequency(words, "apple");
        System.out.println("Apple count: " + appleCount);

        // Rotating
        List<String> items = new ArrayList<>(Arrays.asList("a", "b", "c", "d", "e"));
        Collections.rotate(items, 2);  // Rotate right by 2 positions
        System.out.println("Rotated: " + items);  // [d, e, a, b, c]

        // Filling
        List<String> filled = new ArrayList<>(Arrays.asList("x", "x", "x", "x"));
        Collections.fill(filled, "O");
        System.out.println("Filled: " + filled);  // [O, O, O, O]

        // Creating synchronized collections
        List<String> syncList = Collections.synchronizedList(new ArrayList<>());
        Set<String> syncSet = Collections.synchronizedSet(new HashSet<>());
        Map<String, Integer> syncMap = Collections.synchronizedMap(new HashMap<>());

        // Creating unmodifiable collections
        List<String> unmodifiable = Collections.unmodifiableList(words);
        // unmodifiable.add("new");  // ❌ UnsupportedOperationException

        // Singleton collections
        Set<String> singletonSet = Collections.singleton("only");
        List<String> singletonList = Collections.singletonList("only");
        Map<String, String> singletonMap = Collections.singletonMap("key", "value");
    }
}
```

---

## Stream API with Collections

### Functional Operations on Collections

```java
import java.util.*;
import java.util.stream.*;

public class StreamWithCollections {
    public static void main(String[] args) {
        List<String> languages = Arrays.asList(
            "Java", "Python", "JavaScript", "C++", "Go", "Rust", "TypeScript"
        );

        // Filter and collect
        List<String> longNames = languages.stream()
            .filter(lang -> lang.length() > 4)
            .collect(Collectors.toList());
        System.out.println("Long names: " + longNames);

        // Map and collect to Set
        Set<Integer> lengths = languages.stream()
            .map(String::length)
            .collect(Collectors.toSet());
        System.out.println("Unique lengths: " + lengths);

        // Group by length
        Map<Integer, List<String>> byLength = languages.stream()
            .collect(Collectors.groupingBy(String::length));
        System.out.println("Grouped by length: " + byLength);

        // Partition by predicate
        Map<Boolean, List<String>> scripted = languages.stream()
            .collect(Collectors.partitioningBy(lang -> lang.contains("Script")));
        System.out.println("Scripted languages: " + scripted.get(true));
        System.out.println("Non-scripted languages: " + scripted.get(false));

        // Complex example: word frequency
        String text = "the quick brown fox jumps over the lazy dog the fox is quick";
        Map<String, Long> wordFrequency = Arrays.stream(text.split(" "))
            .collect(Collectors.groupingBy(
                word -> word,
                Collectors.counting()
            ));
        System.out.println("Word frequency: " + wordFrequency);

        // Find most frequent word
        Optional<Map.Entry<String, Long>> mostFrequent = wordFrequency.entrySet().stream()
            .max(Map.Entry.comparingByValue());
        mostFrequent.ifPresent(entry ->
            System.out.printf("Most frequent word: '%s' (%d times)%n",
                            entry.getKey(), entry.getValue()));

        demonstrateStudentData();
    }

    private static void demonstrateStudentData() {
        List<Student> students = Arrays.asList(
            new Student("Alice", 22, "Computer Science", 3.8),
            new Student("Bob", 20, "Mathematics", 3.6),
            new Student("Charlie", 23, "Computer Science", 3.9),
            new Student("Diana", 21, "Physics", 3.7),
            new Student("Eve", 22, "Mathematics", 3.5),
            new Student("Frank", 24, "Physics", 3.4)
        );

        // Average GPA by major
        Map<String, Double> avgGpaByMajor = students.stream()
            .collect(Collectors.groupingBy(
                Student::getMajor,
                Collectors.averagingDouble(Student::getGpa)
            ));
        System.out.println("Average GPA by major: " + avgGpaByMajor);

        // Top student by GPA
        Optional<Student> topStudent = students.stream()
            .max(Comparator.comparing(Student::getGpa));
        topStudent.ifPresent(student ->
            System.out.println("Top student: " + student));

        // Students by age group
        Map<String, List<Student>> ageGroups = students.stream()
            .collect(Collectors.groupingBy(student -> {
                int age = student.getAge();
                if (age <= 21) return "Young";
                else if (age <= 23) return "Middle";
                else return "Senior";
            }));
        System.out.println("Age groups: " + ageGroups);

        // Custom collector: concatenate names
        String allNames = students.stream()
            .map(Student::getName)
            .collect(Collectors.joining(", ", "[", "]"));
        System.out.println("All names: " + allNames);
    }

    static class Student {
        private String name;
        private int age;
        private String major;
        private double gpa;

        public Student(String name, int age, String major, double gpa) {
            this.name = name;
            this.age = age;
            this.major = major;
            this.gpa = gpa;
        }

        // Getters
        public String getName() { return name; }
        public int getAge() { return age; }
        public String getMajor() { return major; }
        public double getGpa() { return gpa; }

        @Override
        public String toString() {
            return String.format("Student{name='%s', age=%d, major='%s', gpa=%.1f}",
                               name, age, major, gpa);
        }
    }
}
```

---

## Performance Characteristics

### When to Use Which Collection

| Collection        | Best Use Case                | Time Complexity                               | Space Overhead |
| ----------------- | ---------------------------- | --------------------------------------------- | -------------- |
| **ArrayList**     | Random access, iteration     | O(1) access, O(n) insertion                   | Low            |
| **LinkedList**    | Frequent insertion/deletion  | O(n) access, O(1) insertion at known position | High           |
| **HashSet**       | Fast lookup, unique elements | O(1) average operations                       | Medium         |
| **TreeSet**       | Sorted unique elements       | O(log n) operations                           | Medium         |
| **HashMap**       | Fast key-value lookup        | O(1) average operations                       | Medium         |
| **TreeMap**       | Sorted key-value pairs       | O(log n) operations                           | Medium         |
| **ArrayDeque**    | Stack/Queue operations       | O(1) both ends                                | Low            |
| **PriorityQueue** | Priority-based processing    | O(log n) insertion/removal                    | Low            |

### Performance Testing Example

```java
import java.util.*;

public class PerformanceComparison {
    private static final int OPERATIONS = 100_000;

    public static void main(String[] args) {
        System.out.println("Performance Comparison (" + OPERATIONS + " operations)");
        System.out.println("=".repeat(60));

        compareListPerformance();
        compareSetPerformance();
        compareMapPerformance();
    }

    private static void compareListPerformance() {
        System.out.println("LIST PERFORMANCE:");

        // ArrayList - good for random access
        List<Integer> arrayList = new ArrayList<>();
        long start = System.nanoTime();
        for (int i = 0; i < OPERATIONS; i++) {
            arrayList.add(i);  // Add at end
        }
        long arrayListAdd = System.nanoTime() - start;

        // LinkedList - good for insertion at beginning
        List<Integer> linkedList = new LinkedList<>();
        start = System.nanoTime();
        for (int i = 0; i < OPERATIONS; i++) {
            linkedList.add(0, i);  // Add at beginning
        }
        long linkedListAdd = System.nanoTime() - start;

        System.out.printf("ArrayList add at end: %d ms%n", arrayListAdd / 1_000_000);
        System.out.printf("LinkedList add at start: %d ms%n", linkedListAdd / 1_000_000);

        // Random access performance
        Random random = new Random();
        start = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            arrayList.get(random.nextInt(arrayList.size()));
        }
        long arrayListAccess = System.nanoTime() - start;

        start = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            linkedList.get(random.nextInt(linkedList.size()));
        }
        long linkedListAccess = System.nanoTime() - start;

        System.out.printf("ArrayList random access: %d ms%n", arrayListAccess / 1_000_000);
        System.out.printf("LinkedList random access: %d ms%n", linkedListAccess / 1_000_000);
        System.out.println();
    }

    private static void compareSetPerformance() {
        System.out.println("SET PERFORMANCE:");

        Set<Integer> hashSet = new HashSet<>();
        Set<Integer> treeSet = new TreeSet<>();

        // Insertion performance
        long start = System.nanoTime();
        for (int i = 0; i < OPERATIONS; i++) {
            hashSet.add(i);
        }
        long hashSetAdd = System.nanoTime() - start;

        start = System.nanoTime();
        for (int i = 0; i < OPERATIONS; i++) {
            treeSet.add(i);
        }
        long treeSetAdd = System.nanoTime() - start;

        System.out.printf("HashSet add: %d ms%n", hashSetAdd / 1_000_000);
        System.out.printf("TreeSet add: %d ms%n", treeSetAdd / 1_000_000);

        // Lookup performance
        Random random = new Random();
        start = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            hashSet.contains(random.nextInt(OPERATIONS));
        }
        long hashSetLookup = System.nanoTime() - start;

        start = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            treeSet.contains(random.nextInt(OPERATIONS));
        }
        long treeSetLookup = System.nanoTime() - start;

        System.out.printf("HashSet lookup: %d ms%n", hashSetLookup / 1_000_000);
        System.out.printf("TreeSet lookup: %d ms%n", treeSetLookup / 1_000_000);
        System.out.println();
    }

    private static void compareMapPerformance() {
        System.out.println("MAP PERFORMANCE:");

        Map<Integer, String> hashMap = new HashMap<>();
        Map<Integer, String> treeMap = new TreeMap<>();

        // Insertion performance
        long start = System.nanoTime();
        for (int i = 0; i < OPERATIONS; i++) {
            hashMap.put(i, "value" + i);
        }
        long hashMapPut = System.nanoTime() - start;

        start = System.nanoTime();
        for (int i = 0; i < OPERATIONS; i++) {
            treeMap.put(i, "value" + i);
        }
        long treeMapPut = System.nanoTime() - start;

        System.out.printf("HashMap put: %d ms%n", hashMapPut / 1_000_000);
        System.out.printf("TreeMap put: %d ms%n", treeMapPut / 1_000_000);

        // Lookup performance
        Random random = new Random();
        start = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            hashMap.get(random.nextInt(OPERATIONS));
        }
        long hashMapGet = System.nanoTime() - start;

        start = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            treeMap.get(random.nextInt(OPERATIONS));
        }
        long treeMapGet = System.nanoTime() - start;

        System.out.printf("HashMap get: %d ms%n", hashMapGet / 1_000_000);
        System.out.printf("TreeMap get: %d ms%n", treeMapGet / 1_000_000);
    }
}
```

---

## Practical Examples

### Example 1: Word Frequency Counter

```java
import java.util.*;
import java.util.stream.Collectors;

public class WordFrequencyAnalyzer {
    public static void main(String[] args) {
        String text = """
            Java is a powerful programming language. Java is used for
            enterprise applications. Programming in Java requires understanding
            of object-oriented programming concepts. Java programming is fun.
            """;

        // Count word frequencies
        Map<String, Integer> wordFreq = countWords(text);

        // Display results
        System.out.println("Word Frequencies:");
        wordFreq.entrySet().stream()
            .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
            .forEach(entry -> System.out.printf("%-12s: %d%n", entry.getKey(), entry.getValue()));

        // Find unique words
        Set<String> uniqueWords = new HashSet<>(wordFreq.keySet());
        System.out.println("\nUnique words count: " + uniqueWords.size());

        // Words appearing only once
        List<String> singleOccurrence = wordFreq.entrySet().stream()
            .filter(entry -> entry.getValue() == 1)
            .map(Map.Entry::getKey)
            .sorted()
            .collect(Collectors.toList());
        System.out.println("Words appearing once: " + singleOccurrence);
    }

    private static Map<String, Integer> countWords(String text) {
        Map<String, Integer> wordCount = new HashMap<>();

        // Clean and split text
        String[] words = text.toLowerCase()
            .replaceAll("[^a-zA-Z\\s]", "")  // Remove punctuation
            .split("\\s+");                  // Split on whitespace

        // Count each word
        for (String word : words) {
            if (!word.isEmpty()) {
                wordCount.merge(word, 1, Integer::sum);
            }
        }

        return wordCount;
    }
}
```

### Example 2: Student Grade Management System

```java
import java.util.*;
import java.util.stream.Collectors;

public class GradeManager {
    private Map<String, Student> students;
    private Map<String, List<Double>> courseGrades;

    public GradeManager() {
        this.students = new HashMap<>();
        this.courseGrades = new HashMap<>();
    }

    public void addStudent(String id, String name) {
        students.put(id, new Student(id, name));
    }

    public void addGrade(String studentId, String course, double grade) {
        // Validate student exists
        if (!students.containsKey(studentId)) {
            throw new IllegalArgumentException("Student not found: " + studentId);
        }

        // Add grade to student
        students.get(studentId).addGrade(course, grade);

        // Add to course statistics
        courseGrades.computeIfAbsent(course, k -> new ArrayList<>()).add(grade);
    }

    public double getStudentGPA(String studentId) {
        Student student = students.get(studentId);
        return student != null ? student.calculateGPA() : 0.0;
    }

    public Map<String, Double> getCourseAverages() {
        return courseGrades.entrySet().stream()
            .collect(Collectors.toMap(
                Map.Entry::getKey,
                entry -> entry.getValue().stream()
                    .mapToDouble(Double::doubleValue)
                    .average()
                    .orElse(0.0)
            ));
    }

    public List<Student> getTopStudents(int count) {
        return students.values().stream()
            .sorted(Comparator.comparing(Student::calculateGPA).reversed())
            .limit(count)
            .collect(Collectors.toList());
    }

    public Map<String, List<Student>> getStudentsByGradeRange() {
        return students.values().stream()
            .collect(Collectors.groupingBy(student -> {
                double gpa = student.calculateGPA();
                if (gpa >= 3.7) return "A";
                else if (gpa >= 3.0) return "B";
                else if (gpa >= 2.0) return "C";
                else return "D";
            }));
    }

    public static void main(String[] args) {
        GradeManager manager = new GradeManager();

        // Add students
        manager.addStudent("S001", "Alice Johnson");
        manager.addStudent("S002", "Bob Smith");
        manager.addStudent("S003", "Charlie Brown");
        manager.addStudent("S004", "Diana Prince");

        // Add grades
        manager.addGrade("S001", "Math", 95.0);
        manager.addGrade("S001", "Physics", 88.0);
        manager.addGrade("S001", "Chemistry", 92.0);

        manager.addGrade("S002", "Math", 78.0);
        manager.addGrade("S002", "Physics", 85.0);
        manager.addGrade("S002", "Chemistry", 80.0);

        manager.addGrade("S003", "Math", 88.0);
        manager.addGrade("S003", "Physics", 90.0);
        manager.addGrade("S003", "Chemistry", 87.0);

        manager.addGrade("S004", "Math", 98.0);
        manager.addGrade("S004", "Physics", 95.0);
        manager.addGrade("S004", "Chemistry", 97.0);

        // Display results
        System.out.println("=== Student GPAs ===");
        manager.students.values().forEach(student ->
            System.out.printf("%s: %.2f%n", student.getName(), student.calculateGPA()));

        System.out.println("\n=== Course Averages ===");
        manager.getCourseAverages().forEach((course, avg) ->
            System.out.printf("%s: %.2f%n", course, avg));

        System.out.println("\n=== Top 3 Students ===");
        manager.getTopStudents(3).forEach(System.out::println);

        System.out.println("\n=== Students by Grade Range ===");
        manager.getStudentsByGradeRange().forEach((range, studentList) -> {
            System.out.printf("%s Grade: %s%n", range,
                studentList.stream().map(Student::getName).collect(Collectors.joining(", ")));
        });
    }

    static class Student {
        private String id;
        private String name;
        private Map<String, Double> grades;

        public Student(String id, String name) {
            this.id = id;
            this.name = name;
            this.grades = new HashMap<>();
        }

        public void addGrade(String course, double grade) {
            grades.put(course, grade);
        }

        public double calculateGPA() {
            return grades.values().stream()
                .mapToDouble(Double::doubleValue)
                .average()
                .orElse(0.0);
        }

        public String getId() { return id; }
        public String getName() { return name; }
        public Map<String, Double> getGrades() { return new HashMap<>(grades); }

        @Override
        public String toString() {
            return String.format("Student{id='%s', name='%s', GPA=%.2f}",
                               id, name, calculateGPA());
        }
    }
}
```

---

## Thread-Safe Collections

### Concurrent Collections

```java
import java.util.concurrent.*;
import java.util.*;

public class ConcurrentCollectionsDemo {
    public static void main(String[] args) throws InterruptedException {
        demonstrateConcurrentHashMap();
        demonstrateCopyOnWriteArrayList();
        demonstrateBlockingQueue();
    }

    private static void demonstrateConcurrentHashMap() {
        // ConcurrentHashMap: Thread-safe alternative to HashMap
        Map<String, Integer> concurrentMap = new ConcurrentHashMap<>();

        // Multiple threads can safely access/modify
        ExecutorService executor = Executors.newFixedThreadPool(5);

        for (int i = 0; i < 5; i++) {
            final int threadId = i;
            executor.submit(() -> {
                for (int j = 0; j < 1000; j++) {
                    String key = "key" + (threadId * 1000 + j);
                    concurrentMap.put(key, j);

                    // Atomic operations
                    concurrentMap.merge("counter", 1, Integer::sum);
                }
            });
        }

        executor.shutdown();
        try {
            executor.awaitTermination(5, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        System.out.println("ConcurrentHashMap size: " + concurrentMap.size());
        System.out.println("Counter value: " + concurrentMap.get("counter"));
    }

    private static void demonstrateCopyOnWriteArrayList() {
        // CopyOnWriteArrayList: Thread-safe list, expensive writes, cheap reads
        List<String> copyOnWriteList = new CopyOnWriteArrayList<>();

        // Safe for concurrent modifications during iteration
        copyOnWriteList.addAll(Arrays.asList("A", "B", "C", "D", "E"));

        // This won't throw ConcurrentModificationException
        for (String item : copyOnWriteList) {
            System.out.println("Item: " + item);
            if ("C".equals(item)) {
                copyOnWriteList.add("F");  // Safe to modify during iteration
            }
        }

        System.out.println("Final list: " + copyOnWriteList);
    }

    private static void demonstrateBlockingQueue() throws InterruptedException {
        // BlockingQueue: Thread-safe queue with blocking operations
        BlockingQueue<String> queue = new ArrayBlockingQueue<>(10);

        // Producer thread
        Thread producer = new Thread(() -> {
            try {
                for (int i = 0; i < 20; i++) {
                    String item = "Item " + i;
                    queue.put(item);  // Blocks if queue is full
                    System.out.println("Produced: " + item);
                    Thread.sleep(100);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        // Consumer thread
        Thread consumer = new Thread(() -> {
            try {
                while (true) {
                    String item = queue.take();  // Blocks if queue is empty
                    System.out.println("Consumed: " + item);
                    Thread.sleep(200);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        producer.start();
        consumer.start();

        Thread.sleep(3000);  // Let them run for 3 seconds
        producer.interrupt();
        consumer.interrupt();
    }
}
```

---

## Key Takeaways

{: .highlight-title }

> Collection Framework Essentials
>
> 1. **Choose the Right Collection**: List for ordered data, Set for uniqueness, Map for key-value
> 2. **Performance Matters**: ArrayList for random access, LinkedList for frequent insertions
> 3. **Thread Safety**: Use concurrent collections for multi-threaded environments
> 4. **Stream API**: Powerful functional operations on collections
> 5. **Immutability**: Prefer immutable collections when possible (List.of(), Set.of())
> 6. **Memory Efficiency**: Consider space vs. time tradeoffs

---

## What's Next?

In **1.7 File Handling & I/O**, we'll explore:

- Reading and writing files in Java
- Different I/O approaches (byte streams, character streams, NIO)
- Working with paths and directories
- Serialization and deserialization
- Modern file processing with streams

---

{: .fs-2 }
[Previous: 1.5 Java Ecosystem](1.5-java-ecosystem.md){: .btn .btn-outline }
[Next: 1.7 File Handling & I/O](1.7-file-handling.md){: .btn .btn-primary }
