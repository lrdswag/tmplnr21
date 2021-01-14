import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TMPLNR-21',
          style: GoogleFonts.getFont('Raleway'),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network('https://media.publit.io/file/organised.png'),
            Spacer(flex: 1),
            Center(
              child: Text(
                'Contact Us Today',
                style: GoogleFonts.getFont(
                  'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(flex: 11),
          ],
        ),
      ),
    );
  }
}