import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/pages/pages.dart';

final Map<String, WidgetBuilder> appRoutes ={

  'usuarios': ( _ ) => const UsuariosPage(),
  'login'   : ( _ ) => const LoginPage(),
  'register': ( _ ) => const RegisterPage(),
  'chat'    : ( _ ) => const ChatPage(),
  'loading' : ( _ ) => const LoadingnPage(),

};