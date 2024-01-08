// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Browse`
  String get brows {
    return Intl.message(
      'Browse',
      name: 'brows',
      desc: '',
      args: [],
    );
  }

  /// `Best Offers`
  String get best_offers {
    return Intl.message(
      'Best Offers',
      name: 'best_offers',
      desc: '',
      args: [],
    );
  }

  /// `Search for Your Products`
  String get search_for_product {
    return Intl.message(
      'Search for Your Products',
      name: 'search_for_product',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Men's Shoes`
  String get men_shoes {
    return Intl.message(
      'Men\'s Shoes',
      name: 'men_shoes',
      desc: '',
      args: [],
    );
  }

  /// `Women's Shoes`
  String get women_shoes {
    return Intl.message(
      'Women\'s Shoes',
      name: 'women_shoes',
      desc: '',
      args: [],
    );
  }

  /// `Browse various types of handbags with the finest materials `
  String get product_section_description {
    return Intl.message(
      'Browse various types of handbags with the finest materials ',
      name: 'product_section_description',
      desc: '',
      args: [],
    );
  }

  /// `Bags`
  String get bags {
    return Intl.message(
      'Bags',
      name: 'bags',
      desc: '',
      args: [],
    );
  }

  /// `shoes`
  String get shoes {
    return Intl.message(
      'shoes',
      name: 'shoes',
      desc: '',
      args: [],
    );
  }

  /// `perfumes`
  String get perfumes {
    return Intl.message(
      'perfumes',
      name: 'perfumes',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'see more' key

  /// `Best Selling Products`
  String get best_sales {
    return Intl.message(
      'Best Selling Products',
      name: 'best_sales',
      desc: '',
      args: [],
    );
  }

  /// `Recently Arrived`
  String get recently_arrived {
    return Intl.message(
      'Recently Arrived',
      name: 'recently_arrived',
      desc: '',
      args: [],
    );
  }

  /// `See Product`
  String get see_product {
    return Intl.message(
      'See Product',
      name: 'see_product',
      desc: '',
      args: [],
    );
  }

  /// `Discover New Offers`
  String get discoverd_new_product {
    return Intl.message(
      'Discover New Offers',
      name: 'discoverd_new_product',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buy_now {
    return Intl.message(
      'Buy Now',
      name: 'buy_now',
      desc: '',
      args: [],
    );
  }

  /// `Shahad Store`
  String get shahad_store {
    return Intl.message(
      'Shahad Store',
      name: 'shahad_store',
      desc: '',
      args: [],
    );
  }

  /// `We have clothes that suit all tastes at the most affordable prices.`
  String get bodyText_footer {
    return Intl.message(
      'We have clothes that suit all tastes at the most affordable prices.',
      name: 'bodyText_footer',
      desc: '',
      args: [],
    );
  }

  /// `Shoes Section`
  String get shoes_section {
    return Intl.message(
      'Shoes Section',
      name: 'shoes_section',
      desc: '',
      args: [],
    );
  }

  /// `كل انواع و اقسام `
  String get categories_sections_body {
    return Intl.message(
      'كل انواع و اقسام ',
      name: 'categories_sections_body',
      desc: '',
      args: [],
    );
  }

  /// `Bags Section`
  String get bags_section {
    return Intl.message(
      'Bags Section',
      name: 'bags_section',
      desc: '',
      args: [],
    );
  }

  /// `Perfumes Section`
  String get perfums_section {
    return Intl.message(
      'Perfumes Section',
      name: 'perfums_section',
      desc: '',
      args: [],
    );
  }

  /// `Press Here`
  String get press_here {
    return Intl.message(
      'Press Here',
      name: 'press_here',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Return to the main page to buy your preferred products.`
  String get cart_boy {
    return Intl.message(
      'Return to the main page to buy your preferred products.',
      name: 'cart_boy',
      desc: '',
      args: [],
    );
  }

  /// `Start Shopping`
  String get start_shopping_button {
    return Intl.message(
      'Start Shopping',
      name: 'start_shopping_button',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Personal Profile`
  String get personal_profile {
    return Intl.message(
      'Personal Profile',
      name: 'personal_profile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get product_name {
    return Intl.message(
      'Product Name',
      name: 'product_name',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example that can be replaced in the same space.`
  String get product_discribtion {
    return Intl.message(
      'This text is an example that can be replaced in the same space.',
      name: 'product_discribtion',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Products Similar to Your Taste`
  String get similar_product {
    return Intl.message(
      'Products Similar to Your Taste',
      name: 'similar_product',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart_button {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart_button',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
