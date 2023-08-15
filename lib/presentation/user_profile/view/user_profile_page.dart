import 'package:flutter/material.dart';
import 'package:paseamos/presentation/user_profile/view/widgets/custom_card_profile.dart';
import 'package:paseamos/presentation/user_profile/view/widgets/photo_profile.dart';
import 'package:paseamos/presentation/user_profile/view/widgets/user_data_profile.dart';
import '../../../config/constants.dart';

class UserProfilePage extends StatefulWidget {
  static const name = 'user-profile';

  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              CustomCardProfile(
                size: size,
                colors: colors,
                userName: userProfileName,
              ),
              PhotoProfile(
                size: size,
                photo: photoProfilePath,
              ),
              const UserDataProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
