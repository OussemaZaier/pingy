import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary.withAlpha(200),
                height: MediaQuery.of(context).size.height / 3,
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
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'data data data data data datadata data data data data data',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'data data data data data data data data data data data data data data data data data datdata data data data data data',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Get Started'),
                ),
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
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}

// Navigator.of(context)
//           .pushAndRemoveUntil(RegisterPage.route(), (route) => false);