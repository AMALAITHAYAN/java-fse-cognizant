package com.cognizant.junit;

public class Calculator {

    public int add(int left, int right) {
        return left + right;
    }

    public boolean isPositive(int value) {
        return value > 0;
    }

    public int divide(int left, int right) {
        if (right == 0) {
            throw new IllegalArgumentException("Divisor cannot be zero");
        }
        return left / right;
    }

    public int[] firstThreeNumbers() {
        return new int[] {1, 2, 3};
    }
}
