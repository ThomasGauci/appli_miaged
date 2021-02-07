import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cookie.dart';

class Detail extends StatelessWidget {
  final num id;
  final String taille;
  final String prix;
  final String nom;
  final String photo;
  final String marque;
  Detail({Key key,this.id, this.photo, this.nom, this.prix, this.taille, this.marque}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  _buildSuggestions(context,id,photo,nom,prix,taille,marque),
    );
  }
}
Widget _buildSuggestions(BuildContext context, num id, String photo, String nom, String prix, String taille, String marque){
  return new Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Text('Detail'),
      leading: IconButton(icon: Icon(Icons.arrow_back),
      tooltip: "Cancel and Return to List",
      onPressed: () {
        Navigator.pop(context, true);
        },
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xfffbb448), Color(0xfff7892b)])
        ),
      ),
    ),
      body: _article(context, id,photo,nom,prix,taille,marque)
    );

}

Widget _article(BuildContext context, num id, String photo, String nom, String prix, String taille, String marque){
  return Container(
    padding : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.network(photo, height: 200,
            fit:BoxFit.fill),
        Text(marque),
        Container(height: 10),
        Text(nom,style: TextStyle(fontStyle: FontStyle.italic)),
        Container(height: 10),
        Text(prix,style: TextStyle(fontWeight: FontWeight.bold)),
        Container(height: 10),
        Text(taille),
        RaisedButton(
          onPressed: () {
            // ajout de l'article au panier
            save_panier(id);
            showInSnackBar(context,"Ajout de l'article au panier");
          },
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Ajouter au panier", style: TextStyle(color: Colors.white)),
              SizedBox(width: 6),
              Icon(Icons.add_shopping_cart, color: Colors.white),
            ],
          ),
        ),
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

void showInSnackBar(BuildContext context, String value) {
  Scaffold.of(context).showSnackBar(new SnackBar(
      duration: const Duration(seconds: 2),
      content: new Text(value,textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  ));
}



