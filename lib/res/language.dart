enum LanguageType { English, Russian }

const String ENGLISH = 'en';
const String RUSSIAN = 'rus';

extension LanguageTypeExtension on LanguageType {
  String getLanguageValue() {
    switch (this) {
      case LanguageType.English:
        return ENGLISH;
      case LanguageType.Russian:
        return RUSSIAN;
    }
  }
}
