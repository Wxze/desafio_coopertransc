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
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                ),
                Text(
                  userData.email,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white54,
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
    return ClipRRect(
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
                  Flexible(flex: 1, child: userDataSection(userData)),
                  Flexible(flex: 4, child: userDataForm(userData))
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
