#!/bin/bash

# Java Course Structure Generation Script
# This script generates the complete folder structure for the expanded Java course

echo "🚀 Generating Java Course Structure..."

# Create the main modules directory if it doesn't exist
mkdir -p _modules

# Function to create module structure
create_module() {
    local module_number=$1
    local module_name=$2
    local module_title=$3
    shift 3
    local submodules=("$@")
    
    echo "📁 Creating Module $module_number: $module_title"
    
    # Create main module directory
    mkdir -p "_modules/$module_number-$module_name"
    
    # Create submodules
    for i in $(seq 0 $((${#submodules[@]} - 1))); do
        submodule_number=$((i + 1))
        submodule_name="${submodules[i]}"
        submodule_dir="_modules/$module_number-$module_name/$module_number.$submodule_number-$submodule_name"
        
        echo "  📄 Creating $module_number.$submodule_number-$submodule_name"
        mkdir -p "$submodule_dir"
        
        # Create index.md for each submodule
        cat > "$submodule_dir/index.md" << EOF
---
layout: default
title: $module_number.$submodule_number $(echo $submodule_name | sed 's/-/ /g' | sed 's/\b\w/\u&/g')
parent: "Module $module_number: $module_title"
nav_order: $submodule_number
---

Content for this lesson is coming soon.
EOF
    done
    
    # Create main module index
    cat > "_modules/$module_number-$module_name/index.md" << EOF
---
layout: default
title: "Module $module_number: $module_title"
has_children: true
nav_order: $module_number
---

Content for this lesson is coming soon.
EOF
}

# Part I: Java Language Fundamentals

create_module "01" "introduction" "Introduction & Setup" \
    "java-ecosystem-overview" \
    "development-environment" \
    "first-java-program" \
    "comparing-js-ts-java"

create_module "02" "java-basics" "Java Basics" \
    "syntax-fundamentals" \
    "variables-data-types" \
    "control-structures" \
    "methods-program-structure"

create_module "03" "primitive-data-types" "Primitive Data Types, Variables & Arrays" \
    "java-type-system" \
    "primitive-vs-reference" \
    "array-manipulation" \
    "memory-management-basics"

create_module "04" "eclipse-tips" "Eclipse Tips and Tricks" \
    "ide-mastery" \
    "debugging-techniques" \
    "code-generation-refactoring" \
    "workflow-optimization"

create_module "05" "operators" "Operators and Operands" \
    "arithmetic-logical-operations" \
    "comparison-assignment" \
    "operator-precedence" \
    "bitwise-operations"

create_module "06" "strings" "Strings in Java" \
    "string-manipulation" \
    "stringbuilder-performance" \
    "regular-expressions" \
    "text-processing-patterns"

create_module "07" "control-statements" "Control Statements" \
    "conditional-logic" \
    "loops" \
    "enhanced-for-loops" \
    "flow-control-best-practices"

# Part II: Object-Oriented Programming

create_module "08" "miscellaneous" "Miscellaneous Java Concepts" \
    "packages-imports" \
    "access-modifiers" \
    "static-vs-instance" \
    "constants-final-keyword"

create_module "09" "iteration" "Iteration Statements in Java" \
    "advanced-looping" \
    "iterator-pattern" \
    "enhanced-foreach" \
    "performance-considerations"

create_module "10" "methods" "Methods in Java" \
    "method-design-overloading" \
    "parameter-passing" \
    "varargs-signatures" \
    "method-references-lambdas"

create_module "11" "enumerations" "Enumerations in Java" \
    "enum-fundamentals" \
    "enum-methods-constructors" \
    "enumset-enummap" \
    "comparing-typescript-enums"

create_module "12" "debugging" "Debugging Tools" \
    "debugging-strategies" \
    "ide-debugger" \
    "logging-frameworks-intro" \
    "profiling-performance"

create_module "13" "oop" "Object-Oriented Programming" \
    "classes-objects" \
    "inheritance-polymorphism" \
    "encapsulation-principles" \
    "abstract-classes-interfaces"

# Part III: Advanced Java Concepts

create_module "14" "oop-interview" "OOP Interview Questions" \
    "design-patterns" \
    "interface-vs-abstract" \
    "inheritance-best-practices" \
    "real-world-scenarios"

create_module "15" "exam-oop" "EXAM - OOP & Design Patterns" \
    "oop-assessment" \
    "design-pattern-implementations" \
    "code-review-exercises" \
    "best-practice-evaluation"

create_module "16" "exception-handling" "Exception Handling" \
    "exception-hierarchy" \
    "try-catch-finally" \
    "custom-exceptions" \
    "error-handling-strategies"

create_module "17" "collections" "Java Collections Framework" \
    "list-set-map-interfaces" \
    "arraylist-linkedlist-hashmap" \
    "collection-algorithms" \
    "comparing-js-arrays-objects"

create_module "18" "generics" "Generics" \
    "generic-classes-methods" \
    "type-bounds-wildcards" \
    "generic-collections" \
    "comparing-typescript-generics"

create_module "19" "collections-advanced" "Java Collections Deep Dive" \
    "performance-characteristics" \
    "concurrent-collections" \
    "custom-implementations" \
    "best-practices-pitfalls"

create_module "20" "functional-programming" "Functional Programming in Java" \
    "lambda-expressions" \
    "method-references" \
    "functional-interfaces" \
    "comparing-js-functions"

# Part IV: Modern Java & Advanced Topics

create_module "21" "stream-api" "Stream API" \
    "stream-creation-operations" \
    "intermediate-terminal-operations" \
    "parallel-streams" \
    "comparing-js-array-methods"

create_module "22" "functional-advanced" "Functional Programming Advanced" \
    "advanced-lambda-techniques" \
    "functional-composition" \
    "monads-optional" \
    "performance-considerations"

create_module "23" "input-output" "Input and Output & NIO" \
    "file-io-operations" \
    "streams-readers-writers" \
    "nio-features" \
    "path-files-api"

create_module "24" "io-internals" "I/O in Java Internals" \
    "buffer-management" \
    "channel-operations" \
    "memory-mapped-files" \
    "performance-optimization"

create_module "25" "multithreading" "Multithreading" \
    "thread-creation-management" \
    "synchronization-mechanisms" \
    "thread-pools-executors" \
    "comparing-js-async-await"

create_module "26" "multithreading-advanced" "Multithreading Advanced" \
    "concurrent-data-structures" \
    "lock-free-programming" \
    "completablefuture-async" \
    "performance-tuning"

create_module "27" "date-time" "Date and Time in JDK" \
    "modern-datetime-api" \
    "localdate-time-datetime" \
    "timezones-formatting" \
    "comparing-js-date"

create_module "28" "reflection" "Java Reflection & Annotations" \
    "runtime-type-inspection" \
    "dynamic-method-invocation" \
    "annotations" \
    "reflection-best-practices"

create_module "29" "jdk-api" "JDK API Deep Dive" \
    "essential-jdk-packages" \
    "utility-classes-methods" \
    "performance-critical-apis" \
    "version-compatibility"

create_module "30" "modules" "Modules in Java & Java Apps" \
    "jpms" \
    "modular-applications" \
    "module-dependencies-services" \
    "migration-strategies"

# Part V: Enterprise Development

create_module "31" "i18n-l10n" "Internationalization & Localization" \
    "resource-bundles" \
    "locale-specific-formatting" \
    "unicode-handling" \
    "multi-language-design"

create_module "32" "java-internals" "Java Core Internals" \
    "jvm-architecture" \
    "memory-management-gc" \
    "class-loading" \
    "performance-profiling"

create_module "33" "logging" "Logging in Java" \
    "logging-frameworks" \
    "log-levels-configuration" \
    "structured-logging" \
    "monitoring-alerting"

create_module "34" "java-versions" "Java New Versions" \
    "java-release-cycle" \
    "new-features-by-version" \
    "migration-strategies" \
    "keeping-up-evolution"

create_module "35" "exam-fundamentals" "EXAM - Java Fundamentals" \
    "comprehensive-assessment" \
    "real-world-problem-solving" \
    "code-quality-evaluation" \
    "performance-optimization"

create_module "36" "bonus" "Bonus Section" \
    "advanced-design-patterns" \
    "best-practices-compendium" \
    "career-guidance" \
    "open-source-contribution"

# Create corresponding code examples directories
echo "📁 Creating code examples structure..."

mkdir -p code_examples

for i in {01..36}; do
    # Determine module name based on number
    case $i in
        01) module_name="introduction" ;;
        02) module_name="java-basics" ;;
        03) module_name="primitive-data-types" ;;
        04) module_name="eclipse-tips" ;;
        05) module_name="operators" ;;
        06) module_name="strings" ;;
        07) module_name="control-statements" ;;
        08) module_name="miscellaneous" ;;
        09) module_name="iteration" ;;
        10) module_name="methods" ;;
        11) module_name="enumerations" ;;
        12) module_name="debugging" ;;
        13) module_name="oop" ;;
        14) module_name="oop-interview" ;;
        15) module_name="exam-oop" ;;
        16) module_name="exception-handling" ;;
        17) module_name="collections" ;;
        18) module_name="generics" ;;
        19) module_name="collections-advanced" ;;
        20) module_name="functional-programming" ;;
        21) module_name="stream-api" ;;
        22) module_name="functional-advanced" ;;
        23) module_name="input-output" ;;
        24) module_name="io-internals" ;;
        25) module_name="multithreading" ;;
        26) module_name="multithreading-advanced" ;;
        27) module_name="date-time" ;;
        28) module_name="reflection" ;;
        29) module_name="jdk-api" ;;
        30) module_name="modules" ;;
        31) module_name="i18n-l10n" ;;
        32) module_name="java-internals" ;;
        33) module_name="logging" ;;
        34) module_name="java-versions" ;;
        35) module_name="exam-fundamentals" ;;
        36) module_name="bonus" ;;
    esac
    
    code_dir="code_examples/$i-$module_name"
    mkdir -p "$code_dir"
    
    # Create basic Java example file
    cat > "$code_dir/Example.java" << EOF
// Module $i: $(echo $module_name | sed 's/-/ /g' | sed 's/\b\w/\u&/g')
// Example code for this module

public class Example {
    public static void main(String[] args) {
        System.out.println("Module $i: $(echo $module_name | sed 's/-/ /g' | sed 's/\b\w/\u&/g')");
        // Add your example code here
    }
}
EOF

    # Create README for each code example
    cat > "$code_dir/README.md" << EOF
# Module $i: $(echo $module_name | sed 's/-/ /g' | sed 's/\b\w/\u&/g')

This directory contains code examples for Module $i.

## Examples Included

- \`Example.java\` - Basic example demonstrating key concepts

## How to Run

\`\`\`bash
javac Example.java
java Example
\`\`\`

## Related Concepts

- Add key concepts here
- Link to relevant documentation
- Include JavaScript/TypeScript comparisons
EOF
done

echo ""
echo "✅ Course structure generation complete!"
echo ""
echo "📊 Summary:"
echo "   • Created 36 modules with submodules"
echo "   • Generated HTML index files for each section"
echo "   • Created corresponding code examples directories"
echo "   • Added Java example files and documentation"
echo ""
echo "🎯 Next Steps:"
echo "   1. Review the generated structure"
echo "   2. Customize the content in each index.html file"
echo "   3. Add your Java code examples"
echo "   4. Update the main course index to link to new modules"
echo ""
echo "🚀 Happy coding!"