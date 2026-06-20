public class ForecastTest {

    public static void main(String[] args) {
        double[] pastRevenue = {10000, 11200, 12500, 14000, 15800};
        int yearsToPredict = 3;

        FinancialForecast forecast = new FinancialForecast();

        double growthRate = forecast.calculateAverageGrowthRate(pastRevenue);
        double currentRevenue = pastRevenue[pastRevenue.length - 1];

        double recursivePrediction = forecast.predictFutureValue(currentRevenue, growthRate, yearsToPredict);
        double optimizedPrediction = forecast.predictFutureValueOptimized(currentRevenue, growthRate, yearsToPredict);

        System.out.println("Financial Forecasting Result");
        System.out.println("Current Revenue: " + currentRevenue);
        System.out.printf("Average Growth Rate: %.2f%%\n", growthRate * 100);
        System.out.printf("Future Value using Recursion after %d years: %.2f\n", yearsToPredict, recursivePrediction);
        System.out.printf("Future Value using Optimized Formula after %d years: %.2f\n", yearsToPredict, optimizedPrediction);

        System.out.println("\nTime Complexity Analysis:");
        System.out.println("Recursive Method: O(n), where n is the number of years predicted.");
        System.out.println("Optimized Formula Method: O(1), because it directly calculates the value using Math.pow().");
        System.out.println("The recursive method is simple to understand, but the optimized formula is better for large year values.");
    }
}
