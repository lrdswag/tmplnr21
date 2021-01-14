import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        padding: EdgeInsets.zero,
          child: Card(
            child: Column(
              children: [
                Spacer(flex: 2),
                Center(
                  child: Text(
                      'Login Below',
                    style: GoogleFonts.getFont(
                        'Raleway',
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(flex: 2),
                Row(
                  children: [
                    SizedBox(
                      width: 380,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(Icons.mail_outline_outlined),
                          hintText: 'Please type your email address',
                          labelText: 'Email',
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 380,
                      child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.lock_outline),
                        hintText: 'Please type you password',
                        labelText: 'Password',
                      ),
                    ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
                        )
                      ],
                    ),
                    RaisedButton(onPressed: () {
                    },
                      color: Colors.green,
                      child: Text(
                          'Login',
                        style: GoogleFonts.getFont(
                          'Raleway',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 5),
              ],
            ),
          ),
      ),
    );
  }
}
