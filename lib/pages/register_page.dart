import 'package:flutter/material.dart';
import 'package:messenger_app/widgets/blueButton.dart';

import 'package:messenger_app/widgets/costum_imput.dart';
import 'package:messenger_app/widgets/labels.dart';
import 'package:messenger_app/widgets/logo.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Logo(
                  titulo: 'Registro',
                ),
                _Form(),
                Labels(
                  text: '¿Ya tienes cuenta?',
                  textLinked: 'Ingresar a cuenta',
                  route: 'login',
                ),
                const Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ],
            ),
          ),
        ),
      ),
   );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomImput(
            hintText: "Nombre",
            prefixIcon: Icons.perm_identity,
            keyboardType: TextInputType.text,
            textController: nameCtrl, 
          ),
          CustomImput(
            hintText: "Correo",
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomImput(
            hintText: "Contraseña",
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            textController: passwordCtrl, 
          ),

          BlueButton(
            emailCtrl: emailCtrl,
            passwordCtrl: passwordCtrl,
            text: 'Ingresar',
            onPressed: (){
              print(passwordCtrl.text);
              print(emailCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
