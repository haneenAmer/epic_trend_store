// mixin AppLocale {
//   static const String title = 'title';
//  static const Map<String, dynamic> AR = {title: 'الترجمة'};
//   static const Map<String, dynamic> EN = {title: 'Localization'};
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Language {
  arabic (flag:'🇮🇶',name:'العربية',code:'ar'),
  english (flag:'🇬🇧',name:'English',code:'en');
  const Language ({required this.name,required this.code,required this.flag});
  final String flag;
  final String name;
  final String code;
  
}

final languageProvider = StateProvider<Language>((ref) => Language.arabic);