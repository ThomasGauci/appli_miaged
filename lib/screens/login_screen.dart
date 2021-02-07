import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'mainScreen.dart';
import 'market.dart';
import 'cookie.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  String user = "";
  String pwd = "";
  bool connexion = false;

  // Permet de créer le champ d'écriture pour l'utilisateur si c'est un mot de passe on ne l'affiche pas
  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          // textEditingController a remplacer
          TextField(
            onChanged: (text) {
              if(isPassword){
                pwd = text;
              } else {
                user = text;
              }
            },
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Se connecter',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'M',
          style: GoogleFonts.portLligatSans(
            textStyle: TextStyle(color : Colors.black87),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: 'IA',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
            TextSpan(
              text: 'GED',
              style: TextStyle(color: Colors.black87, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _loginPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Login"),
        _entryField("Password", isPassword: true),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return new WillPopScope(
        onWillPop: () async => false,
        child:Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
            title: Text('MIAGED'),
              flexibleSpace: Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Color(0xfffbb448), Color(0xfff7892b)])
              ),
            ),
          ),
          body: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(),
                        SizedBox(height: 50),
                        _loginPasswordWidget(),
                        SizedBox(height: 20),
                        InkWell(
                          child : _submitButton(),
                          onTap: () {
                           database(user, pwd);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void database(String user, String pwd) async{
    Cookie cookie = new Cookie();
    Firestore.instance.collection('users').getDocuments().then((QuerySnapshot querySnapshot) {
      querySnapshot.documents.forEach((doc) {
        if(doc["user"] == user){
          if(doc["password"] == pwd){
            connexion = true;
            cookie.userLogin = user;
            cookie.userPassword = pwd;
            cookie.userId = doc.documentID;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          } else {
            connexion = false;
          }
        }
      });
    });
  }
}