import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_mgmt_learning/providers/provider.dart';

class NameScreen extends ConsumerWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameprovider);
    return Scaffold(
      appBar: AppBar(title: Text('Provider Example')),
      body: Center(child: Text('Hello $name')),
    );
  }
}
