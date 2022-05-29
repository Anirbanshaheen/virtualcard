import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:virtualcard/models/contact_model.dart';
import 'package:virtualcard/providers/contact_provider.dart';

class ContactDetailsPage extends StatelessWidget {
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    final id = argList[0];
    final name = argList[1];
    return Scaffold(
      appBar: AppBar(title: Text(name),),
        body: Center(
          child: Consumer<ContactProvider>(
            builder: (context,provider,_) => FutureBuilder<ContactModel>(
              future: provider.getContactById(id),
              builder: (context,snapshot) {
                if(snapshot.hasData){
                  final contact = snapshot.data;
                  return buildDetailsListBody(contact,context);
                }
                if(snapshot.hasError){
                  return const Text('Failed to fetch data');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      );
  }

  Widget buildDetailsListBody(ContactModel? contact, BuildContext context) {
    return ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    Image.file(File(contact!.image),width: double.infinity, height: 250, fit: BoxFit.cover,),
                    ListTile(
                      title: Text(contact.mobile),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            _callContact(contact.mobile,context);
                          }, icon: Icon(Icons.call)),
                          IconButton(onPressed: () {
                            _smsContact(contact.mobile,context);
                          }, icon: Icon(Icons.sms)),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(contact.email),
                      trailing: IconButton(onPressed: () {
                        _mailContact(contact.email,context);
                      }, icon: Icon(Icons.email)),
                    ),
                    ListTile(
                      title: Text(contact.address),
                      trailing: IconButton(onPressed: () {
                        _mapContact(contact.address,context);
                      }, icon: Icon(Icons.map)),
                    ),
                    ListTile(
                      title: Text(contact.website),
                      trailing: IconButton(onPressed: () {
                        _webContact(contact.website,context);
                      }, icon: Icon(Icons.web)),
                    ),
                  ],
                );
  }

  void _callContact(String mobile, BuildContext context) async {
    final uri = 'tel:$mobile';
    if(await canLaunchUrlString(uri)){
      await launchUrlString(uri);
    }else{
      ScaffoldMessenger
          .of(context)
          .showSnackBar(SnackBar(
          content: Text('Could not launch application')));
      throw 'Could not launch application';
    }
  }

  void _smsContact(String mobile, BuildContext context) async {
    final uri = 'sms:$mobile';
    if(await canLaunchUrlString(uri)){
      await launchUrlString(uri);
    }else{
      ScaffoldMessenger
          .of(context)
          .showSnackBar(SnackBar(
          content: Text('Could not launch application')));
      throw 'Could not launch application';
    }
  }

  void _mailContact(String email, BuildContext context) async {
    const subject = 'Test';
    const body = 'This is test body';

    final uri = 'mailto:$email?subject=$subject&body=$body';
    if(await canLaunchUrlString(uri)){
    await launchUrlString(uri);
    }else{
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(
    content: Text('Could not launch application')));
    throw 'Could not launch application';
    }
  }

  void _mapContact(String address, BuildContext context) async {
    if(Platform.isAndroid){
      final uriAndroid = 'geo:0,0?q=$address';
      if(await canLaunchUrlString(uriAndroid)){
        await launchUrlString(uriAndroid);
      }else{
        ScaffoldMessenger
            .of(context)
            .showSnackBar(SnackBar(
            content: Text('Could not launch application')));
        throw 'Could not launch application';
      }
    }else if(Platform.isIOS){
      final uriIos = 'http://maps.apple.com/?q=$address';
      if(await canLaunchUrlString(uriIos)){
        await launchUrlString(uriIos);
      }else{
        ScaffoldMessenger
            .of(context)
            .showSnackBar(SnackBar(
            content: Text('Could not launch application')));
        throw 'Could not launch application';
      }
    }
  }

  void _webContact(String website, BuildContext context) async {
    final uri = 'https://$website';
    if(await canLaunchUrlString(uri)){
      await launchUrlString(uri);
    }else{
      ScaffoldMessenger
          .of(context)
          .showSnackBar(SnackBar(
          content: Text('Could not launch application')));
      throw 'Could not launch application';
    }
  }
}
