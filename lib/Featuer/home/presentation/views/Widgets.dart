import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';

import 'BookPage.dart';

class ListViewImageList extends StatelessWidget {
  const ListViewImageList({
    required this.flex,
    super.key,
    required this.imageList,
  });
  final int flex;
  final List<BookEntity> imageList;

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
                      child: Image.network(
                        fit: BoxFit.fill,
                        "${imageList[index].imagePath}",
                        height: 200,
                        width: MediaQuery.sizeOf(context).width / 3,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${imageList[index].name}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${imageList[index].writer}",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white38),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "EP: ${imageList[index].cash ?? 200}",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "${imageList[index].rating}",
                                style: TextStyle(
                                  fontSize: 15,
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
  final List<BookEntity> imageList;
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
                          child: Image.network(
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
            child: Image.network(
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
            "${widget.singleBook.cash ?? 200}",
            style: TextStyle(fontSize: 20),
          ),
          Row(
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
                    "${widget.singleBook.cash ?? 200}",
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
          )
        ],
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
              "${price ?? 200}",
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
