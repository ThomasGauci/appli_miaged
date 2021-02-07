import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Market extends StatefulWidget {

  @override
  _MarketState createState() => _MarketState();

}
// A FAIRE = market, panier, profil , refléchir pour créer les pages
class _MarketState extends State<Market> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Acheter',
      style: optionStyle,
    ),
    Text(
      'Index 2: Panier',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildSuggestions(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.euro),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildRow(){
    return ListTile(
      leading: FlutterLogo(),
      title: Text("test market"),
      onTap: () {
        setState(() {
        });
      },
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder
      (
        itemBuilder: (BuildContext ctxt, int index) {
          return _buildRow(); // return the view for each items of the listview
        }
    );
  }
}


