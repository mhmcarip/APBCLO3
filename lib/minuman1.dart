import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newsample/drink_detail.dart'; // Mengimpor dari drink_detail.dart

class MinumanSatu extends StatefulWidget {
  @override
  _MinumanSatuState createState() => _MinumanSatuState();
}

class _MinumanSatuState extends State<MinumanSatu> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic";
  var res, drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minuman Alkohol"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.lightBlue],
          ),
        ),
        child: res != null
            ? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  var drink = drinks[index];
                  return ListTile(
                    leading: Hero(
                      tag: drink["idDrink"],
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          drink["strDrinkThumb"] ??
                              "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                        ),
                      ),
                    ),
                    title: Text(
                      "${drink["strDrink"]}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "${drink["idDrink"]}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrinkDetail(drink: drink),
                        ),
                      );
                    },
                  );
                },
              )
            : Center(child: CircularProgressIndicator(backgroundColor: Colors.white)),
      ),
    );
  }
}
