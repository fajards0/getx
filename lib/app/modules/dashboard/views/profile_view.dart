import 'package:flutter/material.dart';
import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // logic logout
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
