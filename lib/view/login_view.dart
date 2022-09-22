import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtCpf = TextEditingController();
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
                  image: AssetImage('images/login_background.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                )),
                child: const Image(
                  image: AssetImage('images/logo_coopertransc.png'),
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
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                        formattedTextField(
                          txtCpf,
                          'CPF',
                          const Icon(
                            Icons.person,
                            color: Color(0xFF000D0C),
                            size: 24,
                          ),
                          checkPwField(false)
                        ),
                        formattedTextField(
                          txtPassword,
                          'Senha',
                          const Icon(
                            Icons.key,
                            color: Color(0xFF000D0C),
                            size: 24
                          ),
                          checkPwField(true)
                        ),
                        formattedButton('Fazer Login')
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 38, 0, 30),
                    child: const Text(
                      'Visite nosso site',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF002825),
                        decoration: TextDecoration.underline
                      ),
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

  formattedTextField(controllerVar, label, icon, bool isPwField) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: TextFormField(
        controller: controllerVar,
        obscureText: isPwField,
        enableSuggestions: false,
        autocorrect: false,
        
        style: const TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(20),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xFF000D0C)),
          hintText: 'Informe o valor',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0x77103430),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: icon,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF487873),
              width: 2.4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF103430),
              width: 1.7,
            ),
          ),
        ),
      ),
    );
  }

  formattedButton(msg) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 55, 0, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(55),
          primary: const Color(0xFF1A5650),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(msg, style: const TextStyle(fontSize: 18),),
        onPressed: () {Navigator.pushNamed(context, '/turn');},
      ),
    );
  }

bool checkPwField(bool isPw){
  return isPw;
}

}
