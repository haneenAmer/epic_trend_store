import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/language/local_language.dart';

class LanguagePopUp extends ConsumerWidget {
  const LanguagePopUp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    return PopupMenuButton<Language>(
      onSelected: (value) {
        ref.read(languageProvider.notifier).update((_) => value);
        //with api
        //ref.read(languageProvider).setLanguage(value);
      },
      itemBuilder: (context) => [
        for (var value in Language.values)
          PopupMenuItem(
              value: value,
              child: Row(
                children: [
                  Text(value.flag),
                  const SizedBox(width: 8,),
                   Text(value.name),
                ],
              ))
      ],
      child: Text('${language.flag} ${language.name}',style: smallTextStyle(Colors.black),),
    );
  }
}
