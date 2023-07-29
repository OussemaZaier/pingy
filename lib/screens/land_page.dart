import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:whatsapp_clone/notifier/dark_theme_provider.dart';

class LandPage extends StatelessWidget {
  const LandPage({super.key});

  static Route<void> route({bool isRegistering = false}) {
    return MaterialPageRoute(
      builder: (context) => const LandPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = SimpleAnimation('loop');
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
                child: Container(
                  color: Theme.of(context).colorScheme.primary.withAlpha(150),
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RiveAnimation.asset(
                    'assets/rive/main.riv',
                    controllers: [controller],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'Your Passport to Instant Connections.',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'With our innovative chat app, stay connected with friends and family like never before, sharing moments and creating memories in real-time.',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(height: 1.3),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: MediaQuery.of(context).size.width / 4,
                        ),
                        child: const Text('Get Started'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Already have an account? ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Checkbox(
                  value: themeChange.darkTheme,
                  onChanged: (value) {
                    themeChange.darkTheme = value!;
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

// Navigator.of(context)
//           .pushAndRemoveUntil(RegisterPage.route(), (route) => false);