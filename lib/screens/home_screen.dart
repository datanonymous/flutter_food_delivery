import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import './cart_screen.dart';
import './restaurant_screen.dart';
import '../widgets/rating_stars.dart';
import '../widgets/recent_orders.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant))),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      restaurant.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    RatingStars(restaurant.rating),
                    SizedBox(height: 4),
                    Text(
                      restaurant.address,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '0.2 miles away',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30,
          onPressed: () {},
        ),
        actions: [
          FlatButton(
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: .8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: .8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants(),
            ],
          ),
        ],
      ),
    );
  }
}
