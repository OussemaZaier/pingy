import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:whatsapp_clone/notifier/dark_theme_provider.dart';
import 'package:whatsapp_clone/screens/home_page.dart';
import 'package:whatsapp_clone/utils/constants.dart';
import 'package:provider/provider.dart' as provider;
import 'package:whatsapp_clone/view_model/user_view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.of(context)
          .pushAndRemoveUntil(HomePage.route(), (route) => false);
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();
    //change theme
    final themeChange = provider.Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: formPadding,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          formSpacer,
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          formSpacer,
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () {
                    loginViewModel.login(
                        _emailController.text, _passwordController.text);
                    if (loginViewModel.loading) {
                      print('loading');
                    }
                    print(loginViewModel.error);
                    print(loginViewModel.res);
                  },
            child: const Text('Login'),
          ),
          formSpacer,
          Checkbox(
            value: themeChange.darkTheme,
            onChanged: (value) {
              themeChange.darkTheme = value!;
            },
          ),
        ],
      ),
    );
  }
}
