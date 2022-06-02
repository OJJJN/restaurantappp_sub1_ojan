import 'package:flutter/material.dart';
import 'package:restaurantappp/common/styles.dart';
import 'package:restaurantappp/datajsn/restaurant.dart';

class RestoListPage extends StatelessWidget {
  const RestoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final restaurants = restaurantsFromJson(snapshot.data);
          return ListView.builder(
              itemCount: restaurants.restaurants.length,
              itemBuilder: ((context, index) {
                return _buildRestaurantItem(
                    context, restaurants.restaurants[index]);
              }));
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'HalamanKedua',
              arguments: restaurant);
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: kTitle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: kPrimaryColor,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(color: kForColor),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Icon(
                            Icons.location_pin,
                            size: 14,
                            color: kThiColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(restaurant.city,
                              style: const TextStyle(color: kForColor)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        restaurant.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ktitle,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
