import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Enter your age: ");
        int age = input.nextInt();

        if (age >= 18) {
            System.out.println("Age is 18 or older.");
        } else {
            System.out.println("Age is under 18.");
        }

        input.close();
    }
}
