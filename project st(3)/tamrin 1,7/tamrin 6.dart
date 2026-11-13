void main() {
  Map<String, double> grades = {
    'Ali': 18.5,
    'Sara': 19.0,
    'Reza': 16.75,
  };

  grades.forEach((name, grade) {
    print('$name: $grade');
  });
}
