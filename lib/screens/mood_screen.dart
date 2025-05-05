import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_mgmt_learning/providers/provider.dart';

class MoodScreen extends ConsumerWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //get current value of the emoji
    final mood = ref.watch(moodProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Emoji mood selector'), centerTitle: true),
      body: Center(
        child: Column(
          spacing: 16,
          children: [
            Image.asset(mood, height: 250),
            Text('What is your current mood?', style: TextStyle(fontSize: 20)),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _emojiButton(ref, 'assets/angry.png'),
                _emojiButton(ref, 'assets/smile.png'),
                _emojiButton(ref, 'assets/wow.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emojiButton(WidgetRef ref, String emoji) {
    return ElevatedButton(
      onPressed: () {
        //This will change the current value from provided value
        ref.read(moodProvider.notifier).state = emoji;
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
      child: Image.asset(emoji, height: 50),
    );
  }
}
