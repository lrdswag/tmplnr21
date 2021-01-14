import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:google_fonts/google_fonts.dart';

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Center(
          child: Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                        'Sorry! An Error has occurred..',
                      style: GoogleFonts.getFont(
                          'Raleway',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.network('https://media.publit.io/file/404-page-not-found.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}