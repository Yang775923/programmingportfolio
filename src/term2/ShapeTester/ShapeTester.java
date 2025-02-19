import java.util.Scanner;

public class ShapeTester {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        int choice = 0;
        
        while (choice != 5) {
            System.out.println("Select a shape to calculate:");
            System.out.println("1. Sphere");
            System.out.println("2. Pyramid");
            System.out.println("3. Box");
            System.out.println("4. Cylinder");
            System.out.println("5. Exit");
            System.out.println("");
            
            if (scanner.hasNextInt()) {
                choice = scanner.nextInt();
                if (choice == 1 || choice == 2 || choice == 3 || choice == 4 || choice == 5) {
                    if (choice == 1) {
                        double r = getValidDoubleInput(scanner, "Enter the radius of the sphere: ");
                        Sphere sphere = new Sphere(r);
                        System.out.println("");
                        System.out.println("Volume of the Sphere: " + sphere.calcVol());
                        System.out.println("Surface Area of the Sphere: " + sphere.calcSA());
                        System.out.println("");

                    } else if (choice == 2) {
                        double l = getValidDoubleInput(scanner, "Enter the length of the pyramid base: ");
                        double w = getValidDoubleInput(scanner, "Enter the width of the pyramid base: ");
                        double h = getValidDoubleInput(scanner, "Enter the height of the pyramid: ");
                        Pyramid pyramid = new Pyramid(l, w, h);
                        System.out.println("");
                        System.out.println("Volume of the Pyramid: " + pyramid.calcVol());
                        System.out.println("Surface Area of the Pyramid: " + pyramid.calcSA());
                        System.out.println("");

                    } else if (choice == 3) {
                        double l = getValidDoubleInput(scanner, "Enter the length of the box: ");
                        double w = getValidDoubleInput(scanner, "Enter the width of the box: ");
                        double h = getValidDoubleInput(scanner, "Enter the height of the box: ");
                        Box box = new Box(l, w, h);
                        System.out.println("");
                        System.out.println("Volume of the Box: " + box.calcVol());
                        System.out.println("Surface Area of the Box: " + box.calcSA());
                        System.out.println("");
                    
                    } else if (choice == 4) {
                        double r = getValidDoubleInput(scanner, "Enter the radius of the cylinder: ");
                        double h = getValidDoubleInput(scanner, "Enter the height of the cylinder: ");
                        Cylinder cylinder = new Cylinder(r, h);
                        System.out.println("");
                        System.out.println("Volume of the Cylinder: " + cylinder.calcVol());
                        System.out.println("Surface Area of the Cylinder: " + cylinder.calcSA());
                        System.out.println("");
                    
                    } else if (choice == 5) {
                        System.out.println("byebye...");
                    }
                } else {
                    System.out.println("Boo! Tomato Tomato! You're smarter than this. Just choose 1, 2, 3, 4, or 5 it ain't that hard.");
                }
            } else {
                System.out.println("Invalid input... please just enter a number (1, 2, 3, 4, 5).");
                System.out.println("");
                scanner.next();
            }
        }

        scanner.close();
    }

    private static double getValidDoubleInput(Scanner scanner, String prompt) {
        double value = 0;
        boolean validInput = false;
        
        while (!validInput) {
            System.out.print(prompt);
            if (scanner.hasNextDouble()) {
                value = scanner.nextDouble();
                validInput = true; 
            } else {
                System.out.println("We talked about this, please enter a valid number.");
                scanner.next();
            }
        }
        return value;
    }
}