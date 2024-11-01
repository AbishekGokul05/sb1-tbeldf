import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final String intensity;
  final VoidCallback onTap;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.intensity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow.shade600, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.timer, color: Colors.yellow.shade600, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 24),
                  Icon(Icons.fitness_center, color: Colors.yellow.shade600, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    intensity,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}