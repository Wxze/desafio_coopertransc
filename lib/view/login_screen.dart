import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 0.35*(MediaQuery.of(context).size.height),
                decoration: const BoxDecoration(
                  color: Color(0x33C3C3C3),
                  image: DecorationImage(
                    image: AssetImage('images/login_background.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Color(0x77C3C3C3), BlendMode.dstATop),
                  )
                ),
                child: const Image(
                  image: AssetImage('images/logo_coopertransc.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
