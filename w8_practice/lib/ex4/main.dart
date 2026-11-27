import 'package:flutter/material.dart';
import 'package:w8_practice/ex4/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const JokeList(),
    ));

class JokeList
 extends StatefulWidget {
  const JokeList
  ({
    super.key,
  });

  @override
  State<JokeList> createState() => _JokelistState();
}

class _JokelistState extends State<JokeList> {
  int? favouriteIndex = 0;
    

  void onFavoriteClick(int index) {
    setState(() {
      if (favouriteIndex == index) {
        favouriteIndex = null; 
      } else {
        favouriteIndex = index; 
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < jokes.length; i++) 
            FavoriteCard(
              title: jokes[i].title,
              description: jokes[i].description,
              isFavorite: favouriteIndex == i,
              onFavoriteClick: () => onFavoriteClick(i),
            ),
        ],
      ),
    );
  }
}
class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.title, 
    required this.description, 
    required this.isFavorite, 
    required this.onFavoriteClick, 
  });

  final String title; 
  final String description; 
  final bool isFavorite; 
  final VoidCallback onFavoriteClick; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description) 
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick, 
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border, 
                color: isFavorite ? Colors.red : Colors.grey, 
              ))
        ],
      ),
    );
  }
}
