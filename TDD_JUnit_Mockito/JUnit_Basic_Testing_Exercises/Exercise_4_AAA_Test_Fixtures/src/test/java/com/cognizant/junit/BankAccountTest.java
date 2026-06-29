package com.cognizant.junit;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BankAccountTest {

    private BankAccount account;

    @BeforeEach
    void setUp() {
        account = new BankAccount(1000.00);
    }

    @AfterEach
    void tearDown() {
        account = null;
    }

    @Test
    void depositShouldIncreaseBalance() {
        // Arrange
        double amountToDeposit = 500.00;

        // Act
        account.deposit(amountToDeposit);

        // Assert
        assertEquals(1500.00, account.getBalance());
    }

    @Test
    void withdrawShouldReduceBalance() {
        // Arrange
        double amountToWithdraw = 300.00;

        // Act
        account.withdraw(amountToWithdraw);

        // Assert
        assertEquals(700.00, account.getBalance());
    }

    @Test
    void withdrawShouldFailWhenBalanceIsLow() {
        // Arrange
        double largeAmount = 1500.00;

        // Act and Assert
        IllegalStateException error = assertThrows(
                IllegalStateException.class,
                () -> account.withdraw(largeAmount)
        );
        assertEquals("Insufficient balance", error.getMessage());
    }
}
