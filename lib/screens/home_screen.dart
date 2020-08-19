import 'package:flutter/material.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30,
          onPressed: (){},
        ),
        actions: [
          FlatButton(
            child: Text('Cart (${currentUser.cart.length})'),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}

