import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Clean Architecture Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref
                    .read(authProvider.notifier)
                    .login("test@gmail.com", "123456");
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            state.when(
              data: (user) =>
                  Text(user == null ? "Not logged in" : "Welcome ${user.name}"),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text(e.toString()),
            )
          ],
        ),
      ),
    );
  }
}
