import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:eclipse/app/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await AuthService().authenticate(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!mounted) return;
      context.go('/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: screenSize.height / 20),
            _buildWelcomeHeader(),
            SizedBox(height: screenSize.height / 20),
            _buildLoginForm(),
            const SizedBox(height: 10),
            _buildSignUpNavigation(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader() {
    return Column(
      children: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi, Welcome Back! ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.waving_hand_outlined, size: 35),
          ],
        ),
        Text(
          "Sign In to Continue",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _isLoading ? null : _login,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () => context.go("/sign_up"),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            overlayColor: const Color.fromRGBO(0, 0, 0, 0),
          ),
          child: const Text("Sign Up"),
        ),
      ],
    );
  }
}
