import 'package:flutter/material.dart';
import 'package:newsample/service/detail_drink_api.dart';

import 'main.dart';

class DrinkDetail extends StatefulWidget {
  final String id;

  const DrinkDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<DrinkDetail> createState() => _DrinkDetailState();
}

class _DrinkDetailState extends State<DrinkDetail> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCocktail(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Errornya: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            dynamic cocktail = snapshot.data!;
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.brown,
                Colors.orange,
              ])),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(cocktail['strDrink']),
                  elevation: 0.0,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cocktail['strDrink'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Hero(
                        tag: cocktail,
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundImage: NetworkImage(
                            cocktail['strDrinkThumb'],
                          ),
                        ),
                      ),
                      Text(
                        'Instructions:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        cocktail['strIngredient1'],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      // SizedBox(height: 8),
                      // Text(
                      //   'Category: ${cocktail.drinks.first.strCategory}',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                      // SizedBox(height: 8),

                      // SizedBox(height: 16),
                      // Image.network(cocktail.drinks.first.strDrinkThumb),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
    //   child: Container(
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(colors: [
    //       Colors.brown,
    //       Colors.orange,
    //     ])),
    //     child: Scaffold(
    //         backgroundColor: Colors.transparent,
    //         appBar: AppBar(
    //           backgroundColor: Colors.transparent,
    //           title: Text("data"),
    //           elevation: 0.0,
    //         ),
    //         body: FutureBuilder(
    //           future: fetchCocktail(widget.id),
    //         )),
    //   ),
    // );

    //  Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
       
    //       SizedBox(
    //         height: 30.0,
    //       ),
    //       Text(
    //         "ID: ${widget.drink["idDrink"]}",
    //         style: TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 30.0,
    //       ),
    //       Text(
    //         "${widget.drink["strDrink"]}",
    //         style: TextStyle(
    //           fontSize: 22,
    //           color: Colors.white,
    //         ),
    //       )
    //     ],
    //   ),
    // ),

