import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videalalpha_task/controller/auth_controller.dart';
import 'package:videalalpha_task/controller/home_provider.dart';
import 'package:videalalpha_task/controller/network_connectivity_controller.dart';
import 'package:videalalpha_task/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD20LGw4pKZUsJByHU6qb0m224oNyelpz8',
        appId: "1:695742409260:web:4fd1bf289126ae5f65ff89",
        messagingSenderId: "695742409260",
        projectId: "vi-dealalpha",
        storageBucket: 'vi-dealalpha.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => NetworkController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
