import java.util.Arrays;
import java.util.Comparator;

public class EcommerceSearchTest {

    public static void main(String[] args) {
        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Mobile", "Electronics"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Backpack", "Bags")
        };

        SearchService searchService = new SearchService();

        Product linearResult = searchService.linearSearch(products, "Mobile");
        System.out.println("Linear Search Result:");
        printProduct(linearResult);

        Product[] sortedProducts = Arrays.copyOf(products, products.length);
        Arrays.sort(sortedProducts, Comparator.comparing(Product::getProductName, String.CASE_INSENSITIVE_ORDER));

        Product binaryResult = searchService.binarySearch(sortedProducts, "Mobile");
        System.out.println("\nBinary Search Result:");
        printProduct(binaryResult);

        System.out.println("\nTime Complexity Analysis:");
        System.out.println("Linear Search  - Best Case: O(1), Average Case: O(n), Worst Case: O(n)");
        System.out.println("Binary Search  - Best Case: O(1), Average Case: O(log n), Worst Case: O(log n)");
        System.out.println("Binary search is faster for large product lists, but the products must be sorted first.");
    }

    private static void printProduct(Product product) {
        if (product != null) {
            System.out.println(product);
        } else {
            System.out.println("Product not found.");
        }
    }
}
