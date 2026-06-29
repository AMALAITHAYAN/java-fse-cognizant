package com.cognizant.junit;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AssertionsTest {

    private final Calculator calculator = new Calculator();

    @Test
    void testBasicAssertions() {
        assertEquals(5, calculator.add(2, 3));
        assertTrue(calculator.isPositive(8));
        assertFalse(calculator.isPositive(-4));
        assertNull(null);
        assertNotNull(new Object());
    }

    @Test
    void testArrayAndExceptionAssertions() {
        assertArrayEquals(new int[] {1, 2, 3}, calculator.firstThreeNumbers());

        IllegalArgumentException error = assertThrows(
                IllegalArgumentException.class,
                () -> calculator.divide(10, 0)
        );

        assertEquals("Divisor cannot be zero", error.getMessage());
    }

    @Test
    void testGroupedAssertions() {
        Customer customer = new Customer("Arun", "arun@example.com");

        assertAll("customer details",
                () -> assertEquals("Arun", customer.getName()),
                () -> assertTrue(customer.getEmail().contains("@")),
                () -> assertNotNull(customer.getEmail())
        );
    }
}
