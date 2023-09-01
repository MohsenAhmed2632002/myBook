import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mybook/Featuer/Splash/Splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:get_it/get_it.dart';
import 'package:mybook/Services.dart';

import 'Featuer/home/data/data_sour/home_loca_data_sources.dart';
import 'Featuer/home/data/data_sour/home_rem_data_sources.dart';
import 'Featuer/home/data/home_repo/home_repo_impl.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>("FeatueredBox");
  await Hive.openBox<BookEntity>("NewestBox");
  getIt.registerSingleton( HomeRepoImpl(
                      homeLocalDataSourcess: HomeLocalDataSourcessImpl(),
                      homeRemoteDataSourcessImpl: HomeRemoteDataSourcessImpl(
                        ApiServices(
                          Dio(),
                        ),
                      ),
                    ),);
  runApp(const MyApp());
}

final getIt = GetIt.instance;

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
