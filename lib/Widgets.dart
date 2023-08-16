import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mybook/Featuer/home/domain/Reops/homeRepo.dart';

import 'Featuer/home/presentation/views/BookPage.dart';

List<BookRepo> imageList = [
  BookRepo(
      name: "Harry potter and The Goblet Of Fire ",
      imagePath: "assets/images/book.png",
      writer: "J.K. Rowling",
      rating: 5,
      cash: 1290),
  BookRepo(
      name: "The Jungle Book",
      imagePath: "assets/images/book1.png",
      writer: "Rudyaed Kipling",
      rating: 5,
      cash: 14500),
  BookRepo(
      name: "Star Wars Return Of The Jedi",
      imagePath: "assets/images/book2.png",
      writer: "writer",
      rating: 4.8,
      cash: 1240),
  BookRepo(
      name: "name",
      imagePath: "assets/images/book3.png",
      writer: "writer",
      rating: 5,
      cash: 570),
  BookRepo(
      name: "name",
      imagePath: "assets/images/book4.png",
      writer: "writer",
      rating: 4.9,
      cash: 6780),
  BookRepo(
    name: "name",
    imagePath: "assets/images/book4.png",
    writer: "writer",
    rating: 4.1,
    cash: 5600,
  ),
  BookRepo(
      name: "name",
      imagePath: "assets/images/book6.png",
      writer: "writer",
      rating: 4.1,
      cash: 5450),
  BookRepo(
      name: "name",
      imagePath: "assets/images/book7.png",
      writer: "writer",
      rating: 4,
      cash: 4564),
];

class ListViewImageList extends StatelessWidget {
  const ListViewImageList({
    required this.flex,
    super.key,
    required this.imageList,
  });
  final int flex;
  final List<BookRepo> imageList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2,
        child: ListView.builder(
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookPage(
                      index: index,
                      singleBook: imageList[index],
                    );
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: index,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "${imageList[index].imagePath}",
                        height: 200,
                        width: MediaQuery.sizeOf(context).width / 3,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${imageList[index].name}",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "${imageList[index].writer}",
                            style:
                                TextStyle(fontSize: 22, color: Colors.white38),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "EP: ${imageList[index].cash}",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${imageList[index].rating}",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Icon(Icons.star, color: Colors.amber[400]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BestSellerRow extends StatelessWidget {
  const BestSellerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "BestSeller",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CarouselSliderView extends StatefulWidget {
  CarouselSliderView(
      {super.key, required this.imageList, required this.activeAnimation});
  final List<BookRepo> imageList;
  int activeAnimation;
  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        height: MediaQuery.sizeOf(context).height / 3,
        child: CarouselSlider(
          items: widget.imageList
              .map(
                (e) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Hero(
                          tag: e,
                          child: Image.asset(
                            e.imagePath,
                            fit: BoxFit.fill,
                            height: 300,
                            width: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              height: 250,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => widget.activeAnimation = index)),
        ),
      ),
    );
  }
}

class BuyOrPreViewWidget extends StatelessWidget {
  const BuyOrPreViewWidget({
    super.key,
    required this.price,
  });
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                12,
              ),
              bottomLeft: Radius.circular(
                12,
              ),
            ),
          ),
          height: MediaQuery.sizeOf(context).height / 10,
          width: MediaQuery.sizeOf(context).width / 2.5,
          child: Center(
            child: Text(
              "${price}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent[700],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                12,
              ),
              bottomRight: Radius.circular(
                12,
              ),
            ),
          ),
          height: MediaQuery.sizeOf(context).height / 10,
          width: MediaQuery.sizeOf(context).width / 2.5,
          child: Center(child: Text("Free Previwe")),
        ),
      ],
    );
  }
}

class Detalis extends StatelessWidget {
  const Detalis({
    super.key,
    required this.widget,
  });

  final BookPage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Hero(
            tag: widget.index,
            child: Image.asset(
              fit: BoxFit.fill,
              "${widget.singleBook.imagePath}",
              height: 250,
              width: MediaQuery.sizeOf(context).width / 3,
            ),
          ),
          Text(
            "${widget.singleBook.name}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${widget.singleBook.writer}",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "${widget.singleBook.cash}",
            style: TextStyle(fontSize: 20),
          ),
          BuyOrPreViewWidget(
            price: widget.singleBook.cash,
          )
        ],
      ),
    );
  }
}
