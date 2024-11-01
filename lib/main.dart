import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/workout_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const GearUpApp());
}

class GearUpApp extends StatelessWidget {
  const GearUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gear Up',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.yellow,
          secondary: Colors.yellow.shade600,
          background: Colors.black,
          surface: Colors.grey.shade900,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.yellow,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
          elevation: 4,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.grey.shade900,
          indicatorColor: Colors.yellow,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.yellow),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _screens = [
    const HomeScreen(),
    const WorkoutScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.yellow),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center, color: Colors.yellow),
            label: 'Workouts',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.yellow),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}