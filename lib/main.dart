import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videalalpha_task/controller/auth_controller.dart';
import 'package:videalalpha_task/controller/home_provider.dart';
import 'package:videalalpha_task/controller/network_connectivity_controller.dart';
import 'package:videalalpha_task/view/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
        ChangeNotifierProvider(create: (_)=>HomeProvider()),
        ChangeNotifierProvider(create: (_)=>NetworkController()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home:const SplashScreen() ,
      ),
    );
  }
}
