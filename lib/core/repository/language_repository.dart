// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shahadmartapplication/language/local_language.dart';

// class LanguageRepository {
// LanguageRepository({required this.ref});
// final Ref ref;
// static const String
// languageCodeKey = "language_code";

// Future<void>setLanguage (Language language) async {
// final pref = await ref.read(sharedPreferecesProvider.future);
// await pref.setString (languageCodeKey,language.code);
// ref.read (languageProvider.notifier).update((_) => language);}




// Future<Language> getLanguage()async {

// final pref =await ref.read(SharedPreferencesProvider.future );
// // passing the languageCodeKey to the variable code
// final code = pref.getString(languageCodeKey);

// for (var value in Language.values) {
// if(value.code == code) return value;}
// // if value.code == to the fetched code the default language will be english
// return Language.english;}
// }



// final sharedPreferecesProvider =
// FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance ());




// final languageRepositoryProvider = Provider((ref) => LanguageRepository(ref: ref));