import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/contact_model.dart';

class ContactProvider with ChangeNotifier{
  List<ContactModel> _contactList = [];
  List<ContactModel> get contactList => _contactList;

  Future<int> insertContact(ContactModel contactModel) => DBHelper.insertContact(contactModel);

  void getAllContacts() async {
    _contactList = await DBHelper.getAllContacts();
    notifyListeners();
  }

  Future<ContactModel> getContactById(int id) => DBHelper.getContactById(id);

  void updateList(ContactModel model){
    _contactList.add(model);
    notifyListeners();
  }

  void removeItemFromList(ContactModel model){
    _contactList.remove(model);
    notifyListeners();
  }

  Future<int> deleteContact(int id){
    return DBHelper.deleteContactById(id);
  }

  Future<int> updateContactFavouriteById(int id, int value){
    return DBHelper.updateContactFavouriteById(id, value);
  }
}