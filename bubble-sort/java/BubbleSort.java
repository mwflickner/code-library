import java.util.*;

public class BubbleSort {

  public static int[] getSortedList(int[] listToSort)
  {
    if (listToSort.length < 2)
    {
      return listToSort;
    }
    for(int i = 0; i<listToSort.length; i++)
    {
      boolean swapOccured = false;
      for(int j = 1; j<listToSort.length - i; j++)
      {
        if(listToSort[j] < listToSort[j-1])
        {
          int temp = listToSort[j];
          listToSort[j] = listToSort[j-1];
          listToSort[j-1] = temp;
          swapOccured = true;
        }
      }
      if(!swapOccured)
      {
        break;
      }
    }
    return listToSort;
  }
}
