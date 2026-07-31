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
  static const profileImage = 'assets/assets/images/My_photo/my_photo.jpg';
  static const cvPath =
      'assets/assets/pdf/Ahmed_Ehab_El-Badry_flutter_devloper3.pdf';
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
        'assets/assets/images/Fit_App/Screenshot_1749059729.png',
        'assets/assets/images/Fit_App/Screenshot_1749059767.png',
        'assets/assets/images/Fit_App/Screenshot_1749059781.png',
        'assets/assets/images/Fit_App/Screenshot_1749059816.png',
        'assets/assets/images/Fit_App/Screenshot_1749059843.png',
        'assets/assets/images/Fit_App/Screenshot_1749059847.png',
        'assets/assets/images/Fit_App/Screenshot_1749059858.png',
        'assets/assets/images/Fit_App/Screenshot_1749059868.png',
        'assets/assets/images/Fit_App/Screenshot_1749059901.png',
        'assets/assets/images/Fit_App/Screenshot_1749059907.png',
        'assets/assets/images/Fit_App/Screenshot_1749059963.png',
        'assets/assets/images/Fit_App/Screenshot_1749059981.png',
        'assets/assets/images/Fit_App/Screenshot_1749060004.png',
        'assets/assets/images/Fit_App/Screenshot_1749060034.png',
      ],
    ),

    ProjectModel(
      title: 'StudyFlow',
      description:
          'A student-focused study assistant built with Flutter using feature-first Clean Architecture and BLoC/Cubit. '
          'Helps students organize subjects, upload PDFs, manage notes and tasks, run timed study sessions, '
          'and track academic momentum through streaks, a study calendar, and a full analytics dashboard.',
      chips: [
        'Flutter',
        'Dart',
        'Clean Arch',
        'BLoC',
        'Hive',
        'SharedPrefs',
        'fl_chart',
        'Provider',
      ],
      badge: 'Featured',
      githubUrl: 'https://github.com/ahmedEhab10/study_flow',
      features: [
        'Onboarding and profile setup flow saved via SharedPreferences',
        'Splash screen with animated branding and conditional routing',
        'Main layout with custom bottom navigation and animated tab switching',
        'Home dashboard with daily streak, task completion stats, and bento-style subject grid',
        'Subject management with add/delete, custom painted icons, and progress tracking',
        'Subject details with PDF upload, note creation, and course completion progress',
        'PDF pipeline with 25 MB validation, local storage via path_provider, and open_filex',
        'Expandable note cards with smooth collapse/expand animation',
        'Study session screen with singleton timer, goal presets, and animated progress rings',
        'Study records saved to Hive and linked to subjects for calendar and analytics',
        'Task planner with today/tomorrow/completed sections and swipe-to-delete',
        'Study Calendar with streak grid, monthly heatmap, and day-detail cards',
        'Progress dashboard with weekly bar chart, subject donut chart, and trend line using fl_chart',
        'Per-subject analytics with live day streak and weekly progress comparison',
        'Light and dark Material 3 themes with ThemeProvider toggle',
        'Lottie-powered empty states and polished micro-interactions',
      ],
      images: [
        'assets/assets/assets/images/Study_flow/Screen1.png',
        'assets/assets/assets/images/Study_flow/Screen2.png',
        'assets/assets/assets/images/Study_flow/Screen3.png',
        'assets/assets/assets/images/Study_flow/Screen4.png',
        'assets/assets/assets/images/Study_flow/Screen5.png',
        'assets/assets/assets/images/Study_flow/Screen6.png',
        'assets/assets/assets/images/Study_flow/Screen7.png',
        'assets/assets/assets/images/Study_flow/Screen8.png',
        'assets/assets/assets/images/Study_flow/Screen9.png',
        'assets/assets/assets/images/Study_flow/Screen10.png',
        'assets/assets/assets/images/Study_flow/Screen11.png',
        'assets/assets/assets/images/Study_flow/Screen12.png',
        'assets/assets/assets/images/Study_flow/Screen13.png',
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
        'assets/assets/images/Hobix_Tracker/Screen1.png',
        'assets/assets/images/Hobix_Tracker/Screen2.png',
        'assets/assets/images/Hobix_Tracker/Screen3.png',
        'assets/assets/images/Hobix_Tracker/Screen4.png',
        'assets/assets/images/Hobix_Tracker/Screen5.png',
        'assets/assets/images/Hobix_Tracker/Screen6.png',
        'assets/assets/images/Hobix_Tracker/Screen7.png',
      ],
    ),

    ProjectModel(
      title: 'Route E-Commerce App',
      description:
          'A full-featured e-commerce application built with Flutter using Clean Architecture and BLoC/Cubit state management. '
          'The app integrates with a REST API using Dio to handle authentication, product browsing, categories, brands, wishlist, cart operations, and responsive shopping flows.',
      chips: [
        'Flutter',
        'Dart',
        'Clean Arch',
        'BLoC',
        'Dio',
        'REST API',
        'SharedPrefs',
      ],
      badge: 'Featured',
      githubUrl: 'https://github.com/ahmedEhab10/ecommerce-app',
      features: [
        'User authentication with login and registration flows',
        'Token persistence using SharedPreferences',
        'REST API integration with Dio for products, cart, wishlist, categories, and brands',
        'Clean Architecture structure with data, domain, and presentation layers',
        'BLoC/Cubit state management for auth, products, cart, favorites, categories, and brands',
        'Home screen with promotional carousel, dynamic categories, and brand sections',
        'Product catalog grid with category-based filtering support',
        'Product details screen with image slider, rating, sold count, description, size, color, and quantity selection',
        'Add-to-cart flow with loading, success, and error feedback',
        'Cart management with item listing, quantity updates, product deletion, and total price display',
        'Wishlist system with add/remove favorite products and local Cubit state syncing',
        'Reusable UI components, validators, app resources, custom buttons, product cards, and responsive sizing',
        'Profile screen UI with editable user information fields',
        'Native splash screen and branded visual assets',
      ],
      images: [
        'assets/assets/assets/images/E_Commerce/Screen1.png',
        'assets/assets/assets/images/E_Commerce/Screen2.png',
        'assets/assets/assets/images/E_Commerce/Screen3.png',
        'assets/assets/assets/images/E_Commerce/Screen4.png',
        'assets/assets/assets/images/E_Commerce/Screen5.png',
        'assets/assets/assets/images/E_Commerce/Screen6.png',
        'assets/assets/assets/images/E_Commerce/Screen7.png',
        'assets/assets/assets/images/E_Commerce/Screen8.png',
      ],
    ),

    ProjectModel(
      title: 'Movies App',
      description:
          'A comprehensive movie discovery application built with Flutter using Clean Architecture and BLoC. '
          'Designed to allow users to browse movies by genre, search for titles, view detailed movie information including cast, and manage a personalized profile with a watchlist and viewing history.',
      chips: ['Flutter', 'Dart', 'Clean Arch', 'BLoC', 'Dio', 'REST API'],
      badge: 'App',
      githubUrl: 'https://github.com/ahmedEhab10/Movies_app',
      features: [
        'Secure authentication system (Login & Registration)',
        'Dynamic home screen with featured movie carousels',
        'Explore and filter movies by various genres',
        'Real-time search functionality for discovering specific movies',
        'Detailed movie pages including cast information and related suggestions',
        'Personalized user profile to track watchlist and viewing history',
        'Scalable Clean Architecture structure separating domain, data, and presentation',
        'Robust state management using BLoC & Cubit',
        'API integration using Dio for seamless remote data fetching',
        'Responsive modern UI with custom animations and onboarding flow',
      ],
      images: [
        'assets/assets/images/Movies_app/Screen1.png',
        'assets/assets/images/Movies_app/Screen2.png',
        'assets/assets/images/Movies_app/Screen3.png',
        'assets/assets/images/Movies_app/Screen4.png',
        'assets/assets/images/Movies_app/Screen5.png',
        'assets/assets/images/Movies_app/Screen6.png',
        'assets/assets/images/Movies_app/Screen7.png',
        'assets/assets/images/Movies_app/Screen8.png',
        'assets/assets/images/Movies_app/Screen9.png',
        'assets/assets/images/Movies_app/Screen10.png',
        'assets/assets/images/Movies_app/Screen11.png',
      ],
    ),

    ProjectModel(
      title: 'Evently App',
      description:
          'Evently is an application for organizing parties and daily events, built using Flutter, Firebase, and Clean Architecture, Google Maps, and BLoC. '
          'Designed to allow people to showcase their events and invite others, while also showing the event\'s location on a map.',
      chips: [
        'Flutter',
        'Dart',
        'Clean Arch',
        'BLoC',
        'Firebase',
        'Google Maps',
        'Themes',
      ],
      badge: 'App',
      githubUrl: 'https://github.com/ahmedEhab10/Evently_App',
      features: [
        'Secure authentication system (Login & Registration)',
        'Easy to use and extremely fast navigation',
        'Explore and filter events by various genres',
        'Google Maps integration for clear routes and directions',
        'Scalable Clean Architecture structure separating domain, data, and presentation',
        'Robust state management using BLoC & Cubit',
        'Responsive modern UI with custom animations and onboarding flow',
      ],
      images: [
        'assets/assets/images/Evently_app/Screen1.png',
        'assets/assets/images/Evently_app/Screen2.png',
        'assets/assets/images/Evently_app/Screen3.png',
        'assets/assets/images/Evently_app/Screen4.png',
        'assets/assets/images/Evently_app/Screen5.png',
        'assets/assets/images/Evently_app/Screen6.png',
        'assets/assets/images/Evently_app/Screen7.png',
      ],
    ),
  ];
}
