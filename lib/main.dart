import 'package:demobloc/screen_recett.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  /* foodcontroller().getdata().then((value) => print(value)).catchError((error) {
    print(error); 
  });*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: foodscreen(),
    );
  }
}
