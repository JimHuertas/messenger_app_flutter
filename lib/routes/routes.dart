
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chats_page.dart';
import 'package:messenger_app/pages/loading_page.dart';
import 'package:messenger_app/pages/login_page.dart';
import 'package:messenger_app/pages/register_page.dart';
import 'package:messenger_app/pages/usuarios_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'usuarios'  : ( _ ) => UsuariosPage(),
  'chat'      : ( _ ) => ChatPage(),
  'login'     : ( _ ) => LoginPage(),
  'register'  : ( _ ) => RegisterPage(),
  'loading'   : ( _ ) => LoadingPage(),
};