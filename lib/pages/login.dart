import 'package:flutter/material.dart';
import 'package:hack_tx_2021/pages/distance.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './problems.dart';

import '../global.dart' as globals;

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

const AUTH0_DOMAIN = 'dev-5r1oecp1.us.auth0.com';
const AUTH0_CLIENT_ID = 'iijIw3oQoqUtz53lmDSCfFIDTO84zQvx';
const AUTH0_REDIRECT_URI = 'com.auth0.hacktx2021://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

class Profile extends StatelessWidget {
  final logoutAction;
  final String name;
  final String picture;

  Profile(this.logoutAction, this.name, this.picture);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 4.0),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(picture),
            ),
          ),
        ),
        SizedBox(height: 24.0),
        Text('Name: $name'),
        SizedBox(height: 48.0),
        ElevatedButton(
          onPressed: () {
            logoutAction();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}

class Login extends StatelessWidget {
  final loginAction;
  final String loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/image/giphy-downsized-large.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome To Space Travel",
                style: TextStyle(fontSize: 48, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  fixedSize: Size(225, 50),
                ),
                onPressed: () {
                  loginAction();
                },
                child: Text('Login', style: TextStyle(fontSize: 22)),
              ),
              Text(loginError),
            ],
          )
        ])));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool isBusy = globals.isWhat;
  bool isLoggedIn = globals.isWhat;
  String errorMessage = globals.empty;
  String name = globals.empty;
  String picture = globals.empty;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: Scaffold(
        body: Center(
          child: isBusy
              ? CircularProgressIndicator()
              : Login(loginAction, errorMessage),
          //? //Profile(logoutAction, name, picture)
          //: Login(loginAction, errorMessage),
        ),
      ),
    );
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final items = idToken.split(r'.');
    assert(items.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(items[1]))));
  }

  Future<Map> getUserDetails(String accessToken) async {
    final url = 'https://$AUTH0_DOMAIN/userinfo';

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $accessToken',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to retrieve user detail');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: 'https://$AUTH0_DOMAIN',
        scopes: ['openid', 'profile', 'offline_access'],
        promptValues: ['login'],
      ));

      final idToken = parseIdToken(result.idToken);
      final userProfile = await getUserDetails(result.accessToken);

      await secureStorage.write(
          key: 'refres_token', value: result.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = userProfile['picture'];
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DistancePage()));
      });
    } catch (e, s) {
      print('error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');

    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response.idToken);
      final profile = await getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error: $e - stack: $s');
      logoutAction();
    }
  }
}
