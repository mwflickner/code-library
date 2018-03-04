import java.util.*;

public class SortRunner {
  public static void main(String[] args)
  {
    int[] unsortedList = new int[]{4, 6, 2, 3, 8, 5};
    int[] sortedList = BubbleSort.getSortedList(unsortedList);
    System.out.println(Arrays.toString(sortedList));
  }
}
