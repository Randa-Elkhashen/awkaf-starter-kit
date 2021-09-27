import 'package:flutter/material.dart';
import 'package:flutter_app/views/view_helpers/imports.dart';

class ListingLoadingScrollScreen extends StatefulWidget {
  const ListingLoadingScrollScreen({Key? key}) : super(key: key);

  @override
  _ListingLoadingScrollScreenState createState() => _ListingLoadingScrollScreenState();
}

class _ListingLoadingScrollScreenState extends State<ListingLoadingScrollScreen> {
  bool verticalLoading = false;
  List<BookCard> list = booksList;
  _onEndScroll(ScrollMetrics metrics, context) {
    setState(() {
      verticalLoading = true;
    });
    if (metrics.atEdge) {
      if (metrics.pixels == 0) {
        // You're at the top.
      } else {
        // You're at the edge of the bottom.
        Future.delayed(new Duration(seconds: 2), () async {
          setState(() {
            list += booksList;
            verticalLoading = false;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.orange,
      ),
      body: Container(
        height: AppDimensions.getFullHeight(),
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification) {
                    _onEndScroll(scrollNotification.metrics, context);
                  }
                  return true;
                },
                child: ListView(
                  children: [
                    // List
                    ...list.map((e) => _buildArtCardWidget(e)).toList(),
                    // vertical loading
                    verticalLoading
                        ? Padding(
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.orange,
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtCardWidget(BookCard book) {
    return Container(
      height: AppDimensions.convertToH(160.0),
      margin: EdgeInsets.only(bottom: AppDimensions.convertToH(10)),
      child: Row(
        children: [
          Container(
            width: AppDimensions.convertToW(120),
            child: Container(
              height: AppDimensions.convertToH(160),
              width: AppDimensions.getFullWidth(),
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.convertToW(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(
                      fontSize: AppDimensions.convertToH(18),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Almarai-Bold',
                    ),
                  ),
                  Text(
                    book.description,
                    style: TextStyle(
                      fontSize: AppDimensions.convertToH(16),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontSize: AppDimensions.convertToH(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Listing Data
class BookCard {
  String title;
  String description;
  String author;
  String imageUrl;

  BookCard({
    required this.title,
    required this.description,
    required this.author,
    required this.imageUrl,
  });
}

var booksList = [
  BookCard(
    title: 'The Harafish',
    description:
        'In The Harafish Naguib Mahfouz returns to the style of sweeping narrative at which he proved himself a master.',
    author: 'Naguib Mahfouz',
    imageUrl: 'https://aucpress.com/wp-content/uploads/2016/10/4167102.jpg',
  ),
  BookCard(
    title: 'The Trial',
    description:
        "The story of The Trial's publication is almost as fascinating as the novel itself.",
    author: 'Naguib Mahfouz',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/51wQmxud3NL._SX331_BO1,204,203,200_.jpg',
  ),
  BookCard(
    title: 'The Harafish',
    description:
        'In The Harafish Naguib Mahfouz returns to the style of sweeping narrative at which he proved himself a master.',
    author: 'Naguib Mahfouz',
    imageUrl: 'https://i.pinimg.com/564x/39/0a/78/390a7830dcde16a0c6619b3bb5ee268a.jpg',
  ),
  BookCard(
    title: 'The Lady With the Dog',
    description:
        'A classic collection of short stories from one the greatest short stories writers of all-time, Anton Chekhov.',
    author: 'Anton Chekhov',
    imageUrl: 'https://m.media-amazon.com/images/I/61VyhS4bZUL.jpg',
  ),
  BookCard(
    title: 'Kafka on the Shore',
    description:
        'Kafka on the Shore displays one of the world’s great storytellers at the peak of his powers.',
    author: 'Haruki Murakami',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/41KORsS++hL._SX343_BO1,204,203,200_.jpg',
  ),
];
