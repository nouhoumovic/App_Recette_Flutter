import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/favoriteChangeNotifier.dart';
import 'package:flutter_app/favoriteWidget.dart';
import 'package:flutter_app/recipe.dart';
import 'package:provider/provider.dart';

class ReccipeScreen extends StatelessWidget {
  final Recipe recipe;
  const ReccipeScreen({Key key, @required this.recipe}) : super(key: key);

  Container descriptionSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );
  }

  Container buttonSection() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(Colors.indigo, Icons.comment, "COMMENT "),
            _buildButtonColumn(Colors.indigo, Icons.share, "SHARE ")
          ],
        ),
      ),
    );
  }

  Container titlesection() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      recipe.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(
                    recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                ],
              ),
            ),
            FavoriteIconWidget(),
            FavoriteTextWidget(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mes Recettes"),
        ),
        body: ListView(
          children: [
            /*  FadeInImage.assetNetwork(
                placeholder: "images/loading.gif",
                //    image: 'images/pizza.png',
                image:
                    'https://tounkalafia.com/wp-content/uploads/2019/11/GOURMANDE-02-65.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ), */
            Hero(
              tag: "imageRecipe" + recipe.title,
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: recipe.imageUrl,
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            titlesection(),
            buttonSection(),
            descriptionSection()
          ],
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: color),
        )
      ],
    );
  }
}
