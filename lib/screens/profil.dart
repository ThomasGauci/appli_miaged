import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cookie.dart';
import 'login_screen.dart';
class Profil extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Profil>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  var password = "";
  var anniversaire = "";
  var adresse = "";
  var codePostal = "";
  var ville = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return new FutureBuilder(
      future: database(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return  new GFLoader(
              type: GFLoaderType.custom,
              loaderIconOne   : RichText(
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
              ),
            );
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return _profil(context, snapshot);
        }
      },
    );
  }
  @override
  Widget _profil(BuildContext context, AsyncSnapshot snapshot) {
    TextEditingController loginController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController anniversaireController = new TextEditingController();
    TextEditingController adresseController = new TextEditingController();
    TextEditingController codePostalController = new TextEditingController();
    TextEditingController villeController = new TextEditingController();
    Map<String,String> profil = snapshot.data;
    loginController.text = profil["login"];
    passwordController.text = profil["password"];
    anniversaireController.text = profil["anniversaire"];
    adresseController.text = profil["adresse"];
    codePostalController.text = profil["code"];
    villeController.text = profil["ville"];
    password = profil["password"];
    anniversaire = profil["anniversaire"];
    adresse = profil["adresse"];
    codePostal = profil["code"];
    ville = profil["ville"];

    return new Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height : 80,
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
                            child : Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text('PROFIL'),
                                      ],
                                    ),
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        _status ? _getEditIcon() : new Container(),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      readOnly: true,
                                      controller: loginController,
                                      decoration: const InputDecoration(
                                        hintText: "login",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Mot de passe',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      onChanged: (text) {
                                        password = text;
                                      },
                                      controller: passwordController,
                                      obscureText : true,
                                      decoration: const InputDecoration(
                                        hintText: "mot de passe",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Anniversaire',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      onChanged: (text) {
                                        anniversaire = text;
                                      },
                                      controller : anniversaireController,
                                      decoration: const InputDecoration(
                                          hintText: "anniversaire"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Adresse',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      onChanged: (text) {
                                        adresse = text;
                                      },
                                      controller: adresseController,
                                      decoration: const InputDecoration(
                                          hintText: "adresse"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: new Text(
                                        'Code Postal',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: new Text(
                                        'Ville',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: new TextField(
                                        onChanged: (text) {
                                          codePostal = text;
                                        },
                                        controller: codePostalController,
                                        decoration: const InputDecoration(
                                            hintText: "code postal"),
                                        enabled: !_status,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Flexible(
                                    child: new TextField(
                                      onChanged: (text) {
                                        ville = text;
                                      },
                                      controller: villeController,
                                      decoration: const InputDecoration(
                                          hintText: "ville"),
                                      enabled: !_status,
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          _status ? Container(height: 60) : new Container(),
                          _status ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    child : _decoButton(),
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushReplacement(MaterialPageRoute(
                                      builder: (context) => new LoginScreen()));
                                      },
                                  )
                                ],
                              ),
                            ),
                          ) : new Container(),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save",style: TextStyle(fontSize: 20, color: Colors.white)),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      save(adresse, ville, codePostal, anniversaire, password);
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.black,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  Widget _decoButton() {
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
        'Se déconnecter',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

Future<Map<String,String>> database() async{
  Cookie cookie = Cookie();
  Map<String,String> profil = new Map();
  Firestore.instance.collection('users').getDocuments().then((QuerySnapshot querySnapshot) {
    querySnapshot.documents.forEach((doc) {
     if(doc["user"] == cookie.userLogin){
       if(doc["password"] ==cookie.userPassword){
          profil.addAll({
            "login" : doc["user"],
            "password" : doc["password"],
            "anniversaire" : doc["anniversaire"],
            "adresse" : doc["adresse"],
            "code" : doc["code postal"],
            "ville" : doc["ville"],
          });
       }
     }
    });
  });
  await new Future.delayed(new Duration(seconds: 1));
  return profil;
}

void save(adresse, ville, code, anniversaire, password) {
  Cookie cookie = Cookie();
  Firestore.instance.collection('users').document(cookie.userId).updateData({
    'adresse': adresse,
    'anniversaire': anniversaire,
    'password': password,
    'code postal': code,
    'ville': ville,
  });
}