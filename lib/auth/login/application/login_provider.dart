import 'package:riverpod/riverpod.dart';

final loginProvider = StateNotifierProvider.autoDispose((ref) {
  return Login();
});

class Login extends StateNotifier<int> {
  Login() : super(0);

  void increment() => state++;
  void decrement() => state--;
}
