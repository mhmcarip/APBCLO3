import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final Map drink;

  DrinkDetail({required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink["strDrink"]),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.lightBlue],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Hero(
                tag: drink["idDrink"],
                child: Image.network(
                  drink["strDrinkThumb"] ??
                      "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                ),
              ),
              Text(
                drink["strDrink"],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
