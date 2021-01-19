import 'package:flutter/material.dart';
import 'package:travelapp/routs.dart';
import 'package:travelapp/screens/splash/splash_screen.dart';
import 'package:travelapp/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:travelapp/screens/home_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Travel UI',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF3EBACE),
//         accentColor: Color(0xFFD8ECF1),
//         scaffoldBackgroundColor: Color(0xFFF3F5F7),
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
