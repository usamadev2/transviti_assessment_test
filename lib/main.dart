import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transviti_assessment_test/controller/auth_controller.dart';
import 'package:transviti_assessment_test/controller/home/get_repository.dart';
import 'package:transviti_assessment_test/views/home/home_screen.dart';
import 'package:transviti_assessment_test/views/login/login_screen.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

var uuid = const Uuid();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProviders>(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider<GetApiRepository>(
          create: (context) => GetApiRepository(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirebaseAuth.instance.currentUser != null ? const HomeScreen() : const LogInScreen(),
        );
      },
    );
  }
}
