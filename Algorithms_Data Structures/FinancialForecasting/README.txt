Financial Forecasting

Scenario:
This project predicts future financial values using past revenue data and recursive calculation.

Files:
1. FinancialForecast.java - calculates average growth rate and predicts future values.
2. ForecastTest.java - tests the forecasting logic and displays analysis.

How to run:
1. Open this folder in VS Code.
2. Open the terminal inside this project folder.
3. Run:
   javac src/*.java
   java -cp src ForecastTest

Notes:
Recursion means a method calls itself until it reaches a stopping condition.
Here, the recursive method predicts future value year by year.
For better performance with large inputs, the optimized method uses the direct compound growth formula.
