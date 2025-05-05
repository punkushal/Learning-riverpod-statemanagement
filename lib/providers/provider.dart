import 'package:flutter_riverpod/flutter_riverpod.dart';

//Simple example of basic provider to only read the value
final nameprovider = Provider<String>((ref) {
  return 'Kushal Pun';
});

//Simple example of StateProvider to not only read it but also change the value
//State provider is useful for switching dark/light theme
final moodProvider = StateProvider((ref) {
  return 'assets/smile.png';
});
