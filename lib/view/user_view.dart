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

  Widget userDataSection(User userData) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey.shade500,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userData.nome,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                Text(
                  userData.email,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userDataForm(User userData) {
    return Card(
      color: const Color(0xFFF1F5F5),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      margin: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(children: [
                      Flexible(
                        child: DefaultTextField(
                          controllerVariable: txtUser,
                          label: 'Usuário',
                          isPassword: false,
                          icon: Icons.person,
                        ),
                      )
                    ]),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultTextField(
                            controllerVariable: txtEmail,
                            label: 'Email',
                            isPassword: false,
                            icon: Icons.email,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultTextField(
                            controllerVariable: txtPassword,
                            label: 'Senha',
                            isPassword: true,
                            icon: Icons.key,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultButton(
                            label: 'Editar',
                            onClick: () {
                              if (formKey.currentState!.validate()) {
                                handleApiCall();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF1A5650),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Editar Usuário",
              style: TextStyle(
                fontSize: 16,
              )),
          centerTitle: true,
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
              Future.delayed(Duration.zero, () {
                showSnackBar(snapshot.error.toString());
              });
            } else if (snapshot.hasData) {
              User userData = snapshot.data as User;
              return Column(
                children: [
                  userDataSection(userData),
                  Expanded(child: userDataForm(userData))
                ],
              );
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

  void handleClick(String value) {
    switch (value) {
      case 'Sair':
        Navigator.pushNamed(context, '/login');
        break;
    }
  }
}
