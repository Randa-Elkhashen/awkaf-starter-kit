import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/user.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/profile/profile_view.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  User _user = User(
    id: "0",
    email: "test@test.com",
    displayName: "test user",
    phoneNumber: "01234567890"
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: RangeMaintainingScrollPhysics(),
          padding: EdgeInsets.all(
            16 * AppStyle.scaleFactor
          ),
          children: [
            ProfileView(user: _user),
          ],
        ),
      ),
    );
  }
}
