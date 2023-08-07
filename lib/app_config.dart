// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:template_flutter_project/locator.dart';

class AppConfig {
  static ThemeData themeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.aBeeZee(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  static Iterable<LocalizationsDelegate<dynamic>> localization() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  static Iterable<Locale> supportedLocales() {
    return const [
      Locale('en'),
      Locale('ar'),
    ];
  }

  static List<SingleChildWidget> providers = [
    BlocProvider(create: (_) => HomeCubit(locator<HomeRepo>())),
  ];
}
