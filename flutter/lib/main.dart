import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'pages/home.dart';

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