import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cookie.dart';

class Panier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  _buildSuggestions(context),
    );
  }
}
Widget _buildSuggestions(BuildContext context){
  return new FutureBuilder(
    future: database(context),
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
            return Column(
                children: [
                new Expanded(
                  child:createListView(context, snapshot)
                  ),
                  Container(height: 10),
                Container(
                    width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                      child: Text("Prix total du panier : " + cookie.prixTotal.toString() + " €", style: TextStyle(fontSize: 20, color: Colors.white),textAlign: TextAlign.center)
                    )
                ],
            );

      }
    },
  );
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  List<Widget> values = snapshot.data;
  return new ListView.builder(
    itemCount: values.length,
    itemBuilder: (BuildContext context, int index) {
      return values[index];
    },
  );
}

Widget _article(BuildContext context, num id, String photo, String nom, String prix, String taille, String docId){
  return Container(
    padding : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(photo, height: 100,
            fit:BoxFit.fill),
        Column(
          children: [
            Text(nom,style: TextStyle(fontStyle: FontStyle.italic)),
            Container(height: 10),
            Text(prix,style: TextStyle(fontWeight: FontWeight.bold)),
            Container(height: 10),
            Text(taille),
          ],
        ),
        FlatButton(
            onPressed: () {
              // suppression de l'article du panier
              supp_panier(docId);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Panier()),
              );
            },
            color: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Column (
              children: <Widget>[
                Icon(Icons.delete),
              ],
            )
        ),
      ],
    ),
  );
}

void supp_panier(String id){
  Cookie cookie = Cookie();
  Firestore.instance.collection('users').document(cookie.userId).collection('panier').document(id).delete();
}

Future<List<Widget>> database(BuildContext context) async{
  List<Widget> articles = new List();
  List<num> idsPanier = new List();
  Map<num,String> idsDocPanier = new Map();
  Firestore.instance.collection('users').document(cookie.userId).collection('panier').getDocuments().then((QuerySnapshot querySnapshot) {
    querySnapshot.documents.forEach((doc) {
      var id = doc["id"];
      var docId = doc.documentID;
      idsPanier.add(id);
      idsDocPanier[id]= docId;
    });
  });
  await new Future.delayed(new Duration(seconds: 5));
  cookie.prixTotal = 0;
  Firestore.instance.collection('articles').getDocuments().then((QuerySnapshot querySnapshot) {
    idsPanier.forEach((element) {
      querySnapshot.documents.forEach((doc) {
        if(element == doc["id"]){
          var docId = "";
          idsDocPanier.forEach((key, value) {
            if(key == element){
              docId = value;
            }
          });
          var id = doc["id"];
          var nom = doc["nom"];
          var photo = doc["photo"];
          var prix = doc["prix"].toString() + " €";
          var taille = doc["taille"];
          cookie.prixTotal = cookie.prixTotal + doc["prix"];
          articles.add(_article(context, id,photo,nom,prix.toString(),taille,docId));
        }
      });
    });
  });
  await new Future.delayed(new Duration(seconds: 5));
  return articles;
}
