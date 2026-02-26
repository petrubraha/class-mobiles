/**
 * Task: Write a dart function that converts a string of characters written in lowercase_with_underscore into UppeCamelCase.
 */

String toUpperCamelCase(String input) {
  return input
      .split('_')
      .where((word) => word.isNotEmpty)
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join();
}

void main() {
  print(toUpperCamelCase('hello_world')); // HelloWorld
  print(toUpperCamelCase('dart_is_fun')); // DartIsFun
  print(toUpperCamelCase('example')); // Example
  print(toUpperCamelCase('multiple__underscores')); // MultipleUnderscores
}
