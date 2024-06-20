import 'package:flutter/material.dart';

class ReceitasItalianas extends StatelessWidget {
  final List<String> italianRecipes = [
    "Pizza Margherita",
    "Pasta Carbonara",
    "Tiramisu",
    //receitas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas Italianas'),
      ),
      body: ListView(
        children: _buildRecipeCards(italianRecipes),
      ),
    );
  }

  List<Widget> _buildRecipeCards(List<String> recipes) {
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

    return recipeCards;
  }
}

class RecipeCard extends StatelessWidget {
  final String recipeName;

  RecipeCard({required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
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
      ),
    );
  }
}
