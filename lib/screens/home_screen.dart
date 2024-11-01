import 'package:flutter/material.dart';
import '../widgets/workout_card.dart';
import '../widgets/stats_card.dart';
import '../models/workout.dart';
import 'workout_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todayWorkout = Workout(
      id: 'daily',
      title: 'Power Hour',
      duration: '60 min',
      intensity: 'High',
      exercises: [
        Exercise(
          name: 'Mountain Climbers',
          sets: 3,
          reps: 20,
          imageUrl: 'assets/climbers.png',
        ),
        Exercise(
          name: 'Deadlifts',
          sets: 4,
          reps: 12,
          imageUrl: 'assets/deadlifts.png',
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GEAR UP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'READY TO GEAR UP?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade600,
              ),
            ),
            const SizedBox(height: 20),
            const StatsCard(),
            const SizedBox(height: 20),
            Text(
              'TODAY\'S CHALLENGE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            WorkoutCard(
              title: todayWorkout.title,
              duration: todayWorkout.duration,
              intensity: todayWorkout.intensity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailScreen(workout: todayWorkout),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'RECENT WORKOUTS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(Icons.fitness_center, color: Colors.yellow.shade600),
                    title: const Text('Beast Mode Workout'),
                    subtitle: Text('Completed ${index + 1} days ago'),
                    trailing: Text(
                      '${(index + 1) * 100} cal',
                      style: TextStyle(color: Colors.yellow.shade600),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}