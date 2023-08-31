import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mybook/Featuer/Splash/Splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>("FeatueredBox");
  await Hive.openBox<BookEntity>("NewestBox");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.abrilFatfaceTextTheme(
          ThemeData.dark().textTheme,
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: Color(0xFF100B20),
      ),
      home: SplashScreen(),
    );
  }
}

//  TextFormField(
//                             controller: emailControllor,
//                             obscureText: isObscuretextone,
//                             autovalidateMode: AutovalidateMode.always,
//                             validator: (value) {
//                               if (value!.length < 8 || value.isEmpty) {
//                                 return "it must be biger than 8 ";
//                               } else {}
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     isObscuretextone = !isObscuretextone;
//                                   });
//                                 },
//                                 icon: isObscuretextone
//                                     ? Icon(Icons.visibility)
//                                     : Icon(Icons.visibility_off),
//                               ),
//                               hintText: "Enter The email",
//                               labelText: "Enter Your email",
//                               labelStyle: TextStyle(
//                                 color: Color.fromARGB(255, 0, 76, 148),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 0, 76, 148),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
