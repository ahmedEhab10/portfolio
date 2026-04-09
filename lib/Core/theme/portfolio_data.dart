class SkillModel {
  final String name;
  final String level;
  final double percent;
  const SkillModel({
    required this.name,
    required this.level,
    required this.percent,
  });
}

class ProjectModel {
  final String title;
  final String description;
  final List<String> chips;
  final String badge;
  final String? imageUrl;
  const ProjectModel({
    required this.title,
    required this.description,
    required this.chips,
    required this.badge,
    this.imageUrl,
  });
}

class PortfolioData {
  // ======= ✏️ EDIT YOUR INFO HERE =======
  static const name = 'Ahmed';
  static const role = 'Flutter Developer';
  static const location = 'Egypt';
  static const email = 'ahmed@email.com';
  static const github = 'github.com/ahmed';
  static const linkedin = 'linkedin.com/in/ahmed';
  static const heroTagline = 'Available for freelance';
  static const heroBio =
      'Passionate about building beautiful, performant mobile apps. '
      'Deep knowledge in OOP, SOLID principles, Clean Architecture, and MVVM. '
      'Turning ideas into elegant Flutter experiences.';
  static const aboutText =
      "I'm Ahmed, a Flutter developer focused on building clean, scalable mobile applications. "
      "I care deeply about code quality, architecture, and user experience.\n\n"
      "My approach is grounded in Clean Architecture and MVVM, ensuring every project "
      "is maintainable, testable, and built to last.";
  // ======================================

  static const skills = [
    SkillModel(name: 'Flutter', level: 'Advanced', percent: 0.80),
    SkillModel(name: 'Dart', level: 'Advanced', percent: 0.82),
    SkillModel(name: 'Clean Architecture', level: 'Solid', percent: 0.75),
    SkillModel(name: 'MVVM Pattern', level: 'Solid', percent: 0.75),
    SkillModel(name: 'OOP', level: 'Strong', percent: 0.88),
    SkillModel(name: 'SOLID Principles', level: 'Strong', percent: 0.85),
    SkillModel(name: 'State Management', level: 'Intermediate', percent: 0.70),
    SkillModel(name: 'REST APIs', level: 'Intermediate', percent: 0.68),
  ];

  static const projects = [
    ProjectModel(
      title: 'FitApp',
      description:
          'Working on my first production-level app. Built with Clean Architecture and MVVM for a solid, scalable foundation.',
      chips: ['Flutter', 'Dart', 'MVVM', 'Clean Arch'],
      badge: 'Coming Soon',
      imageUrl:
          'assets/images/Fit_App/Screenshot_1749059729.png', // ← حط اسم الصورة هنا
    ),
    ProjectModel(
      title: 'More Projects Loading...',
      description:
          'Actively building and learning. New projects will be showcased here as they are completed.',
      chips: ['Flutter', 'Firebase', 'REST API'],
      badge: 'In Progress',
      // imageUrl: null  ← لو مفيش صورة اتركه أو امسحه
    ),
  ];
}
