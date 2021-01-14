import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/components/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/components/contact.dart';
import 'package:flutter_app/components/error_page.dart';
import 'package:flutter_app/components/loading.dart';
import 'package:fancy_drawer/fancy_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/contact': (context) => ContactPage(),
      '/login': (context) => Login(),
    },
  ));
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: <Widget>[
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            title: Text(
              "Go to home",
              style: GoogleFonts.getFont('Raleway', fontSize: 15),
            ),
            leading: Icon(Icons.home_outlined, size: 35),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            title: Text(
              'Login',
              style: GoogleFonts.getFont('Raleway', fontSize: 15),
            ),
            leading: Icon(Icons.login_outlined, size: 35),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
            title: Text(
              "Contact Us",
              style: GoogleFonts.getFont('Raleway', fontSize: 15),
            ),
            leading: Icon(Icons.phone, size: 35),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: Text(
              "TMPLNR-20",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.network('https://media.publit.io/file/header-D.png'),
                Spacer(flex: 1),
                Card(
                  borderOnForeground: true,
                  color: Colors.white54,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          'Welcome to TeamPlanner21!',
                          style: GoogleFonts.getFont(
                            'Raleway',
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text(
                          'Mobile Rostering Application',
                          style: GoogleFonts.getFont(
                            'Raleway',
                            fontSize: 16,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Divider(),
                        Text(
                          'Take your schedule with you.',
                          style: GoogleFonts.getFont(
                            'Raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset('images/pocket.gif'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
