
const String tableContact = "tbl_contact";
const String tblContactColId = "id";
const String tblContactColName = "name";
const String tblContactColMobile = "mobile";
const String tblContactColEmail = "email";
const String tblContactColAddress = "address";
const String tblContactColCompany = "company";
const String tblContactColDesignation = "designation";
const String tblContactColWebsite = "website";
const String tblContactColFavourite = "favourite";
const String tblContactColImage = "image";
class ContactModel {
  int id;
  String name;
  String mobile;
  String email;
  String address;
  String company;
  String designation;
  String website;
  String image;
  bool favourite;

  ContactModel(
      {required this.name,
      required this.mobile,
        this.id = 0,
      this.email = "",
      this.address = "",
      this.company = "",
      this.designation = "",
      this.website = "",
      this.image = "https://static.vecteezy.com/system/resources/previews/002/206/096/large_2x/credit-card-icon-free-vector.jpg",
      this.favourite = false
      });

  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      tblContactColName : name,
      tblContactColMobile : mobile,
      tblContactColEmail : email,
      tblContactColAddress : address,
      tblContactColCompany : company,
      tblContactColDesignation : designation,
      tblContactColWebsite : website,
      tblContactColImage : image,
      tblContactColFavourite : favourite ? 1 : 0,
    };
    if(id > 0){
      map[tblContactColId] = id;
    }
    return map;
  }

  factory ContactModel.fromMap(Map<String,dynamic> map) => ContactModel(
    id: map[tblContactColId],
    name: map[tblContactColName],
    mobile: map[tblContactColMobile],
    email: map[tblContactColEmail],
    address: map[tblContactColAddress],
    company: map[tblContactColCompany],
    designation: map[tblContactColDesignation],
    website: map[tblContactColWebsite],
    image: map[tblContactColImage],
    favourite: map[tblContactColFavourite] == 1 ? true : false,
  );

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, mobile: $mobile, email: $email, address: $address, company: $company, designation: $designation, website: $website, image: $image}';
  }
}
