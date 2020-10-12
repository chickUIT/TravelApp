import 'package:flutter/material.dart';
import 'package:workoutapp/classes/language.dart';
import 'package:workoutapp/localization/demolocalization.dart';
import 'package:workoutapp/main.dart';
import 'package:workoutapp/routes/route_name.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'fr':
        _temp = Locale(language.languageCode, 'FR');
        break;
      case 'ja':
        _temp = Locale(language.languageCode, 'JP');
        break;
      case 'vi':
        _temp = Locale(language.languageCode, 'VN');
        break;
      case 'zh':
        _temp = Locale(language.languageCode, 'CN');
        break;
    }

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(context),
      appBar: AppBar(
        title: Center(
          child: Text(
            DemoLocalization.of(context).getTranslateValue('home_page'),
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.LanguageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          children: <Widget>[
                            Text(lang.name),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Text(
          DemoLocalization.of(context).getTranslateValue('Hello'),
          style: TextStyle(fontSize: 50),
        )),
      ),
    );
  }

  Container _drawerList(BuildContext context) {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo_cat.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'About us',
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'Setting',
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingRoute);
            },
          ),
        ],
      ),
    );
  }
}
