import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:io'; // For handling picked image file

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  State<AccountCreationScreen> createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  final List<String> roles = ['Landlord', 'Tenant'];
  String? selectedRole;

  final List<String> locations = [
    'BuruBuru',
    'Donholm',
    'Eastleigh',
    'Embakasi',
    'Gikambura',
    'Highridge',
    'Jamhuri',
    'Juja',
    'Kahawa West',
    'Kamukunji',
    'Kamulu',
    'Karen',
    'Kayole',
    'Kariobangi',
    'Kasarani',
    'Kawagware',
    'Kilimani',
    'Kimbo',
    'Kibera',
    'Lang’ata',
    'Lavington',
    'Mathare',
    'Mlolongo',
    'Mombasa Road',
    'Ngara',
    'Njiru',
    'Nairobi Central',
    'Parklands',
    'Pangani',
    'Ruai',
    'Ruiru',
    'Roysambu',
    'South B',
    'South C',
    'Starehe',
    'Thika Road',
    'Thika Town',
    'Westlands',
    'Wangige',
  ];

  String? selectedLocation;
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

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
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : AssetImage('assets/images/nvhlogo.png')
                            as ImageProvider,
                    child: _imageFile == null
                        ? Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Landlord or Tenant',
                  border: OutlineInputBorder(),
                ),
                value: selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue;
                  });
                },
                items: roles.map<DropdownMenuItem<String>>((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              if (selectedRole == 'Landlord')
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'House Location',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedLocation,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  },
                  items: locations
                      .map<DropdownMenuItem<String>>((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
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
                  if (selectedRole == 'Landlord') {
                    Get.snackbar('Success', 'Landlord Account Created');
                  } else if (selectedRole == 'Tenant') {
                    Get.snackbar('Success', 'Tenant Account Created');
                  }
                },
                child: Text('Create Account'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 30,
                      color: Colors.red,
                    ),
                    label: const Text('Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                    label: const Text('Facebook'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.apple,
                      size: 30,
                      color: Colors.black,
                    ),
                    label: const Text('Apple'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
