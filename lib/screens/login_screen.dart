import 'package:flutter/material.dart';
import 'package:multi_role_baseapp/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email')),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Passward')),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Age')),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                sp.setBool('isLogin', true);

                // Verify that the values are being set
                // String? email = sp.getString('email');
                // String? age = sp.getString('age');
                // bool? isLogin = sp.getBool('isLogin');
                // print('Stored email: $email');
                // print('Stored age: $age');
                // print('Stored login status: $isLogin');

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
