import 'package:flutter/material.dart';
import 'package:studet_clean_arch/features/splash/Presentation/view/splash_view.dart';
import 'package:studet_clean_arch/view/login_view.dart';
import 'package:studet_clean_arch/view/sign_up_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/loginRoute': (context) => const LoginView(),
        '/signupRoute': (context) => const SignUpVIew(),
      },
    );
  }
}
