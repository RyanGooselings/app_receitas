import 'package:flutter/material.dart';
import 'package:receita_app/cozinhas/brasileira.dart';
import 'package:receita_app/cozinhas/italiana.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RecipeHomePage(),
        '/citaliana': (context) => ReceitasItalianas(),
        '/cbrasileira': (context) => ReceitasBrasileiras(),
        //caminhos para outras páginas, abas
      },
    );
  }
}

class RecipeHomePage extends StatefulWidget {
  @override
  _RecipeHomePageState createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  List<String> recipes = [
    "Bolo de Chocolate",
    "Lasanha",
    "Sopa de Legumes",
    //outras receitas
  ];

  List<String> filteredRecipes = [];

  void filterRecipesByCategory(String category) {
    setState(() {
      filteredRecipes = recipes.where((recipe) => recipe.contains(category)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredRecipes = recipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Categorias de Cozinha'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Italiana'),
              onTap: () {
                Navigator.pushNamed(context, '/citaliana');
              },
            ),
            ListTile(
              title: Text('Brasileira'),
              onTap: () {
                Navigator.pushNamed(context, '/cbrasileira');
              },
            ),
            //navegação
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildFeaturedRecipeCard('assets/bolo_chocolate.jpg', 'Bolo de Chocolate'),
          SizedBox(height: 20),
          _buildOtherRecipes(),
        ],
      ),
    );
  }

  Widget _buildFeaturedRecipeCard(String imagePath, String recipeName) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      height: 200,
      child: Center(
        child: Text(
          recipeName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildOtherRecipes() {
    List<Widget> recipeCards = [];

    for (int i = 0; i < recipes.length; i += 3) {
      List<Widget> rowChildren = [];
      for (int j = i; j < i + 3 && j < recipes.length; j++) {
        rowChildren.add(Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: RecipeCard(recipeName: recipes[j]),
          ),
        ));
      }
      recipeCards.add(Row(
        children: rowChildren,
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Outras Receitas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        ...recipeCards,
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String recipeName;

  RecipeCard({required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                'assets/placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              recipeName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
