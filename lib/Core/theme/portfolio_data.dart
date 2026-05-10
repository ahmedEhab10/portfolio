class SkillModel {
  final String name;
  final String icon;
  final String level;
  final double percent;
  const SkillModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.percent,
  });
}

class ProjectModel {
  final String title;
  final String description;
  final List<String> chips;
  final String badge;
  final List<String> images;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> features;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.chips,
    required this.badge,
    this.images = const [],
    this.githubUrl,
    this.liveUrl,
    this.features = const [],
  });
}

class PortfolioData {
  // ======= ✏️ PERSONAL INFO =======
  static const name = 'Ahmed Ehab';
  static const firstName = 'Ahmed';
  static const role = 'Flutter Developer';
  static const location = 'Egypt';
  static const email = 'ahmedhobaa24@gmail.com';
  static const github = 'https://github.com/ahmedEhab10';
  static const linkedin = 'https://www.linkedin.com/in/ahmed-ehab-63389730a/';
  static const profileImage = 'assets/images/My_photo/my_photo.jpg';
  static const cvPath = 'assets/pdf/Ahmed_Ehab_El-Badry_flutter_devloper3.pdf';
  // =================================

  static const heroTagline = 'Available for freelance';
  static const heroBio =
      'Passionate about building beautiful, performant mobile apps. '
      'Deep knowledge in OOP, SOLID principles, Clean Architecture, and MVVM. '
      'Turning ideas into elegant Flutter experiences.';

  static const aboutText =
      "I'm Ahmed Ehab, a Flutter developer focused on building clean, scalable mobile applications. "
      "I care deeply about code quality, architecture, and user experience.\n\n"
      "My approach is grounded in Clean Architecture and MVVM, ensuring every project "
      "is maintainable, testable, and built to last.";
  // =================================

  static const skills = [
    SkillModel(name: 'Flutter', icon: '📱', level: 'Advanced', percent: 0.80),
    SkillModel(name: 'Dart', icon: '🎯', level: 'Advanced', percent: 0.82),
    SkillModel(
      name: 'Clean Architecture',
      icon: '🏗️',
      level: 'Solid',
      percent: 0.75,
    ),
    SkillModel(name: 'MVVM Pattern', icon: '🔄', level: 'Solid', percent: 0.75),
    SkillModel(name: 'OOP', icon: '⚡', level: 'Strong', percent: 0.88),
    SkillModel(
      name: 'SOLID Principles',
      icon: '🧩',
      level: 'Strong',
      percent: 0.85,
    ),
    SkillModel(
      name: 'State Management',
      icon: '🔀',
      level: 'Intermediate',
      percent: 0.70,
    ),
    SkillModel(
      name: 'REST APIs',
      icon: '🌐',
      level: 'Intermediate',
      percent: 0.68,
    ),
  ];

  static const projects = [
    ProjectModel(
      title: 'FitApp',
      description:
          'A production-level fitness app built with Clean Architecture and MVVM. '
          'Features workout tracking, progress analytics, nutrition planning, and community challenges.',
      chips: ['Flutter', 'Dart', 'MVVM', 'Clean Arch', 'Hive', 'BLoC'],
      badge: 'Featured',
      githubUrl: 'https://github.com/ahmedEhab10/FitApp',
      features: [
        'Workout tracking with custom exercises',
        'Progress analytics & statistics',
        'Nutrition planning & calorie tracking',
        'Weekly challenges system',
        'Articles & fitness tips',
        'Clean Architecture with MVVM pattern',
      ],
      images: [
        'assets/images/Fit_App/Screenshot_1749059729.png',
        'assets/images/Fit_App/Screenshot_1749059767.png',
        'assets/images/Fit_App/Screenshot_1749059781.png',
        'assets/images/Fit_App/Screenshot_1749059816.png',
        'assets/images/Fit_App/Screenshot_1749059843.png',
        'assets/images/Fit_App/Screenshot_1749059847.png',
        'assets/images/Fit_App/Screenshot_1749059858.png',
        'assets/images/Fit_App/Screenshot_1749059868.png',
        'assets/images/Fit_App/Screenshot_1749059901.png',
        'assets/images/Fit_App/Screenshot_1749059907.png',
        'assets/images/Fit_App/Screenshot_1749059963.png',
        'assets/images/Fit_App/Screenshot_1749059981.png',
        'assets/images/Fit_App/Screenshot_1749060004.png',
        'assets/images/Fit_App/Screenshot_1749060034.png',
      ],
    ),
    ProjectModel(
      title: 'Hobix Tracker',
      description:
          'An offline-first fitness tracking application built with Flutter using Clean Architecture and BLoC. '
          'Designed to help users organize workout routines, track body progress, and monitor gym performance with a structured and scalable system.',
      chips: ['Flutter', 'Dart', 'Clean Arch', 'BLoC', 'Hive', 'GetIt'],
      badge: 'Featured',
      githubUrl: 'https://github.com/ahmedEhab10/gym_tracker',
      features: [
        'Weekly workout scheduling system',
        'Track exercises, sets, reps, and weights',
        'Workout history & progress monitoring',
        'Body measurements and statistics comparison',
        'Offline-first architecture using Hive local database',
        'Personalized onboarding & user profile setup',
        'Animated and responsive modern UI',
        'BLoC & Cubit state management',
        'Reusable scalable Clean Architecture structure',
        'Exercise details with explanations and tracking',
      ],
      images: [
        'assets/images/Hobix_Tracker/Screen1.png',
        'assets/images/Hobix_Tracker/Screen2.png',
        'assets/images/Hobix_Tracker/Screen3.png',
        'assets/images/Hobix_Tracker/Screen4.png',
        'assets/images/Hobix_Tracker/Screen5.png',
        'assets/images/Hobix_Tracker/Screen6.png',
        'assets/images/Hobix_Tracker/Screen7.png',
      ],
    ),
    ProjectModel(
      title: 'More Projects Loading...',
      description:
          'Actively building and learning. New projects will be showcased here as they are completed.',
      chips: ['Flutter', 'Firebase', 'REST API'],
      badge: 'In Progress',
    ),
  ];
}
