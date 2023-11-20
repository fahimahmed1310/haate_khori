import 'package:flutter/material.dart';
import 'package:haate_khori_app/constants/app_constants.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 0.8, // between 0 and 1
        heightFactor: 1.0,
        child: Container(
          color: Colors.black12,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.1,
                    foregroundImage: const AssetImage(
                      "assets/images/user_image.jpg",
                    ),
                  ),
                  const Text(
                    'Md. Fahim Ahmed',
                    style: TextStyle(
                        fontFamily: "Acme",
                        fontSize: 20,
                        color: Colors.white),
                  ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ListTile(
                leading: const Icon(
                  Icons.content_copy,
                  color: Colors.white,
                ),
                title: const Text('My Courses'),
                titleTextStyle: const TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: "Acme"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
                title: const Text('Bookmarks'),
                titleTextStyle: const TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: "Acme"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
