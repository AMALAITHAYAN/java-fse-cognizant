public class LoggerTest {

    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("Application started");
        logger2.log("User login checked");

        System.out.println("Logger 1 hash code: " + logger1.hashCode());
        System.out.println("Logger 2 hash code: " + logger2.hashCode());

        if (logger1 == logger2) {
            System.out.println("Both logger objects are the same instance.");
            System.out.println("Singleton Pattern implemented successfully.");
        } else {
            System.out.println("Different instances were created.");
        }
    }
}
