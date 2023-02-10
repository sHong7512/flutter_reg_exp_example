class RegExpVowel {
  static String notMatchString = 'Not Match';
  static String neverCheckString = 'Never Checked';

  final _emptyTextField = 'Empty TextField';

  Map<String, String> patterns = {
    'Num' : r'[0-9]',
    'Not Num' : r'[^0-9]',
    'Lower Alphabet' : r'[a-z]',
    'Upper Alphabet' : r'[A-Z]',
    'Num + Alpha' : r'[a-zA-Z0-9]',
    'Num + Alpha + hangul' : r'[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ]',
    'Not Num + Alpha + hangul' : r'[^a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ]',
    'sHong - one' : r'[sHong]',
    'sHong - all' : r'(sHong)',
    'metaCha - w' : r'[\w]',
    'metaCha - W' : r'[\W]',
    'metaCha - d' : r'[\d]',
    'metaCha - D' : r'[\D]',
    'metaCha - s' : r'[\s]',
    'metaCha - S' : r'[\S]',
  };

  String check(String str, String pattern) {
    if (str.isEmpty) {
      return _emptyTextField;
    }

    final regex = RegExp(pattern); // == RegExp(r'\d.*');
    if (regex.hasMatch(str)) {
      String buf = '';
      Iterable<RegExpMatch> matches = regex.allMatches(str);
      for (final m in matches) {
        buf += m[0].toString();
      }
      return buf;
    }
    return notMatchString;
  }

}
