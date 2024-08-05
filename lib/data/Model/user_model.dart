

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Formatted%20Data/formatter.dart';
import 'package:get/get.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper function
  String get fullName => '$firstName $lastName';
  // Helper function to formate phone number
  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split('');
    String firstName = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUserName = '$firstName$lastname';
    String userNameWithPrefix = 'cwt_$camelCaseUserName';
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() != null) {
      final data = json.data();
      return UserModel(
        id:  json.id,
        firstName: data?['FirstName'] ?? '',
        lastName: data?['LastName'] ?? '',
        username: data?['Username'] ?? '',
        email: data?['Email'] ?? '',
        phoneNumber: data?['PhoneNumber'] ?? '',
        profilePicture: data?['ProfilePicture'] ?? '',
      );
    }
    return UserModel.empty();
  }
}
