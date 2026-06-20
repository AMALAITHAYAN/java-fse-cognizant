public class FinancialForecast {

    public double calculateAverageGrowthRate(double[] pastValues) {
        double totalGrowth = 0;

        for (int i = 1; i < pastValues.length; i++) {
            double growth = (pastValues[i] - pastValues[i - 1]) / pastValues[i - 1];
            totalGrowth += growth;
        }

        return totalGrowth / (pastValues.length - 1);
    }

    public double predictFutureValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return predictFutureValue(currentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public double predictFutureValueOptimized(double currentValue, double growthRate, int years) {
        return currentValue * Math.pow(1 + growthRate, years);
    }
}
