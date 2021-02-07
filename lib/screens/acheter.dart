import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cookie.dart';
import 'detail.dart';

class Acheter extends StatelessWidget {
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
              return createListView(context, snapshot);
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
  Widget _article(BuildContext context, num id, String photo, String nom, String prix, String taille, String marque){
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
              // ouvre le detail d'un article
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail(id: id ,photo: photo, nom: nom, prix: prix, taille: taille, marque: marque)),
              );
            },
            color: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Column (
              children: <Widget>[
                Icon(Icons.search),
              ],
            )
        ),
        /*
        FlatButton(
          onPressed: () {
            // ajout de l'article au panier
            save_panier(id);
          },
            color: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Column (
            children: <Widget>[
              Icon(Icons.add_shopping_cart),
            ],
          )
        ),*/
      ],
    ),
  );
  }

void save_panier(num id){
  Cookie cookie = Cookie();
  Firestore.instance.collection('users').document(cookie.userId).collection('panier').add({
    'id':id
  });
}

Future<List<Widget>> database(BuildContext context) async{
  List<Widget> articles = new List();
  Firestore.instance.collection('articles').getDocuments().then((QuerySnapshot querySnapshot) {
    querySnapshot.documents.forEach((doc) {
      var id = doc["id"];
      var nom = doc["nom"];
      var photo = doc["photo"];
      var prix = doc["prix"].toString() + " €";
      var taille = doc["taille"];
      var marque = doc["marque"];
      articles.add(_article(context,id,photo,nom,prix.toString(),taille,marque));
    });
  });
  await new Future.delayed(new Duration(seconds: 5));
  return articles;
}

