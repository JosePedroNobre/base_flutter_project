import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/constants/Styles.dart';
import '../../constants/Styles.dart';
import 'LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Spacer(),
            _buildHeader(),
            Spacer(),
            _buildLogo(),
            _buildFooter(),
          ],
        ));
  }

  Widget _buildHeader() {
    return Column(
      children: <Widget>[
        Text(
          "Money Managing",
          style: muliBold(24, Colors.black),
        ),
        SizedBox(height: 20),
        Text(
          "Saving's step by step",
          style: muliSemiBold(16, Colors.black),
        )
      ],
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset("images/human.svg");
  }

  Widget _buildFooter() {
    return Container(
      color: Color(0XFF0ff0F2935),
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            minWidth: 285,
            height: 50,
            color: Colors.white,
            child: Text(
              "Login",
              style: muliBold(13, Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
            },
          ),
          SizedBox(height: 20),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            minWidth: 285,
            height: 50,
            color: Colors.white,
            child: Text(
              "Registration",
              style: muliBold(13, Colors.black),
            ),
            onPressed: () {},
          ),
          SizedBox(height: 20),
          Text(
            "Recover password",
            style: muliBold(14, Colors.white),
          )
        ],
      ),
    );
  }
}
