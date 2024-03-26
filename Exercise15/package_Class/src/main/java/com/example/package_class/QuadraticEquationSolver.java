package com.example.package_class;

public class QuadraticEquationSolver {
    private double a, b, c;

    public QuadraticEquationSolver(double a, double b, double c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public void solve() {
        double delta = b * b - 4 * a * c;
        if (delta > 0) {
            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
            double x2 = (-b - Math.sqrt(delta)) / (2 * a);
            System.out.println("Phương trình có 2 nghiệm: x1 = " + x1 + ", x2 = " + x2);
        } else if (delta == 0) {
            double x = -b / (2 * a);
            System.out.println("Phương trình có nghiệm kép: x = " + x);
        } else {
            System.out.println("Phương trình vô nghiệm");
        }
    }

    public static void main(String[] args) {
        // Ví dụ: phương trình x^2 - 3x + 2 = 0
        QuadraticEquationSolver solver = new QuadraticEquationSolver(1, -3, 2);
        solver.solve();
    }

}
