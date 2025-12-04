import 'package:f_sm_ca/riverpod/provider/theme_notifier.dart';
import 'package:f_sm_ca/riverpod/provider/theme_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeScreen extends ConsumerWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final notifier = ref.read(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Multi Theme Classes")),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeState.isDark,
            onChanged: (_) => notifier.toogleState(),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () =>
                    notifier.changeTheme(AppThemeType.blue),
                child: const Text("Blue"),
              ),
              ElevatedButton(
                onPressed: () =>
                    notifier.changeTheme(AppThemeType.green),
                child: const Text("Green"),
              ),
              ElevatedButton(
                onPressed: () =>
                    notifier.changeTheme(AppThemeType.purple),
                child: const Text("Purple"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
