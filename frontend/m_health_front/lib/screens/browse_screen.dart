import 'package:flutter/material.dart';
// Importez d'autres packages si nécessaire

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcourir'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListView(
          children: <Widget>[
            _buildCategoryItem('Activité Physique'),
            _buildCategoryItem('Alimentation et Nutrition'),
            // Ajoutez d'autres catégories ici
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Naviguez vers l'écran de détail de la catégorie
      },
    );
  }
}
