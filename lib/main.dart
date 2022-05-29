import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualcard/providers/contact_provider.dart';
import 'pages/contact_details_page.dart';
import 'pages/contact_list_page.dart';
import 'pages/new_contact_page.dart';
import 'pages/scan_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ContactProvider()..getAllContacts(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName: (context) => ContactListPage(),
        ContactDetailsPage.routeName: (context) => ContactDetailsPage(),
        NewContactPage.routeName: (context) => NewContactPage(),
        ScanPage.routeName: (context) => ScanPage(),
      },
    );
  }
}