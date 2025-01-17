import 'package:flutter/material.dart';
import 'package:roshambo/config/Utils.dart';
import 'package:roshambo/config/assets.dart';
import 'package:roshambo/config/auth_repository.dart';
import 'package:roshambo/config/constants.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/game_online.dart';
import 'package:roshambo/widgets/responsive_widget.dart';

var auth = Auth();

class AuthPage extends StatefulWidget{
  //final AuthDelegate auth;
  //const AuthPage({Key key, this.auth}) : super(key: key);

  createState() => AuthPageState();
}
class AuthPageState extends State<AuthPage> {
  var mode = FormMode.AUTH_LOGIN;
  TextStyle style = TextStyle(fontSize: 20.0);

  void startGameOnline(){
    Navigator.of(context).pop();
    Utils().newPage(context, GamePageOnline());
  }
  void signUpOrInState(){
    setState(() {
      if(mode == FormMode.AUTH_LOGIN)
        mode = FormMode.AUTH_SIGN_UP;
        else
        mode = FormMode.AUTH_LOGIN;
    });
  }

  @override
  void initState() {
    if(auth.getCurrentUser() != null){
      //startGameOnline();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
  final emailField = TextField(
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: S.of(context).authHintEmail,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final passwordField = TextField(
    obscureText: true,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: S.of(context).authHintPassword,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final signInButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xff01A0C7),
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {
        if(mode == FormMode.AUTH_LOGIN){
          auth.signInEmail(emailField.controller.text, passwordField.controller.text);
        } else{
          auth.signUpEmail(emailField.controller.text, passwordField.controller.text);
        }
      },
      child: Text(mode == FormMode.AUTH_LOGIN ? S.of(context).authSignIn : S.of(context).authSignUp,
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );

  Widget signUpOrIn(double fontSize){
  return InkWell(
  onTap: ()=> signUpOrInState(),
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Text(mode == FormMode.AUTH_LOGIN ? S.of(context).authAccountSignUp : S.of(context).authAccountSignIn, style: TextStyle(fontSize: fontSize),),),
  );
  }

  Widget authView(double iconSizeBox, double fontSize) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(child: Text(S
              .of(context)
              .title, textAlign: TextAlign.center,),),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: iconSizeBox,
                      child: Image.asset(
                        Assets.choiceHands,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    signInButton,
                    SizedBox(
                      height: 15.0,
                    ),
                    signUpOrIn(fontSize)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  //iconSizeBox = 155
    return ResponsiveWidget(
      largestScreen: authView(210, 36),
      largeScreen: authView(155, 24,),
      mediumScreen: authView(100, 20,),
      smallScreen: authView(75, 16,),
      smallestScreen: authView(50, 12),
    );
  }
}