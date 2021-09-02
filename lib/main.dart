import 'package:flutter/material.dart';
import 'package:flutter_app/recipeListScreen.dart';
import 'package:flutter_app/recipe_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recettes',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      /* ReccipeScreen(
        recipe: Recipe(
            "Pizza Facile",
            "Par Illyasse Guindo",
            "https://tounkalafia.com/wp-content/uploads/2019/11/GOURMANDE-02-65.jpg",
            "Dans un bol, faites un puis avec la farine, et mettez le sel d'un côté, la levure de l'autre (faites en sorte de ne pas mettre en contact le sel et la levure au démarrage) Ajoutez l'eau au centre, mélangez pour obtenir une pâte homogène, et pétrissez 10 minutes à la main sur le plan de travail ou à l'aide d'une machine à pain ou d'un robot avec le crochet pétrisseur \n Ajoutez l'huile d'olive et pétrissez encore 5 minutes \n Couvrez d'un film alimentaire au contact de la pâte, et laissez lever 1 heure à température ambiante, la pâte doit doubler de volume \n Chassez l'air de la pâte, en appuyant dessus avec la main, puis divisez la pâte en 2 ou 3 boules selon le nombre de pizzas souhaitées \n Laissez les boules de pâte reposer 30 minutes en les couvrant de film alimentairen",
            false,
            50),
      ), */
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ReccipeScreen(recipe: settings.arguments),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              /*  var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                ); */
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text("Error"),
                    centerTitle: true,
                  ),
                  body: Center(
                    child: Text("Page not Found"),
                  ),
                ));
    }
  }
}
