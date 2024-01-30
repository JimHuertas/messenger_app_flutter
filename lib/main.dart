import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:messenger_app/routes/routes.dart';

void main(){
   // add these lines
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); 

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger App',
      initialRoute: 'chat' ,
      routes: appRoutes,
    );
  }
}