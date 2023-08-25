import 'package:flutter/material.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Widgets.dart';

class BookPage extends StatefulWidget {
  BookPage({super.key, required this.index, required this.singleBook});
  final BookEntity singleBook;
  final int index;

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int? activeAnimation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                      Icons.shopping_cart,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Detalis(
                widget: widget,
              ),
              // ListViewImageList(
              //   imageList: imageList,
              //   flex: 2,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
