import 'package:flutter/material.dart';

class DataKelompok extends StatelessWidget {
  const DataKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown, Colors.lightBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Deskripsi"),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
                      child: Text(
                        "Jadi ini merupakan aplikasi sederhana yang kita buat untuk menampilkan beberapa minuman yang biasanya ada di cafe-cafe.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
