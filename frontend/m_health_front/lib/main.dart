import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/browse_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/appointments_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application de Santé',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        // Personnalisation du thème pour BottomNavigationBar
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 30),
          selectedLabelStyle: TextStyle(fontSize: 14),
          unselectedIconTheme: IconThemeData(size: 24),
          unselectedLabelStyle: TextStyle(fontSize: 12),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BottomNavTab _selectedTab = BottomNavTab.home;

  void _onItemTapped(BottomNavTab tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    switch (_selectedTab) {
      case BottomNavTab.home:
        return HomeScreen();
      case BottomNavTab.browse:
        return BrowseScreen();
      case BottomNavTab.chat:
        return ChatScreen();
      case BottomNavTab.appointments:
        return AppointmentsScreen();
      default:
        return HomeScreen();
    }
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.extension),
          label: 'Parcourir',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Rendez-vous',
        ),
      ],
      currentIndex: _selectedTab.index,
      onTap: (index) => _onItemTapped(BottomNavTab.values[index]),
    );
  }
}

enum BottomNavTab {
  home,
  browse,
  chat,
  appointments,
}
