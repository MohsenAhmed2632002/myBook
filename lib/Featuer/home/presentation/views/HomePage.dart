import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/Featuer/home/data/data_sour/home_rem_data_sources.dart';
import 'package:mybook/Featuer/home/data/home_repo/home_repo_impl.dart';
import 'package:mybook/Featuer/home/domain/Use_Cases/fechFeatuerBooksUseCase.dart';
import 'package:mybook/Featuer/home/presentation/Manger/FeatuerBooks/fech_featuer_books_cubit.dart';
import 'package:mybook/Featuer/home/presentation/views/Widgets.dart';
import 'package:mybook/Services.dart';

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
                  FechFeatuerBooksUseCase(
                    HomeRepoImpl(

                      homeRemoteDataSourcessImpl:,
                    ),
                  ),
                ),
                child: CarouselSliderView(
                    imageList: imageList, activeAnimation: activeAnimation!),
              ),
              BestSellerRow(),
              ListViewImageList(imageList: imageList, flex: 8),
            ],
          ),
        ),
      ),
    );
  }
}
