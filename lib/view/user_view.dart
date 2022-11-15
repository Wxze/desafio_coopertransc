import 'package:desafio_coopertransc/repository/user_repository.dart';
import 'package:desafio_coopertransc/widgets/default_button.dart';
import 'package:desafio_coopertransc/widgets/default_text_field.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  var txtUser = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1A5650),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          actions: <Widget>[
            PopupMenuButton(
              onSelected: handleClick,
              itemBuilder: (context) {
                return {'Sair'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: UserRepository().getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Não foi possível exibir os dados'));
            } else if (snapshot.hasData) {
              User userData = snapshot.data as User;
              return Card(
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey.shade500,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData.nome,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    userData.email,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        const Text(
                          'Editar usuário',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                DefaultTextField(
                                  controllerVariable: txtUser,
                                  label: 'Usuário',
                                  isPassword: false,
                                  icon: Icons.person,
                                ),
                                DefaultTextField(
                                  controllerVariable: txtEmail,
                                  label: 'Email',
                                  isPassword: false,
                                  icon: Icons.email,
                                ),
                                DefaultTextField(
                                  controllerVariable: txtPassword,
                                  label: 'Senha',
                                  isPassword: true,
                                  icon: Icons.key,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                DefaultButton(
                                  label: 'Editar',
                                  onClick: () {
                                    if (formKey.currentState!.validate()) {
                                      handleApiCall();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  void handleApiCall() async {
    User? user = await UserRepository()
        .edit(txtUser.text, txtEmail.text, txtPassword.text);

    if (user != null) {
      setState(() {});
    } else {
      showSnackBar('Não foi possível alterar os dados do usuário');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  void handleClick(String value) {
    switch (value) {
      case 'Sair':
        Navigator.pushNamed(context, '/login');
        break;
    }
  }
}
