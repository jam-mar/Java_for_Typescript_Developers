---
layout: default
title: 01.2 Development Environment
parent: "Module 01: Introduction & Setup"
nav_order: 2
---

# Setting Up Your Java Development Environment

There are many different ways to set up a Java development environment and a variety of tools available to help you write, test, and debug your code.

Let's get you coding in Java quickly with two free, reliable tools that will serve you throughout this course.
{: .important }
Goal: Install Java and Eclipse, then write your first Java program in under 30 minutes.

---

## Step 1: Install Java Development Kit (JDK)

### Download OpenJDK (Free)

1. **Visit**: [https://openjdk.org/](https://openjdk.org/)
2. **Click**: "JDK 17" (Long Term Support version)
3. **Download**: Choose your operating system (Windows, macOS, or Linux)
4. **Install**: Run the installer and follow the default options

### Verify Installation

Open your terminal/command prompt and type:

```bash
java -version
javac -version
```

You should see something like:

```
openjdk version "17.0.9" 2023-10-17
javac 17.0.9
```

{: .note }
If the commands aren't recognized, you may need to restart your terminal or add Java to your system PATH (the installer usually does this automatically).

---

## Step 2: Install Eclipse IDE (Free)

### Download Eclipse

1. **Visit**: [https://www.eclipse.org/downloads/](https://www.eclipse.org/downloads/)
2. **Click**: "Download" (the big orange button)
3. **Choose**: "Eclipse IDE for Java Developers"
4. **Install**: Follow the installer instructions

### First Launch

1. **Create Workspace**: Choose a folder where your Java projects will be stored (e.g., `~/java-workspace`)
2. **Welcome Screen**: Close the welcome tab to see the main Eclipse interface

---

## Step 3: Create Your First Java Project

### In Eclipse:

1. **File** → **New** → **Java Project**
2. **Project name**: `JavaLearning`
3. **Use default location**: Check this box
4. **JRE**: Should automatically select your installed Java 17
5. **Click**: **Finish**

### Create Your First Java Class:

1. **Right-click** on your project `JavaLearning` in the Package Explorer
2. **New** → **Class**
3. **Package**: `com.example`
4. **Name**: `HelloWorld`
5. **Check**: "public static void main(String[] args)"
6. **Click**: **Finish**

---

## Step 4: Write and Run Your First Program

Eclipse will create a basic class. Replace the generated code with:

```java
package com.example;

public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("🚀 Welcome to Java!");
        System.out.println("Java version: " + System.getProperty("java.version"));

        // Basic Java features
        String name = "Future Java Developer";
        int currentYear = 2024;
        boolean isExcited = true;

        System.out.println("Hello, " + name + "!");
        System.out.println("Year: " + currentYear);
        System.out.println("Ready to learn Java: " + isExcited);

        System.out.println("✅ Your Java environment is working perfectly!");
    }
}
```

### Run Your Program:

1. **Right-click** on `HelloWorld.java` in the Package Explorer
2. **Run As** → **Java Application**

You should see output in the Console tab:

```
🚀 Welcome to Java!
Java version: 17.0.9
Hello, Future Java Developer!
Year: 2024
Ready to learn Java: true
✅ Your Java environment is working perfectly!
```

---

## Essential Eclipse Tips

### Useful Shortcuts:

- **Ctrl+Space**: Auto-completion
- **Ctrl+Shift+O**: Organize imports
- **Ctrl+/**: Comment/uncomment line
- **Ctrl+S**: Save (auto-compiles your code)

### Eclipse Features:

- **Auto-compilation**: Your code compiles automatically when you save
- **Error highlighting**: Red underlines show compilation errors
- **Quick fixes**: Click the lightbulb icon for suggested solutions

---

## Project Structure

Your project should look like this:

```
JavaLearning/
├── src/
│   └── com/
│       └── example/
│           └── HelloWorld.java
└── bin/          (compiled .class files - Eclipse manages this)
```

---

## Troubleshooting

### "Java not found" error:

- Make sure you downloaded the **JDK**, not just the JRE
- Restart your computer after installation
- Check that `java -version` works in terminal

### Eclipse not recognizing Java:

- **Window** → **Preferences** → **Java** → **Installed JREs**
- Click **Add** and browse to your JDK installation folder

### Code has red error marks:

- Save the file (Ctrl+S) to trigger compilation
- Check for typos in your code
- Look at the Problems tab at the bottom for error details

---

## What's Next?

You now have everything needed for Java development:

- ✅ Java 17 JDK installed
- ✅ Eclipse IDE configured
- ✅ First Java program running
- ✅ Understanding of basic project structure

In **1.3 First Java Program**, we'll explore Java syntax and write a more substantial application that demonstrates core programming concepts.

---

{: .highlight-title }

> Quick Setup Summary
>
> 1. **OpenJDK 17**: Free, stable, enterprise-ready
> 2. **Eclipse IDE**: Free, powerful, beginner-friendly
> 3. **Simple workflow**: Write → Save → Run
> 4. **Everything you need**: No additional tools required to start learning

Ready to dive deeper into Java? Let's go! 🚀

<div class="navigation-buttons">
  <a href="{% link _modules/01-introduction/01.1-java-ecosystem-overview/index.md %}" class="btn btn-outline btn-nav btn-nav-prev">← Previous: 1.1 Java Ecosystem Overview</a>
  <a href="{% link _modules/01-introduction/01.3-first-java-program/index.md %}" class="btn btn-primary btn-nav btn-nav-next">Next: 1.3 First Java Program →</a>
</div>
{: .fs-2 }
