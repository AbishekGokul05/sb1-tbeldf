import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.title.toUpperCase()),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              border: Border(
                bottom: BorderSide(color: Colors.yellow.shade600),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWorkoutInfo(Icons.timer, workout.duration),
                _buildWorkoutInfo(Icons.fitness_center, workout.intensity),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: workout.exercises.length,
              itemBuilder: (context, index) {
                final exercise = workout.exercises[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade600,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      exercise.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                    subtitle: Text(
                      '${exercise.sets} sets x ${exercise.reps} reps',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Start workout
        },
        backgroundColor: Colors.yellow,
        label: const Text(
          'START WORKOUT',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.play_arrow, color: Colors.black),
      ),
    );
  }

  Widget _buildWorkoutInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.yellow),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}