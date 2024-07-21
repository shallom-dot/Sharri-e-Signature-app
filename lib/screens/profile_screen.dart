import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharries_signature/utilities/profilebuttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Profile', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38, fontSize: 25),),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/poster.png'),
                        ),
                        Positioned(
                          right: -12,
                          bottom: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100,
                            ),
                            child: IconButton(
                              padding: EdgeInsetsDirectional.zero,
                              icon: const Icon(
                                Icons.photo_camera,
                                size: 20,
                              ),
                              onPressed: () {
                                // Action to perform when the camera button is pressed
                                // Add your logic here
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileButton(
                    mytext: 'My Account',
                    myicon: CupertinoIcons.chevron_right,
                    press: () {},
                    myiconn: CupertinoIcons.person,
                  ),
                  ProfileButton(
                    mytext: 'Notifications',
                    myicon: CupertinoIcons.chevron_right,
                    press: () {},
                    myiconn: CupertinoIcons.bell,
                  ),
                  ProfileButton(
                    mytext: 'Settings',
                    myicon: CupertinoIcons.chevron_right,
                    press: () {},
                    myiconn: CupertinoIcons.gear,
                  ),
                  ProfileButton(
                    mytext: 'Help Center',
                    myicon: CupertinoIcons.chevron_right,
                    press: () {},
                    myiconn: CupertinoIcons.question_circle,
                  ),
                  ProfileButton(
                    mytext: 'Logout',
                    myicon: CupertinoIcons.chevron_right,
                    press: () {},
                    myiconn: Icons.logout,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
