import 'dart:collection';

/**
 * Task: Pentru o lista cu numere unice, sa se afiseze toate subseturile posibile. Solutia nu trebuie sa contina duplicate.
 */

class PrintSubsetsAlgorithm {
  List<int> numberList;
  Set<int> selectedSet;

  PrintSubsetsAlgorithm(List<int> numberList)
    : numberList = numberList,
      selectedSet = HashSet() {
    print("(the empty set)");
    this._printBacktracked(0);
    print("");
  }

  void _printBacktracked(int startingIndex) {
    for (int index = startingIndex; index < numberList.length; ++index) {
      int number = this.numberList[index];
      if (this.selectedSet.contains(number)) {
        continue;
      }

      this.selectedSet.add(number);
      print(this.selectedSet);
      this._printBacktracked(index + 1);
      this.selectedSet.remove(number);
    }
  }
}

void main() {
  PrintSubsetsAlgorithm([1, 2, 3, 4]);
  PrintSubsetsAlgorithm([1]);
  PrintSubsetsAlgorithm([]);
}
