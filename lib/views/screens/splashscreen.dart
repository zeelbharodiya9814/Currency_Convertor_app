import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
  }

  void splash() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 90,
                  width: 90,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/logo1.jpg"))),
            ],
          ),
        ),
      ),
    );
  }
}
