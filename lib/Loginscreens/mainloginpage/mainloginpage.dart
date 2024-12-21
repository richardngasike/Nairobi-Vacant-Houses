import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nairobivacanthouses/Loginscreens/landlordloginscreen/landlord_login_creen.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({super.key});

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nrb3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Overlay
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/nvhlogo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 50),
                // Landlord Button
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => LandlordLoginCreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Explore Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  padding:
                      EdgeInsets.all(8.0), // Add padding for the background
                  decoration: BoxDecoration(
                    color: Colors
                        .black, // Set your background color without opacity
                  ),
                  child: Text(
                    'Developed by Richard Ngasike',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      height: 1.5,
                      shadows: [
                        Shadow(
                          blurRadius: 9.0,
                          color: Colors
                              .black, // Use a darker shadow without opacity
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
