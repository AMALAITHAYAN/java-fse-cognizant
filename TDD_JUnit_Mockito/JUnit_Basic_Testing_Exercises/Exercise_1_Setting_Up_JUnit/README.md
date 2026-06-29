# Exercise 1: Setting Up JUnit

## Scenario
You need to set up JUnit in your Java project to start writing unit tests.

## What is included
- Maven Java project structure
- JUnit dependency in `pom.xml`
- A simple `Calculator` class
- A JUnit test class with basic assertions

## JUnit Dependency Used
```xml
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.13.2</version>
    <scope>test</scope>
</dependency>
```

## How to run
Open terminal inside this folder and run:

```bash
mvn test
```

Expected result: Build success and all tests pass.
