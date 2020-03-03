import 'package:flutter/material.dart';
import 'game.dart';
import 'generated/l10n.dart';
import 'home.dart';

Future<void> main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
  ));
}