import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nairobivacanthouses/Loginscreens/landlordloginscreen/landlord_signup_screen.dart';

class LandlordLoginCreen extends StatefulWidget {
  const LandlordLoginCreen({super.key});

  @override
  State<LandlordLoginCreen> createState() => _LandlordLoginCreenState();
}

class _LandlordLoginCreenState extends State<LandlordLoginCreen> {
  String userType = 'Landlord'; // Default user type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/nvhlogo.png',
                  height: 130,
                ),
              ),
              const SizedBox(height: 20),

              // User Type Dropdown
              DropdownButton<String>(
                value: userType,
                items: ['Landlord', 'Tenant']
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    userType = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate based on user type
                  if (userType == 'Landlord') {
                    Get.toNamed('/home', arguments: 'Landlord');
                  } else {
                    Get.toNamed('/home', arguments: 'Tenant');
                  }
                },
                child: Text('Login as $userType'),
              ),
              const SizedBox(height: 10),

              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 30, // Increased icon size
                      color: Colors.red, // Google red color
                    ),
                    label: const Text('Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black, // Text color
                      side: BorderSide(
                          color: Colors.grey.shade300, width: 1), // Border
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      size: 30, // Increased icon size
                      color: Colors.blue, // Facebook blue color
                    ),
                    label: const Text('Facebook'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black, // Text color
                      side: BorderSide(
                          color: Colors.grey.shade300, width: 1), // Border
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.apple,
                      size: 30, // Increased icon size
                      color: Colors.black, // Apple black color
                    ),
                    label: const Text('Apple'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black, // Text color
                      side: BorderSide(
                          color: Colors.grey.shade300, width: 1), // Border
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Create Account Link
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => AccountCreationScreen());
                  },
                  child: const Text(
                    'Create account?',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: const Center(
        child: Text('Account creation screen goes here!'),
      ),
    );
  }
}
