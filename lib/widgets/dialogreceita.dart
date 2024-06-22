import 'receitadisplay.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'tema.dart';
import 'package:receita_app/widgets/btnmkp.dart';
import 'package:receita_app/models/receitamodel.dart';

class RecipeDialogScreen extends StatelessWidget {
  const RecipeDialogScreen({
    super.key,
    required this.recipe,
    required this.actions,
    this.subheading,
  });

  final Recipe recipe;
  final List<Widget> actions;
  final Widget? subheading;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RecipeDisplayWidget(
              recipe: recipe,
              subheading: subheading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: MarketplaceTheme.spacing5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MarketplaceButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  buttonText: 'Close',
                  icon: Symbols.close,
                ),
                ...actions,
              ],
            ),
          ),
        ],
      ),
    );
  }
}