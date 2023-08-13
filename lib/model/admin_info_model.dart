import 'package:cloud_firestore/cloud_firestore.dart';

class AdminInfoModel {
  String? uid;
  String? name;
  String? profilePicUrl;

  AdminInfoModel(
      {required this.uid, required this.name, required this.profilePicUrl});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePicUrl': profilePicUrl,
    };
  }

  static AdminInfoModel fromSnap(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AdminInfoModel(
        uid: data['uid'],
        name: data['name'],
        profilePicUrl: data['profilePicUrl']);
  }
}
