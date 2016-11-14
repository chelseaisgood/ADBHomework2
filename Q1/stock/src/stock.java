/**
 * User: Minda Fang
 * Date: 11/13/16
 * Time: 10;00 PM
 *
 */

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class stock {

    private static final int QUANTITY_LOWER_BOUND = 100;
    private static final int QUANTITY_UPPER_BOUND = 10000;
    private static final int PRICE_LOWER_BOUND = 50;
    private static final int PRICE_UPPER_BOUND = 500;

    public static void main(String[] args) {
        int[] stockData = gen(0.3, 70002);
        //position 0, 70002, 91002, 97302, 99191, 99759, 99929, 999980, 99995, 99999
        /*
        System.out.println(stockData[99999]);
        System.out.println(stockData[99995]);
        System.out.println(stockData[99980]);
        System.out.println(stockData[99929]);
        System.out.println(stockData[99759]);
        System.out.println(stockData[99192]);
        System.out.println(stockData[97302]);
        System.out.println(stockData[91002]);
        System.out.println(stockData[70002]);
        System.out.println(stockData[0]);
        */
        try {
            createJSON(stockData);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void createJSON(int[] distributedArray) throws IOException {

        JsonArray stockSymbolSet = new JsonArray();
        int size = distributedArray.length;
        Random random = new Random();

        int price = random.nextInt(PRICE_UPPER_BOUND - PRICE_LOWER_BOUND + 1);
        price += PRICE_LOWER_BOUND;

        for (int i = 0; i < size; i++) {
            JsonObject stockSymbol = new JsonObject();

            int quantity = random.nextInt(QUANTITY_UPPER_BOUND - QUANTITY_LOWER_BOUND + 1);
            quantity += QUANTITY_LOWER_BOUND;

            int priceChange = random.nextInt(5);
            priceChange++;
            boolean positiveChange = (random.nextInt(2) == 0) ? true : false;
            if (positiveChange) {
                if (price + priceChange > 500) {
                    price -= priceChange;
                } else {
                    price += priceChange;
                }
            } else {
                if (price - priceChange < 50) {
                    price += priceChange;
                } else {
                    price -= priceChange;
                }
            }


            stockSymbol.addProperty("stocksymbol", distributedArray[i]);
            stockSymbol.addProperty("stocktime", i + 1);
            stockSymbol.addProperty("quantity", quantity);
            stockSymbol.addProperty("price", price);
            stockSymbolSet.add(stockSymbol);
        }

        String jsonStr = stockSymbolSet.toString();   // turn json object into json string
        PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter("trade.json")));
        pw.print(jsonStr);
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
