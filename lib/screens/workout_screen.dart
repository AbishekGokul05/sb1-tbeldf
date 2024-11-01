import 'package:flutter/material.dart';
import '../widgets/workout_card.dart';
import '../models/workout.dart';
import 'workout_detail_screen.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  List<Workout> get _workouts => [
        Workout(
          id: '1',
          title: 'Full Body Beast',
          duration: '45 min',
          intensity: 'High',
          exercises: [
            Exercise(
              name: 'Burpees',
              sets: 3,
              reps: 15,
              imageUrl: 'assets/burpees.png',
            ),
            Exercise(
              name: 'Push-ups',
              sets: 4,
              reps: 20,
              imageUrl: 'assets/pushups.png',
            ),
            Exercise(
              name: 'Squats',
              sets: 4,
              reps: 25,
              imageUrl: 'assets/squats.png',
            ),
          ],
        ),
        Workout(
          id: '2',
          title: 'Core Crusher',
          duration: '30 min',
          intensity: 'Medium',
          exercises: [
            Exercise(
              name: 'Plank',
              sets: 3,
              reps: 60,
              imageUrl: 'assets/plank.png',
            ),
            Exercise(
              name: 'Crunches',
              sets: 3,
              reps: 30,
              imageUrl: 'assets/crunches.png',
            ),
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WORKOUTS',
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _workouts.length,
        itemBuilder: (context, index) {
          final workout = _workouts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: WorkoutCard(
              title: workout.title,
              duration: workout.duration,
              intensity: workout.intensity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailScreen(workout: workout),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new workout
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}