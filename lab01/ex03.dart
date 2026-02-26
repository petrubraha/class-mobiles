/**
 * Task: Write a Dart function that extracts all numbers from a text. Numbers can be integers or doubles. Print the count of the numbers, average and maximum of them.
 */

String SIGNS_STR = "-+";
String PERIOD_STR = ".";
String DIGITS_STR = "0123456789";

bool isValidChar(String char) {
  if (SIGNS_STR.contains(char) ||
      PERIOD_STR.contains(char) ||
      DIGITS_STR.contains(char)) {
    return true;
  }

  return false;
}

bool isValidDouble(String number) {
  try {
    double.parse(number);
    return true;
  } on FormatException {
    return false;
  }
}

/**
 * Returns the list of numbers, their maximum and their sum.
 */
(List<double>, double, double) extractNumbers(String phrase) {
  List<double> numbers = <double>[];
  double maximum = double.negativeInfinity, sum = 0;

  // Added one more iteration that is responsible solely for the last word of the phrase.
  String prevDouble = "";
  for (int i = 0; i <= phrase.length; ++i) {
    if (i == phrase.length || !isValidChar(phrase.substring(i, i + 1))) {
      if (isValidDouble(prevDouble)) {
        double parsedDouble = double.parse(prevDouble);
        prevDouble = "";

        numbers.add(parsedDouble);
        if (parsedDouble > maximum) {
          maximum = parsedDouble;
        }
        sum += parsedDouble;
      }

      continue;
    }

    // Valid char section.
    String character = phrase.substring(i, i + 1);
    if (SIGNS_STR.contains(character)) {
      if (prevDouble.isNotEmpty) {
        throw FormatException(
          "Number signs must be placed only at the beginning of a number",
        );
      }
      prevDouble = character;
    }

    if (PERIOD_STR.contains(character)) {
      if (prevDouble.contains(PERIOD_STR)) {
        throw FormatException("A number can not have more periods");
      }
      prevDouble += PERIOD_STR;
    }

    if (DIGITS_STR.contains(character)) {
      prevDouble += character;
    }
  }

  return (numbers, maximum, sum);
}

void printNumbersStats(List<double> numbers, double maximum, double sum) {
  print(numbers.length);
  print(maximum);
  print(sum / numbers.length);
}

void main() {
  var (numbers, maximum, sum) = extractNumbers("11111 -123 1.4 0.5 +.1 0.");
  print(numbers);
  printNumbersStats(numbers, maximum, sum);
}
