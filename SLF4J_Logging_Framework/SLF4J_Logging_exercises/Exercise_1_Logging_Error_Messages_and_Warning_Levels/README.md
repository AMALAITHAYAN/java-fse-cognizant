# Exercise 1: Logging Error Messages and Warning Levels

## Task
Write a Java application that demonstrates logging error messages and warning levels using SLF4J.

## Project Structure

```text
Exercise_1_Logging_Error_Messages_and_Warning_Levels
├── pom.xml
└── src
    └── main
        ├── java
        │   └── com
        │       └── cognizant
        │           └── slf4j
        │               └── LoggingExample.java
        └── resources
            └── logback.xml
```

## Dependencies Used

```xml
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>1.7.30</version>
</dependency>

<dependency>
    <groupId>ch.qos.logback</groupId>
    <artifactId>logback-classic</artifactId>
    <version>1.2.3</version>
</dependency>
```

## Run Commands

```bash
mvn clean compile
mvn exec:java
```

## Expected Output

The console should print one error log and one warning log similar to this:

```text
ERROR com.cognizant.slf4j.LoggingExample - This is an error message
WARN  com.cognizant.slf4j.LoggingExample - This is a warning message
```
