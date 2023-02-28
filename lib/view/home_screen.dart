
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videalalpha_task/controller/auth_controller.dart';
import 'package:videalalpha_task/controller/home_provider.dart';
import '../controller/network_connectivity_controller.dart';
import 'splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final networkController =
        Provider.of<NetworkController>(context, listen: false);

    networkController.getConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Vi DealAlpha",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              authProvider.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.purple,
                    child: CircleAvatar(
                      backgroundColor: Colors.purple,
                      backgroundImage:
                          NetworkImage(authProvider.userModel.profilePic),
                      radius: 50,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Connect Me',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.32,
                              child: ElevatedButton(
                                onPressed: () {
                                  homeProvider.navEmail(context);
                                },
                                child: const Text('Email'),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.32,
                              child: ElevatedButton(
                                onPressed: () {
                                  homeProvider.navPhone(context);
                                },
                                child: const Text('Phone'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                authProvider.userModel.name,textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                authProvider.userModel.bio,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
