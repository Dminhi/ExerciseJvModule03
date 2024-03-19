package com.example.calculator;

public class Calculator {
    public static void calculate(double firstOperand, double secondOperand) throws ArithmeticException {
        if (secondOperand == 0) {
            throw new ArithmeticException("Cannot divide by zero");
        }
        // Thực hiện phép tính ở đây nếu cần
    }
}
