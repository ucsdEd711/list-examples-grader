import static org.junit.Assert.*;
import java.util.ArrayList;
import java.util.List;
import org.junit.*;

class Checker implements StringChecker {
  public boolean checkString(String tes) {
      return tes.contains("ed");
  }
}

public class TestListExamples {
  // Write your grading tests here!
  @Test
  public void testFilter() {
    List<String> Input1 = new ArrayList<>();
    StringChecker SC = new Checker();
    String[] OInput1 = {"edwin", "created", "Sandy", "Ming", "Davy"};
    for(String tes: OInput1) { Input1.add(tes); }
    List<String> Expect1 = new ArrayList<>();
    String[] Expect2 = {"edwin", "created"};
    for(String tes: Expect2) { Expect1.add(tes); }
    assertEquals(Expect1, ListExamples.filter(Input1, SC));
}

@Test
public void testMerge() {
  List<String> list1 = List.of("aa", "ca", "da");
  List<String> list2 = List.of("ba", "ea", "fa");
  List<String> Expected = List.of("aa", "ba", "ca", "da", "ea", "fa");

    assertEquals(Expected, ListExamples.merge(list1, list2));
  }
}