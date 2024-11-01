class Workout {
  final String id;
  final String title;
  final String duration;
  final String intensity;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.title,
    required this.duration,
    required this.intensity,
    required this.exercises,
  });
}

class Exercise {
  final String name;
  final int sets;
  final int reps;
  final String imageUrl;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.imageUrl,
  });
}