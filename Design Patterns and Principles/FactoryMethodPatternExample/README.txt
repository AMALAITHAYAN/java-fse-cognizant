FactoryMethodPatternExample

This project demonstrates the Factory Method Design Pattern using a simple document management example.

Classes:
- Document: Common interface for all document types.
- WordDocument, PdfDocument, ExcelDocument: Concrete document classes.
- DocumentFactory: Abstract factory class with createDocument().
- WordDocumentFactory, PdfDocumentFactory, ExcelDocumentFactory: Concrete factory classes.
- FactoryMethodTest: Test class to run the program.

How to run:
1. Open the project in VS Code, Eclipse, or IntelliJ.
2. Compile all Java files inside the src folder.
3. Run FactoryMethodTest.java.

Terminal commands:
javac src/*.java
java -cp src FactoryMethodTest

Expected output:
Opening a Word document.
Opening a PDF document.
Opening an Excel document.
Factory Method Pattern implemented successfully.
