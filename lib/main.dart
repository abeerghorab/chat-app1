import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sivven_pro/pages/Login_page.dart';
import 'package:sivven_pro/pages/chat_page.dart';
import 'package:sivven_pro/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sivven_pro/widget/constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      //initialRoute: LoginPage.id,
      home: AnimatedSplashScreen(
        backgroundColor: Colors.blue,
        splashIconSize: 300,
        splashTransition: SplashTransition.rotationTransition,
        splash: CircleAvatar(
          radius: 180,
          backgroundImage: AssetImage(kLogo),
        ),
        nextScreen: LoginPage(),
      ),
    );
  }
}
