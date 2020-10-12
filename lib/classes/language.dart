class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> LanguageList() {
    return <Language>[
      Language(1, 'English', 'en'),
      Language(2, 'French', 'fr'),
      Language(3, 'Chinese', 'zh'),
      Language(4, 'Vietnamese', 'vi'),
      Language(5, 'Japanese', 'ja'),
    ];
  }
}
