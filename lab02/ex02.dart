/**
 * Task: Pentru o lista de string-uri strs sa se grupeze anagramele. O anagrama este un cuvant format din literele altui cuvant, dar in alta ordine.
 * 
 * O(n^2 * m), old solution, n = size of strList, m = size of longest str
 * for each str
 *   if length was NOT saw before
 *     add to length Set
 *   else
 *     isFound = false
 *     for each anagramSet
 *       isAnagram = true
 *       for each char in str
 *         if NOT anagramSet.contains(char)
 *           isAnagram = false
 *           break
 *       if isAnagram
 *         isFound = true
 *         break
 *     if isFound
 *         group
 *     else
 *         create new group
 * 
 * O (n * m), frequency vector
 * 
 * A word is a sequence of characters from a to z inclusive.
 */

List<List<String>> groupAnagrams(List<String> strs) {
  Map<String, List<String>> map = {};

  for (String word in strs) {
    List<int> freq = List.filled(26, 0);

    for (int code in word.codeUnits) {
      freq[code - 'a'.codeUnitAt(0)]++;
    }

    String key = freq.join('#');

    map.putIfAbsent(key, () => []);
    map[key]!.add(word);
  }

  return map.values.toList();
}

void main() {
  List<String> strs = ["eat", "tea", "tan", "ate", "nat", "bat"];
  print(groupAnagrams(strs));
}
