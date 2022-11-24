import 'package:desafio_coopertransc/repository/api.dart';
import 'package:desafio_coopertransc/repository/login_repository.dart';
import 'package:desafio_coopertransc/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtUser = TextEditingController();
  var txtPassword = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
                height: 0.32875 * (MediaQuery.of(context).size.height),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/login_background.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                )),
                child: const Image(
                  image: AssetImage('assets/images/logo_coopertransc.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0.07 * (MediaQuery.of(context).size.width),
                  0.052 * (MediaQuery.of(context).size.height),
                  0.07 * (MediaQuery.of(context).size.width),
                  0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Seja bem vindo!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFF000D0C),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        DefaultTextField(
                            controllerVariable: txtUser,
                            label: 'Usuário',
                            icon: Icons.person,
                            isPassword: false),
                        DefaultTextField(
                            controllerVariable: txtPassword,
                            label: 'Senha',
                            icon: Icons.key,
                            isPassword: true),
                        formattedButton('Fazer Login')
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: const Text(
                      'Visite nosso site',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF002825),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  formattedButton(msg) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(55),
          primary: const Color(0xFF1A5650),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          msg,
          style: const TextStyle(fontSize: 18),
        ),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            User? user =
                await LoginRepository().login(txtUser.text, txtPassword.text);

            if (user != null) {
              ApiRepository.setUserData(user.token, user.id.toString());
              redirectUser();
            } else {
              showSnackBar("Usuário ou senha inválidos");
            }
          }
        },
      ),
    );
  }

  void redirectUser() {
    Navigator.pushNamed(context, '/turn');
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(message))
      ]),
      backgroundColor: Colors.red,
    ));
  }
}
