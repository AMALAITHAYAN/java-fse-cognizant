E-commerce Platform Search Function

Scenario:
This project demonstrates search functionality for an e-commerce platform using linear search and binary search.

Files:
1. Product.java - stores product id, product name, and category.
2. SearchService.java - contains linear search and binary search methods.
3. EcommerceSearchTest.java - runs the example and prints the search results and time complexity analysis.

How to run:
1. Open this folder in VS Code.
2. Open the terminal inside this project folder.
3. Run:
   javac src/*.java
   java -cp src EcommerceSearchTest

Notes:
Linear search checks products one by one, so it works even if the array is not sorted.
Binary search is more efficient for large data, but it needs a sorted array.
