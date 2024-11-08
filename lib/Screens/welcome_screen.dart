import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../routes/app_router.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to satellite tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.push(const InputRoute());
              }, child: const Icon(Icons.arrow_forward)
            ),
          ],
        )
      ),
    );
  }
}