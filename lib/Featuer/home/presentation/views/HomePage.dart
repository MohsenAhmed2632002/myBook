import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/Featuer/home/data/home_repo/home_repo_impl.dart';
import 'package:mybook/Featuer/home/domain/Use_Cases/fechFeatuerBooksUseCase.dart';
import 'package:mybook/Featuer/home/domain/Use_Cases/fechNewestBooksUseCase.dart';
import 'package:mybook/Featuer/home/presentation/Manger/FeatuerBooks/fech_featuer_books_cubit.dart';
import 'package:mybook/Featuer/home/presentation/Manger/cubit/newest_books_cubit.dart';
import 'package:mybook/Featuer/home/presentation/views/Widgets.dart';
import 'package:mybook/main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? activeAnimation = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/Logo.png",
                    height: 50,
                    fit: BoxFit.fitWidth,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BlocProvider(
                create: (context) => FechFeatuerBooksCubit(
                  FechFeatuerBooksUseCase(getIt.get<HomeRepoImpl>()),
                )..fechFeatuerBook(),
                child:
                    BlocBuilder<FechFeatuerBooksCubit, FechFeatuerBooksState>(
                  builder: (context, state) {
                    if (state is FechFeatuerBooksSuccess) {
                      return CarouselSliderView(
                          imageList: state.myBook,
                          activeAnimation: activeAnimation!);
                    } else if (state is FechFeatuerBooksFaulier) {
                      return Center(
                        child: Text("${state.EM}"),
                      );
                    } else if (state is FechFeatuerBooksLoading) {
                      return CircularProgressIndicator();
                    }
                    return Text("${state}");
                  },
                ),
              ),
              BestSellerRow(),
              BlocProvider(
                create: (context) => FechNewestBooksCubit(
                  FechNewestBooksUseCase(
                    getIt.get<HomeRepoImpl>(),
                  ),
                )..fechNewestBook(),
                child: BlocBuilder<FechNewestBooksCubit, FechNewestBooksState>(
                  builder: (context, state) {
                    if (state is FechNewestBooksSuccess) {
                      return ListViewImageList(
                          imageList: state.myNewestBook, flex: 8);
                    } else if (state is FechNewestBooksLoading) {
                      return CircularProgressIndicator();
                    } else if (state is FechNewestBooksFaulier) {
                      Center(
                        child: Text("${state.EM}"),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
