import 'package:flutter/material.dart';
import 'package:restaurantappp/common/styles.dart';
import 'package:restaurantappp/datajsn/restaurant.dart';


class RestoDetailPage extends StatefulWidget {
  final Restaurant restaurants;

  const RestoDetailPage({Key? key, required this.restaurants}) : super(key: key);

  @override
  State<RestoDetailPage> createState() => _RestoDetailPageState();
}

class _RestoDetailPageState extends State<RestoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        widget.restaurants.pictureId,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                )
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurants.name,
                        style: kTitle.copyWith(fontSize: 18),
                      ),
                      const LikeButton()
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: kPrimaryColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.restaurants.rating.toString(),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.location_pin,
                        color: kThiColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(widget.restaurants.city)
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                      child: Text(
                        "Description",
                        style: kTitle,
                      )),
                  Card(
                    elevation: 4,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(widget.restaurants.description),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    child: Text(
                      "Menu",
                      style: kTitle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    child: Text(
                      "Food",
                      style: ktitle.copyWith(
                        color: kForColor,
                      ),
                    ),
                  ),
                  listMenu(widget.restaurants.menus.foods),
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    child: Text(
                      "Drink",
                      style: ktitle.copyWith(
                        color: kForColor,
                      ),
                    ),
                  ),
                  listMenu(widget.restaurants.menus.drinks)
                ],
              ),
            )),
      ),
    );
  }

  listMenu(List<dynamic> menus) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: menus.map((list) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://akcdn.detik.net.id/visual/2021/09/04/chocolate-croffle_169.jpeg?w=650",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(list.name))
              ]);
        }).toList(),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLike ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
        color: const Color(0xFF0000FF),
        size: 28,
      ),
      onPressed: () {
        setState(() {
          isLike = !isLike;
        });
      },
    );
  }
}