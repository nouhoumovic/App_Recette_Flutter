import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recettes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Mes Recettes"),
        ),
        body: ListView(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              //    image: 'images/pizza.png',
              image:
                  'https://tounkalafia.com/wp-content/uploads/2019/11/GOURMANDE-02-65.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
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

  Container descriptionSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        "Dans un bol, faites un puis avec la farine, et mettez le sel d'un côté, la levure de l'autre (faites en sorte de ne pas mettre en contact le sel et la levure au démarrage) Ajoutez l'eau au centre, mélangez pour obtenir une pâte homogène, et pétrissez 10 minutes à la main sur le plan de travail ou à l'aide d'une machine à pain ou d'un robot avec le crochet pétrisseur \n Ajoutez l'huile d'olive et pétrissez encore 5 minutes \n Couvrez d'un film alimentaire au contact de la pâte, et laissez lever 1 heure à température ambiante, la pâte doit doubler de volume \n Chassez l'air de la pâte, en appuyant dessus avec la main, puis divisez la pâte en 2 ou 3 boules selon le nombre de pizzas souhaitées \n Laissez les boules de pâte reposer 30 minutes en les couvrant de film alimentairen",
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
                      "Pizza Facile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(
                    "Par Guindo",
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text("55")
          ],
        ),
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
