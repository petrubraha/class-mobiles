/**
 * Task: Pentru un string s sa se afiseze cea mai mare (ascii code) litera care se gaseste si lower case si upper case in string. Daca nu se gaseste nicio litera care se respecte constrangerea, se va afisa -1.
 * 
 * Return -1 if no letters can be found / empty.
 * Return the exact form.
 */

const String NO_LETTER = "-1";

/**
 * Biggest lexicograph between 'B' and 'a' is considered to be 'B'.
 */
String getBiggestLexicograph(String str) {
  String maximumLetterLower = NO_LETTER;
  String maximumLetterHigher = NO_LETTER;
  for (int i = 0; i < str.length; ++i) {
    String letter = str[i];

    if (letter.compareTo('a') >= 0 && letter.compareTo('z') <= 0) {
      if (letter.compareTo(maximumLetterLower) > 0) {
        maximumLetterLower = letter;
      }
    }

    if (letter.compareTo('A') >= 0 && letter.compareTo('Z') <= 0) {
      if (letter.compareTo(maximumLetterHigher) > 0) {
        maximumLetterHigher = letter;
      }
    }
  }

  if (maximumLetterHigher.compareTo(NO_LETTER) == 0) {
    if (maximumLetterLower.compareTo(NO_LETTER) == 0) {
      return NO_LETTER;
    }
    return maximumLetterLower;
  }
  if (maximumLetterLower.compareTo(NO_LETTER) == 0) {
    return maximumLetterHigher;
  }

  String copyOfHigher = maximumLetterHigher;
  if (copyOfHigher.toLowerCase().compareTo(maximumLetterLower) >= 0) {
    return maximumLetterHigher;
  }
  return maximumLetterLower;
}

void printBiggestLexicograph(String str) {
  print(getBiggestLexicograph(str));
}

void main() {
  printBiggestLexicograph("aBcDeFgHiJkLmNozPqRsTuVwXyZ");
}
