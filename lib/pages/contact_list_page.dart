import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualcard/pages/scan_page.dart';
import 'package:virtualcard/providers/contact_provider.dart';
import '../customWidgets/contact_item.dart';
import 'new_contact_page.dart';

class ContactListPage extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Consumer<ContactProvider>(
          builder: (context,provider,_) => ListView.builder(
            itemCount: provider.contactList.length,
            itemBuilder: (context, index) {
              final contact = provider.contactList[index];
              return ContactItem(contact);
            },
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, ScanPage.routeName),
      ),
    );
  }
}
