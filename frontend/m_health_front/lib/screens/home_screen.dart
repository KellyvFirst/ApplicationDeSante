import 'package:flutter/material.dart';
// Importez d'autres packages si nécessaire

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résumé'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context)
              .colorScheme
              .primaryContainer, // Définir la couleur ici
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionTitle('Aujourd\'hui'),
              // Ici, vous pouvez utiliser FutureBuilder ou une autre méthode pour charger les données
              _buildSummaryToday(),

              _buildSectionTitle('7 Derniers Jours'),
              _buildSummaryWeek(),

              _buildSectionTitle('12 Derniers Mois'),
              _buildSummaryYear(),

              _buildSectionTitle('Plus Ancien'),
              _buildOlderDataPicker(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSummaryToday() {
    // Implémentez la logique pour afficher le résumé d'aujourd'hui
    return Container(); // Remplacez par votre widget
  }

  Widget _buildSummaryWeek() {
    // Implémentez la logique pour afficher le résumé de la semaine
    return Container(); // Remplacez par votre widget
  }

  Widget _buildSummaryYear() {
    // Implémentez la logique pour afficher le résumé de l'année
    return Container(); // Remplacez par votre widget
  }

  Widget _buildOlderDataPicker() {
    // Implémentez un sélecteur de date pour les données plus anciennes
    return Container(); // Remplacez par votre widget
  }
}
