import 'package:get/get.dart'; 
import 'package:get_storage/get_storage.dart'; 
import 'package:flutter/material.dart'; 
import '../../dashboard/views/dashboard_view.dart';
import '../../../utils/api.dart';

class RegisterController extends GetxController {
  final _getConnect = GetConnect();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final authToken = GetStorage();

  void registerNow() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirmation = passwordConfirmationController.text.trim();

    // Validasi input
    if (name.isEmpty) {
      Get.snackbar(
        'Error',
        'Nama tidak boleh kosong.',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (email.isEmpty || !GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error',
        'Email harus diisi dan berformat email yang valid.',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (password.isEmpty || password.length < 8) {
      Get.snackbar(
        'Error',
        'Password harus diisi dan minimal 8 karakter.',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (password != passwordConfirmation) {
      Get.snackbar(
        'Error',
        'Konfirmasi password tidak cocok.',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Kirim data ke server
    final response = await _getConnect.post(BaseUrl.register, {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    if (response.statusCode == 201) {
      authToken.write('token', response.body['token']);
      Get.offAll(() => const DashboardView());
    } else {
      Get.snackbar(
        'Error',
        response.body['error'].toString(),
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.onClose();
  }
}
