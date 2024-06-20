import 'package:flutter/material.dart';
import 'package:newsample/service/detail_drink_api.dart';
import 'package:newsample/utils/const.dart';

import 'main.dart';

class DrinkDetailPage extends StatefulWidget {
  final String id;

  const DrinkDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DrinkDetailPage> createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {
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
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              elevation: 0,
              backgroundColor: primary,
              title: Text("Details "),
            ),
            backgroundColor: primary,
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                        cocktail['strDrinkThumb'],
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primary, accent, primary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        color: primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              cocktail['strDrink'],
                              style: title,
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1,
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  cocktail['strCategory'],
                                  style: title,
                                ),
                                Text(
                                  cocktail['strAlcoholic'],
                                  style: title,
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1,
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  cocktail['strInstructions'],
                                  style: smallcontent,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      cocktail['strGlass'],
                                      style: smallcontent,
                                    ),
                                    Icon(
                                      Icons.wine_bar_outlined,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1,
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Ingredient",
                                  style: title,
                                ),
                              ],
                            ),
                            buildIngredientRow(cocktail['strIngredient1'],
                                cocktail['strMeasure1']),
                            buildIngredientRow(cocktail['strIngredient2'],
                                cocktail['strMeasure2']),
                            buildIngredientRow(cocktail['strIngredient3'],
                                cocktail['strMeasure3']),
                            buildIngredientRow(cocktail['strIngredient4'],
                                cocktail['strMeasure4']),
                            buildIngredientRow(cocktail['strIngredient5'],
                                cocktail['strMeasure5']),
                            buildIngredientRow(cocktail['strIngredient6'],
                                cocktail['strMeasure6']),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildIngredientRow(String? ingredient, String? measure) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ingredient?.toString() ?? '',
          style: smallcontent,
        ),
        Text(
          measure?.toString() ?? '',
          style: smallcontent,
        ),
      ],
    );
  }
}
