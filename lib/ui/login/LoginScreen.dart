import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:movies/bloc/UserBloc.dart';
import 'package:movies/constants/Styles.dart';
import 'package:movies/network/generic/ApiResponse.dart';
import 'package:movies/network/generic/NetworkDefaults.dart';
import 'package:movies/ui/main/MainPage.dart';
import 'package:movies/utils/LoadingModal.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = true;
  UserBloc userBloc;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc();
    setApiCallsListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFFF8F8F8),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Welcome Screen",
                      style: muliBold(17, Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 100),
              child: Row(
                children: <Widget>[
                  Text(
                    "Log In ! ",
                    style: muliBold(30, Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            _buildInputFieldUsername(),
            SizedBox(height: 20),
            _buildInputFieldPassword(),
            SizedBox(height: 30),
            _buildLoginButton()
          ],
        ));
  }

  Widget _buildInputFieldUsername() {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: new Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 35),
                  hintStyle: muliBold(16, Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintText: "jonhdoe@random.com"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputFieldPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 170),
      child: new Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: new InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  contentPadding: const EdgeInsets.only(left: 35),
                  hintStyle: muliBold(16, Colors.grey),
                  hintText: "Password"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          ),
          minWidth: 200,
          height: 65,
          color: Color(0xff0F2935),
          child: Text(
            "Let's Save !",
            style: muliBold(16, Colors.white),
          ),
          onPressed: () {
            userBloc.authenticateUser(
                emailController.text, passwordController.text);
          },
        ),
      ],
    );
  }

  // API
  setApiCallsListeners() {
    userBloc.authenticationUser.listen((data) async {
      switch (data.status) {
        case Status.LOADING:
          Navigator.of(context).push(LoadingModal());
          break;
        case Status.ERROR:
          Navigator.of(context).pop();
          break;
        case Status.COMPLETED:
          Navigator.of(context).pop();
          await saveSharedPreferences(data.data.token);
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => MainPage()));
          break;
        default:
      }
    });
  }

  saveSharedPreferences(String token) async {
    await NetworkDefaults.setToken("Bearer" + " " + token);
  }
}
