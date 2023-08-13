import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelCustomer {
  String? userRole;
  String? profilePic;
  String? fullName;
  String? uname;
  String? password;
  String? email;
  String? uid;
  String? joinedDate;
  String? phoneNumber;

  UserModelCustomer({
    required this.userRole,
    required this.profilePic,
    required this.fullName,
    required this.uname,
    required this.password,
    required this.email,
    required this.uid,
    required this.joinedDate,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userRole': userRole,
      'profilePic': profilePic,
      'joinedDate': joinedDate,
      'fullName': fullName,
      'uname': uname,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }

  static UserModelCustomer fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return UserModelCustomer(
      uid: data['uid'],
      userRole: data['userRole'],
      profilePic: data['profilePic'],
      joinedDate: data['joinedDate'],
      fullName: data['fullName'],
      uname: data['uname'],
      email: data['email'],
      password: data['password'],
      phoneNumber: data['phoneNumber'],
    );
  }
}
