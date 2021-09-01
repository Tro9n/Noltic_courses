/**
 * Created by User on 04.08.2021.
 */

public class StringArrayTest {
    public static List<String> generatorStringArray(Integer n) {
        List<String> myList = new List<String>();
        for (Integer i = 0; i < n; i++) {
            myList.add('Test ' + i);
        }
        return myList;
    }
}