import 'package:flutter/material.dart';
import 'package:testdaten/src/data/firebase_auth_repo.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();

  final FirebaseAuthRepo _authRepo = FirebaseAuthRepo();

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final passwordRepeat = _passwordRepeatController.text.trim();

    if (password != passwordRepeat) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwörter stimmen nicht überein")),
      );
      return;
    }

    try {
      await _authRepo.register(email, password);
      Navigator.of(context).pop(); // Go back to login after registration
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrierung fehlgeschlagen: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrieren")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Dein Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Deine Email"),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: "Deine Straße und Hausnummer",
              ),
            ),
            TextField(
              controller: _zipCodeController,
              decoration: InputDecoration(labelText: "Postleitzahl"),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: "Ort"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Passwort"),
              obscureText: true,
            ),
            TextField(
              controller: _passwordRepeatController,
              decoration: InputDecoration(labelText: "Passwort wiederholen"),
              obscureText: true,
            ),
            FilledButton(onPressed: _register, child: Text("Registrieren")),
          ],
        ),
      ),
    );
  }
}
