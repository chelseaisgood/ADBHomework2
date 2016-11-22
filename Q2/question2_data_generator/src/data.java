/**
 * User: Minda Fang
 * Date: 11/21/16
 * Time: 09;30 PM
 *
 */


import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class data {

    private static final int TOTAL_STOCK_NUMBER = 1000000;
    private static final int QUANTITY_LOWER_BOUND = 100;
    private static final int QUANTITY_UPPER_BOUND = 10000;
    private static final int PRICE_LOWER_BOUND = 200;
    private static final int PRICE_UPPER_BOUND = 205;

    public static void main(String[] args) {
        int[] stockData = gen(0.3, 70002);

        try {
            createTXT(stockData);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void createTXT(int[] distributedArray) throws IOException {

        StringBuffer sb = new StringBuffer();
        int size = distributedArray.length;
        Random random = new Random();


        for (int i = 0; i < TOTAL_STOCK_NUMBER; i++) {
            String tempString = new String();

            int tempIndex = random.nextInt(size); // select a random index number from 0 to 99999

            int price = random.nextInt(PRICE_UPPER_BOUND - PRICE_LOWER_BOUND) + PRICE_LOWER_BOUND;

            int quantity = random.nextInt(QUANTITY_UPPER_BOUND - QUANTITY_LOWER_BOUND + 1);
            quantity += QUANTITY_LOWER_BOUND;

            tempString =  tempString + distributedArray[tempIndex] + "," + (i + 1) + "," + quantity + "," + price + "\n";
            sb.append(tempString);
        }

        String finalStr = sb.toString();
        PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter("data.txt")));
        pw.print(finalStr);
        pw.flush();
        pw.close();
    }

    private static int[] gen(double fraction, int x) {
        if (fraction <= 0 || fraction >= 1) {
            throw new IndexOutOfBoundsException();
        }
        int totalSizeOfArray = 0;
        int initialSize = x;

        // calculate the size of return int[]
        while (initialSize >= 1) {
            totalSizeOfArray += initialSize;
            initialSize = initialSize * 3 / 10;
        }
        int[] result = new int[totalSizeOfArray];

        for (int i = 0; i < x; i++) {
            result[i] = i + 1;
        }

        //permutation
        Random random = new Random();
        for (int i = 0; i < x; i++) {
            int index = random.nextInt(x);
            int temp = result[index];
            result[index] = result[i];
            result[i] = temp;
        }

        initialSize = x;
        int currentIndex = initialSize - 1;
        while (initialSize >= 1 && currentIndex < totalSizeOfArray - 1) {
            initialSize = initialSize * 3 / 10;
            for (int i = 0; i < initialSize; i++) {
                ++currentIndex;
                result[currentIndex] = result[i];
            }
        }

        return result;
    }
}